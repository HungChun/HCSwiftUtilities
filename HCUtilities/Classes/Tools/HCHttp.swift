//
//  HCHttp.swift
//  TrainSchedule
//
//  Created by HungChun on 2017/11/30.
//  Copyright © 2017年 TSUMII STUDIO. All rights reserved.
//

import Foundation
public typealias StringCallback = (String?,Error?) -> Void
public typealias ArrayObjectCallback = ([AnyObject]?,Error?) -> Void

extension URLSession {
    public static func getString(url:URL, complete:@escaping StringCallback) {
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
