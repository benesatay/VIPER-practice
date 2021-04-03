//
//  Extensions + UIView.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 3.04.2021.
//

import UIKit

extension UIView {
    
    func addBackground(blurEffectIsOn: Bool, color: UIColor, shadowColor: UIColor, borderColor: UIColor, shadowOpacity: Float, shadowRadius: CGFloat, cornerRadius: CGFloat, alpha: CGFloat) {
        let subView = UIView()
        subView.frame = bounds
        subView.backgroundColor = color
        subView.layer.cornerRadius = cornerRadius
        subView.alpha = alpha
        subView.layer.borderWidth = 1.0
        subView.layer.borderColor = borderColor.cgColor
        subView.layer.shadowOffset = CGSize(width: 1, height: 1)
        subView.layer.shadowColor = shadowColor.cgColor
        subView.layer.shadowRadius = shadowRadius
        subView.layer.shadowOpacity = shadowOpacity
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        if blurEffectIsOn {
            subView.addBlurEffect(viewFrame: subView.bounds, cornerRadius: cornerRadius)
        }
        insertSubview(subView, at: 0)
    }
    
    func addBlurEffect(viewFrame: CGRect, cornerRadius: CGFloat) {
        //set blur effect
        var blurEffect: UIBlurEffect!
        blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        //set vibrancy View
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.frame = viewFrame
        let optionsView = UIView()
        optionsView.frame = viewFrame
        vibrancyView.contentView.addSubview(optionsView)
        //set blur view
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = viewFrame
        blurView.contentView.addSubview(vibrancyView)
        blurView.layer.cornerRadius = cornerRadius
        blurView.clipsToBounds = true
        self.insertSubview(blurView, at: 0)
    }
}
