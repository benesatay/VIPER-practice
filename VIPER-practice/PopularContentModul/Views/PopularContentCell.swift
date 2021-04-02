//
//  PopularContentCell.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class EntityCell: BaseCell {
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        self.setCellShadow(shadowOpacity: 0.2, shadowRadius: 20)
        self.layer.cornerRadius = 20
        imageView.frame = self.bounds
        self.addSubview(imageView)
    }
}
