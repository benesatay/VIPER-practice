//
//  Extensions + UIView.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 3.04.2021.
//

import UIKit

extension UIView {
    func addBlurEffect(viewFrame: CGRect, cornerRadius: CGFloat) {
        //set blur effect
        var blurEffect: UIBlurEffect!
        blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
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
