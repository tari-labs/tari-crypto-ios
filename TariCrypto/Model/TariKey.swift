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

import Foundation

/**
 * Private or public key. Can sign a message and verify a signed message.
 */
public struct TariKey: CustomStringConvertible {
 
    public let bytes: ByteArray
    
    public init() {
        self.bytes = (
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0)
        )
    }
    
    init(bytes: ByteArray) {
        self.bytes = bytes
    }
    
    public init?(hexString: String) {
        if let bytes = hexStringToBytes(hexString: hexString) {
            self.bytes = bytes
        } else {
            return nil
        }
    }
    
    public func signMessage(message: String) throws -> TariSignedMessage {
        // FFI interface needs to change, this can be done cleaner
        // (C arrays are imported in swift as arrays of tuples, not values)
        var signature: ByteArray = (
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0)
        )
        var nonce: ByteArray = (
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0)
        )
        let messagePointer = (message as NSString).utf8String
        var bytes = self.bytes
        // Int should come out as an inout parameter rather than a return value for clarity
        // (see verify() method in header), method need not have a return value (i.e void)
        let errorCode = sign(&bytes, messagePointer, &nonce, &signature)
        guard errorCode == 0 else {
            throw TariError(errorCode: errorCode)
        }
        return TariSignedMessage(
            message: message,
            signature: signature,
            nonce: nonce
        )
    }
    
    public func verifySignature(signedMessage: TariSignedMessage) throws -> Bool {
        // Note on FFI interface, errorCode seems unnecessary for this function
        // could purely just be a boolean
        var errorCode: Int32 = 0
        let messagePointer = (signedMessage.message as NSString).utf8String
        var keyBytes = bytes
        var nonce = signedMessage.nonce
        var signature = signedMessage.signature
        let result = verify(&keyBytes, messagePointer, &nonce, &signature, &errorCode)
        guard errorCode == 0 else {
            throw TariError(errorCode: errorCode)
        }
        return result
    }
    
    public var description: String { return bytesToHexString(bytes: bytes) }
    
}
