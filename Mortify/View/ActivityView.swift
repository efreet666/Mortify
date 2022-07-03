//
//  Util.swift
//  Mortify
//
//  Created by Влад Бокин on 02.07.2022.
//

import Foundation
import UIKit

private var aView: UIView?

extension UIViewController {
    func showSpiner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = aView!.center
        activityIndicator.startAnimating()
        aView!.addSubview(activityIndicator)
        self.view.addSubview(aView!)

//        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (t) in
//            self.removeSpiner()
//            
//        }
    }

    func removeSpiner() {
        aView?.removeFromSuperview()
        aView = nil

    }
}
