//
//  Util.swift
//  Mortify
//
//  Created by Влад Бокин on 02.07.2022.
//

import Foundation
import UIKit

fileprivate var aView : UIView?

extension UIViewController{
    func showSpiner(){
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let ai = UIActivityIndicatorView(style: .large)
        ai.center = aView!.center
        ai.startAnimating()
        aView!.addSubview(ai)
        self.view.addSubview(aView!)
        
//        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (t) in
//            self.removeSpiner()
//            
//        }
    }
    
    func removeSpiner(){
        aView?.removeFromSuperview()
        aView = nil
        
    }
}
