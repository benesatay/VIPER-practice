//
//  PopularContentCell.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class PopularContentCell: BaseCell {
    
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    let voteLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.textAlignment = .left
        return label
    }()
    
    let voteCountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = UIColor.white.withAlphaComponent(0.6)
        label.textAlignment = .left
        return label
    }()
    
    let voteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.tintColor = UIColor.white.withAlphaComponent(0.6)
        return imageView
    }()
    
    let voteCountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.tintColor = UIColor.white.withAlphaComponent(0.6)
        return imageView
    }()
    
    override func setupViews() {
        setAppearence()
        setupImageView()
    }
    
    private func setAppearence() {
        self.setCellShadow(shadowOpacity: 0.2, shadowRadius: 20)
        self.layer.cornerRadius = 20
    }
    
    private func setupImageView() {
        posterImageView.frame = self.bounds
        self.addSubview(posterImageView)
        setNameLabel()
        setupVoteStack()
    }
    
    private func setupVoteStack() {
        let stackView = UIStackView()
        let backgroundView = setBackgroundView(maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        stackView.insertSubview(backgroundView, at: 0)
        
        let voteStack = UIStackView()
        voteStack.setCustomStackView(arrangedSubviewArray: [voteImageView, voteLabel], axis: .horizontal, spacing: 5, topSpace: 0, leftSpace: 0, bottomSpace: 0, rightSpace: 0)
   
        let voteCountStack = UIStackView()
        voteCountStack.setCustomStackView(arrangedSubviewArray: [voteCountImageView, voteCountLabel], axis: .horizontal, spacing: 5, topSpace: 0, leftSpace: 0, bottomSpace: 0, rightSpace: 0)
        
        stackView.setCustomStackView(arrangedSubviewArray: [voteCountStack, voteStack], axis: .horizontal, spacing: 0, topSpace: 12, leftSpace: 10, bottomSpace: 12, rightSpace: 10)
        self.posterImageView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 40),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    private func setNameLabel() {
        let backgroundView = setBackgroundView(maskedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        self.posterImageView.addSubview(backgroundView)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    private func setBackgroundView(maskedCorners: CACornerMask) -> UIView {
        let viewFrame = CGRect(
            origin: .zero,
            size: CGSize(width: self.frame.width, height: 40)
        )
        let backgroundView = UIView(frame: viewFrame)
        backgroundView.backgroundColor = .clear
        backgroundView.addBlurEffect(viewFrame: backgroundView.bounds, cornerRadius: 20)
        backgroundView.alpha = 0.5
        let blurView = backgroundView.subviews[0] as! UIVisualEffectView
        blurView.layer.maskedCorners = maskedCorners
        return backgroundView
    }
}
