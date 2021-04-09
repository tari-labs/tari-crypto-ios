//
//  TariError.swift
//  TariCrypto
//
//  Created by kutsal kaan bilgin on 9.04.2021.
//

import Foundation

public struct TariError: Error {
    
    public let errorCode: Int32
    public let errorDescription: String
    
    init(errorCode: Int32) {
        self.errorCode = errorCode
        self.errorDescription = TariError.lookupErrorCode(errorCode)
    }
    
    private static func lookupErrorCode(_ errorCode: Int32) -> String {
        // FFI interface needs to change, there is a safer and simpler way to do this,
        // this can be eliminated, see below comment and conversion after that
        let length: Int32 = 129
        // allocation/deallocation should be kept on the same side of the boundary,
        // only pointers and primitive types should cross, furthermore memory alignment
        // is not guaranteed via FFI
        var buffer: [Int8] = [Int8](repeating: 0, count: Int(length))
        // buffer length is returned by function at the end, should return 0 according to the header
        lookup_error_message(errorCode, &buffer, length)
        let string = String(cString: buffer)
        return string
    }
    
}
