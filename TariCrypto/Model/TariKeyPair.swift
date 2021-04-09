//
//  KeyPair.swift
//  TariCrypto
//
//  Created by kutsal kaan bilgin on 9.04.2021.
//

import Foundation

public struct TariKeyPair: CustomStringConvertible {
    
    public let privateKey: TariKey
    public let publicKey: TariKey
    
    public static func generateRandom() -> TariKeyPair {
        // FFI interface needs to change, this can be done cleaner
        // (C arrays are imported in swift as arrays of tuples, not values)
        var privateKeyBytes: ByteArray = (
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0)
        )
        var publicKeyBytes: ByteArray = (
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0),
            UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0), UInt8(0)
        )
        // Int should come out as an inout parameter rather than a return value for clarity
        // (see verify() method in header), method need not have a return value (i.e void)
        random_keypair(&privateKeyBytes, &publicKeyBytes)
        return TariKeyPair(
            privateKey: TariKey(bytes: privateKeyBytes),
            publicKey: TariKey(bytes: publicKeyBytes)
        )
    }
    
    public var description: String {
        return "TariKeyPair{"
            + "privateKey='\(privateKey)'"
            + ", publicKey='\(publicKey)'"
            + "}"
    }
    
}
