//
//  TariUtil.swift
//  TariCrypto
//
//  Created by kutsal kaan bilgin on 9.04.2021.
//

import Foundation

func bytesToHexString(bytes: ByteArray) -> String {
    return String(format: "%02X", bytes.0) + String(format: "%02X", bytes.1)
        + String(format: "%02X", bytes.2) + String(format: "%02X", bytes.3)
        + String(format: "%02X", bytes.4) + String(format: "%02X", bytes.5)
        + String(format: "%02X", bytes.6) + String(format: "%02X", bytes.7)
        + String(format: "%02X", bytes.8) + String(format: "%02X", bytes.9)
        + String(format: "%02X", bytes.10) + String(format: "%02X", bytes.11)
        + String(format: "%02X", bytes.12) + String(format: "%02X", bytes.13)
        + String(format: "%02X", bytes.14) + String(format: "%02X", bytes.15)
        + String(format: "%02X", bytes.16) + String(format: "%02X", bytes.17)
        + String(format: "%02X", bytes.18) + String(format: "%02X", bytes.19)
        + String(format: "%02X", bytes.20) + String(format: "%02X", bytes.21)
        + String(format: "%02X", bytes.22) + String(format: "%02X", bytes.23)
        + String(format: "%02X", bytes.24) + String(format: "%02X", bytes.25)
        + String(format: "%02X", bytes.26) + String(format: "%02X", bytes.27)
        + String(format: "%02X", bytes.28) + String(format: "%02X", bytes.29)
        + String(format: "%02X", bytes.30) + String(format: "%02X", bytes.31)
}
