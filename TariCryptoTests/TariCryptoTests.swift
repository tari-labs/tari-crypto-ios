/*
    Copyright 2019 The Tari Project

    Redistribution and use in source and binary forms, with or
    without modification, are permitted provided that the
    following conditions are met:

    1. Redistributions of source code must retain the above copyright notice,
    this list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above
    copyright notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

    3. Neither the name of the copyright holder nor the names of
    its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
    CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
    INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
    CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
    NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
    HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
    CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
    OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import XCTest
@testable import TariCrypto

class TariCryptoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testKeyFromHex() {
        let keyPair = TariKeyPair.generateRandom()
        let publicKeyFromHexString = "\(keyPair.publicKey)"
        XCTAssertEqual("\(keyPair.publicKey)", "\(publicKeyFromHexString)")
    }
    
    func testSignatureVerification() throws {
        let message = "A random message."
        let keyPair = TariKeyPair.generateRandom()
        print("Generated key pair: \(keyPair)")
        let signedMessage = try keyPair.privateKey.signMessage(message: message)
        print("Signed message: \(signedMessage)")
        XCTAssertTrue(try keyPair.publicKey.verifySignature(signedMessage: signedMessage))
        // also try to verify with hex-generated public key
        let publicKeyFromHex = TariKey(hexString: "\(keyPair.publicKey)")
        XCTAssertNotNil(publicKeyFromHex)
        XCTAssertTrue(try publicKeyFromHex?.verifySignature(signedMessage: signedMessage) ?? false)
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
    
    /*
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    */

}
