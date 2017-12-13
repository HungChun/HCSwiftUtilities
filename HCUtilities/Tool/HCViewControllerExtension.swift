//
//  HCViewControllerExtension.swift
//  TrainSchedule
//
//  Created by HungChun on 2017/12/5.
//  Copyright © 2017年 TSUMII STUDIO. All rights reserved.
//

import Foundation
import UIKit
typealias HCAlertVoidCallback = () -> Void

extension UIViewController {
    func showTwoAlert(title:String?,
                          message:String?,
                          done:String,
                          cancel:String?,
                          doneCallback:@escaping HCAlertVoidCallback,
                          cancelCallback:@escaping HCAlertVoidCallback) {
        
        let alert = UIAlertController.init(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: done, style: .default, handler: { (action) in
            doneCallback()
        }))
        if cancel != nil {
            alert.addAction(UIAlertAction.init(title: cancel, style: .cancel, handler: { (action) in
                cancelCallback()
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func showOneButtonAlert(title:String?,
                          message:String?,
                          done:String,
                          doneCallback:@escaping HCAlertVoidCallback) {
        
        let alert = UIAlertController.init(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: done, style: .default, handler: { (action) in
            doneCallback()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
