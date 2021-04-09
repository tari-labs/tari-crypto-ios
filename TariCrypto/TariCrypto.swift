//
//  TariCrypto.swift
//  TariCrypto
//
//  Created by kutsal kaan bilgin on 9.04.2021.
//

import Foundation

public class TariCrypto {
    
    public static func getVersion() -> String {
        return String(cString: version())
    }
    
}
