//
//  SignedMessage.swift
//  TariCrypto
//
//  Created by kutsal kaan bilgin on 9.04.2021.
//

import Foundation

public struct TariSignedMessage: CustomStringConvertible {
    
    public let message: String
    public let signature: ByteArray
    public let nonce: ByteArray
    
    public var description: String {
        return "TariSignedMessage{"
            + "message='\(message)'"
            + ", signature='\(bytesToHexString(bytes: signature))'"
            + ", nonce='\(bytesToHexString(bytes: nonce))'"
            + "}";
    }
    
}
