//
//  HCDateExtension.swift
//  TrainSchedule
//
//  Created by HungChun on 2017/12/1.
//  Copyright © 2017年 TSUMII STUDIO. All rights reserved.
//

import Foundation
enum TimeDateUnit
{
    case Day,Hour,Minute,Second
}
extension Date {
    static func format(formatString:String,dateString:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter.date(from: dateString)!
    }
    
    var year: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.year, from: self)
    }
    
    var month: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.month, from: self)
    }
    
    var day: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.day, from: self)
    }
    
    var hour: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.hour, from: self)
    }
    
    var minute: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.minute, from: self)
    }
    
    var second: Int {
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        return gregorian.component(Calendar.Component.second, from: self)
    }
    
    func add(unit:TimeDateUnit,mount:Int) -> Date {
        return self.addingTimeInterval(Double(increaseTime(unit: unit) * mount))
    }
    
    func subtract(unit:TimeDateUnit,mount:Int) -> Date {
        return self.addingTimeInterval(-Double(increaseTime(unit: unit) * mount))
    }
    
    func increaseTime(unit:TimeDateUnit) -> Int {
        var increase = 0
        switch unit {
        case .Day:
            increase = 24 * 60 * 60
        case .Hour:
            increase = 60 * 60
        case .Minute:
            increase = 60
        case .Second:
            increase = 1
        }
        return increase;
    }
    
    func toString(format:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
