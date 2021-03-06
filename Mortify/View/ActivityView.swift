//
//  Util.swift
//  Mortify
//
//  Created by Влад Бокин on 02.07.2022.
//

import UIKit


//MARK: - Activity view indicator

private var aView: UIView?

extension UIViewController {
    func showSpiner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.black

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
