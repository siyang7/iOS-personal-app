//
//  Date+convertToString.swift
//  NotePad
//
//  Created by Si-Yang Wu on 2018-04-14.
//  Copyright © 2018 Si-Yang Wu. All rights reserved.
//

import Foundation
import TraceLog

extension Date {
    func convertToString() -> String {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

extension NSDate {
    func convertToString() -> String {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
