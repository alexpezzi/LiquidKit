//
//  Date+Additions.swift
//  LiquidKit
//
//  Created by alexpezzi on 2020-09-30.
//

import Foundation

extension Date {
    
    func strfFormattedTime(format: String) -> String? {
        let resultSize = format.count + 200
        var result = [Int8](repeating: 0, count: resultSize)
        var currentTime = time(nil)
        var time = localtime(&currentTime).pointee
        guard strftime(&result, resultSize, format, &time) != 0 else {
            return nil
        }
        return String(cString: result, encoding: .utf8)
    }
}
