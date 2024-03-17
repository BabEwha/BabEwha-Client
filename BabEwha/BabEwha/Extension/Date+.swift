//
//  Date+.swift
//  BabEwha
//
//  Created by sole on 3/17/24.
//

import Foundation

extension Date {
    var hour: Int {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "HH"
        return Int(dateFormatter.string(from: self)) ?? 0
    }
    
    var minute: Int {
        let dateFormatter: DateFormatter = .init()
        dateFormatter.dateFormat = "mm"
        return Int(dateFormatter.string(from: self)) ?? 0
    }
}
