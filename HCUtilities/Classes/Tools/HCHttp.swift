//
//  HCHttp.swift
//  TrainSchedule
//
//  Created by HungChun on 2017/11/30.
//  Copyright © 2017年 TSUMII STUDIO. All rights reserved.
//

import Foundation
typealias StringCallback = (String?,Error?) -> Void
typealias ArrayObjectCallback = ([AnyObject]?,Error?) -> Void
class HCHttp {
    static func getString(url:URL, complete:@escaping StringCallback) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil {
                let result = String.init(data: data!, encoding: .utf8)
                complete(result,nil)
            } else {
                complete(nil,error)
            }
        }
        task.resume()
    }
}

extension URLSession {
    static func getString(url:URL, complete:@escaping StringCallback) {
        let task = self.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if data != nil {
                    let result = String.init(data: data!, encoding: .utf8)
                    complete(result,nil)
                } else {
                    complete(nil,error)
                }
            }
        }
        task.resume()
    }
}
