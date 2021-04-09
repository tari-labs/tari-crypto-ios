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
