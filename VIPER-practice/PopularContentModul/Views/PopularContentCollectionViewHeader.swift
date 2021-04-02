//
//  PopularContentCollectionViewHeader.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class PopularContentCollectionViewHeader: BaseReusableView {

    var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        ///create segments
        segmentedControl.insertSegment(withTitle: "TV", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Movie", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        ///set selected segment  text color
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        ///set selected segment tint color
        let tintColor = UIColor(red: 232/255, green: 92/255, blue: 74/255, alpha: 1)
        segmentedControl.selectedSegmentTintColor = tintColor
        return segmentedControl
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(segmentedControl)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            segmentedControl.heightAnchor.constraint(equalToConstant: self.frame.height-10),
            segmentedControl.widthAnchor.constraint(equalToConstant: self.frame.width-40),
            segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
