Pod::Spec.new do |spec|

  spec.name         = "TariCrypto"
  spec.version      = "0.9.0"
  spec.summary      = "iOS wrapper for the Tari Crypto library, a part of the Tari Cryptocurrency project."

  spec.description  = <<-DESC
This framework is a wrapper around the [Tari Crypto](https://github.com/tari-project/tari-crypto) library, a part of the [Tari Cryptocurrency](https://tar.com) project. It contains the native crypto library and the header file, and the necessary wrapper and model classes to enable the developers to generate key pairs, sign messages and verify message signatures.

Please visit the [GitHub repository](https://github.com/tari-labs/tari-crypto-ios) for details and examples.
                   DESC

  spec.homepage = "https://github.com/tari-labs/tari-crypto-ios"

  spec.license = "3-Clause BSD License"
  spec.author = { "The Tari Development Team" => "info@tari.com" }

  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5"
  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64 x86_64', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'VALID_ARCHS' => 'arm64 x86_64', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  spec.source = { :git => "https://github.com/tari-labs/tari-crypto-ios.git", :tag => "#{spec.version}" }
  spec.source_files = "TariCrypto/**/*.{h,swift}"
  spec.ios.vendored_library = 'TariCrypto/TariLib/libtari_crypto.a'

end