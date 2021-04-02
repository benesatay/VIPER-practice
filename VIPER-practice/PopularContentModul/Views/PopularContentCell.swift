//
//  PopularContentCell.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class PopularContentCell: BaseCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let voteLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        setAppearence()
        setupImageView()
        setupLabel()
    }
    
    private func setAppearence() {
        self.setCellShadow(shadowOpacity: 0.2, shadowRadius: 20)
        self.layer.cornerRadius = 20
    }
    
    private func setupImageView() {
        imageView.frame = self.bounds
        self.addSubview(imageView)
    }
    
    private func setupLabel() {
        let viewFrame = CGRect(
            x: 0, y: self.frame.height-40,
            width: self.frame.width, height: 40)
        
        let backgroundView = UIView(frame: viewFrame)
        backgroundView.backgroundColor = .clear
        backgroundView.addBlurEffect(viewFrame: backgroundView.bounds, cornerRadius: 20)
        backgroundView.alpha = 0.8
        self.addSubview(backgroundView)

        let blurView = backgroundView.subviews[0] as! UIVisualEffectView
        blurView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        voteLabel.frame = backgroundView.bounds
        backgroundView.addSubview(voteLabel)
    }
    
 
}
