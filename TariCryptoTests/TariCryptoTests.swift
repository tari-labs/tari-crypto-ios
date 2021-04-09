//
//  TariCryptoTests.swift
//  TariCryptoTests
//
//  Created by kutsal kaan bilgin on 9.04.2021.
//

import XCTest
@testable import TariCrypto

class TariCryptoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignatureVerification() throws {
        let message = "A random message."
        let keyPair = TariKeyPair.generateRandom()
        print("Generated key pair: \(keyPair)")
        let signedMessage = try keyPair.privateKey.signMessage(message: message)
        print("Signed message: \(signedMessage)")
        XCTAssertTrue(try keyPair.publicKey.verifySignature(signedMessage: signedMessage))
    }

    func testSignatureFailure() throws {
        let message = "Another random message."
        let keyPair = TariKeyPair.generateRandom()
        let signedMessage = try keyPair.publicKey.signMessage(message: message)
        XCTAssertFalse(try keyPair.publicKey.verifySignature(signedMessage: signedMessage))
    }
    
    func testSignatureFailureWithEmptyPrivateKey() throws {
        let message = "Another random message."
        let emptyPrivateKey = TariKey()
        let keyPair = TariKeyPair.generateRandom()
        print("Empty private key: \(emptyPrivateKey)")
        let signedMessage = try emptyPrivateKey.signMessage(message: message)
        XCTAssertFalse(try keyPair.publicKey.verifySignature(signedMessage: signedMessage))
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}
