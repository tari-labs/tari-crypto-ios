# Tari Crypto iOS

This iOS framework is a wrapper around the [Tari Crypto](https://github.com/tari-project/tari-crypto) library. It contains the native crypto library and the header file, and the necessary wrapper and model classes to enable the developers to generate key pairs, sign messages and verify message signatures.

## Requirements

- iOS 10.0+

## Installation

### Using Cocoapods

#### CocoaPods (iOS 10+)

You can use [CocoaPods](http://cocoapods.org/) to install `TariCrypto` by adding it to your `Podfile`:

```ruby
use_frameworks!

target 'MyApp' do
    pod 'TariCrypto'
end
```

## Usage

Sample program that illustrates message signing and verification:

```swift
import TariCrypto

// create a key pair from hex string representations, and sign & verify
let keyPairFromHex = TariKeyPair(
    privateKey: TariKey(hexString: "A35F68A5054C9721874CDE2553B80F98338952783C6E1687A2E8454B0D5BA200")!,
    publicKey: TariKey(hexString: "50C5624924CE9B806FE40A94CA20B029DB6AC6DA098B3E48B89CE2695B265E71")!
)
let message = "A random message."
let signedMessage = try keyPairFromHex.privateKey.signMessage(message: message)
var isVerified = try keyPairFromHex.publicKey.verifySignature(signedMessage: signedMessage)
print("Is first message verified? \(isVerified)")

// or, do the same with a random key pair, and sign & verify
let randomKeyPair = TariKeyPair.generateRandom()
let anotherMessage = "Another random message."
let anotherSignedMessage = try randomKeyPair.privateKey.signMessage(message: anotherMessage)
isVerified = try randomKeyPair.publicKey.verifySignature(signedMessage: anotherSignedMessage)
print("Is second message verified? \(isVerified)")
```

Program output:

```
Is first message verified? true
Is second message verified? true
```

## Testing

- Clone the project with `git clone https://github.com/tari-labs/tari-crypto-ios.git`.
- Open the project `TariCrypto.xcodeproj`.
- Run the tests in [TariCryptoTests.swift](TariCryptoTests/TariCryptoTests.swift) with `Command+U` or through the menu `Product -> Test`.