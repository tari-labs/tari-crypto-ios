//
//  Key.swift
//  TariCrypto
//
//  Created by kutsal kaan bilgin on 9.04.2021.
//

import Foundation

public struct TariKey: CustomStringConvertible {
 
    public let bytes: ByteArray
    
    init() {
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
