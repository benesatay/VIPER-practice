//
//  BaseReusableView.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class BaseReusableView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }

    func setupViews() {
     
    }
    
}
