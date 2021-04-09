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
