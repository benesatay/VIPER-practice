//
//  Extensions + UIActivityIndicatorView.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit
extension UIActivityIndicatorView {
    func showActivityIndicator(superView: UIView) {
        self.style = .medium
        self.frame = superView.bounds
        self.backgroundColor = .white
        self.alpha = 0.7
        superView.addSubview(self)
        self.startAnimating()
    }
    
    func hideActivityIndicator(){
        self.stopAnimating()
    }
}
