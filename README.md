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

Please view [TariCryptoTests.swift](TariCryptoTests/TariCryptoTests.swift) for usage examples.

## Testing

- Clone the project with `git clone https://github.com/tari-labs/tari-crypto-ios.git`.
- Open the project `TariCrypto.xcodeproj`.
- Run the tests in [TariCryptoTests.swift](TariCryptoTests/TariCryptoTests.swift) with `Command+U` or through the menu `Product -> Test`.