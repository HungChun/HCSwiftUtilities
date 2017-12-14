//
//  HCStringExtension.swift
//  TrainSchedule
//
//  Created by HungChun on 2017/12/1.
//  Copyright © 2017年 TSUMII STUDIO. All rights reserved.
//

import Foundation
extension String {
    public func subStringFromThenTo(from:String,to:String) -> String? {
        guard let fromRange = self.range(of:from) else {
            return nil
        }
        let str1 = self[fromRange.upperBound...]
        guard let toRange = str1.range(of:to) else {
            return nil
        }
        return "\(str1[..<toRange.lowerBound])"
    }
    
    public func removeBeforeFirstString(target:String) -> String? {
        
        guard let targetRange = self.range(of:target) else {
            return nil
        }
        return "\(self[targetRange.upperBound...])"
    }
}
