//
//  UIView+Extensions.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import UIKit
import Kingfisher

public extension UIViewController {
    
    func textLabel(align: NSTextAlignment? = .left) -> UILabel {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = align!
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

public extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -20.0).isActive = true
    }
    
    
    func typeButton() -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        configuration.baseBackgroundColor = .white
        let view = UIButton(configuration: configuration)
        view.setTitleColor(.black, for: .normal)
        return view
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    
    func statRow() -> UIStackView  {
        let view = UIStackView()
        view.axis = .vertical
        view.sizeToFit()
        view.distribution = .fill
        view.layoutIfNeeded()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 50),
        ])
        return view
    }
    
    func textLabel(align: NSTextAlignment? = .left) -> UILabel {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = align!
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func imageView() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.layer.cornerRadius = 8
        image.sizeToFit()
        image.layoutIfNeeded()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    func stateBar() -> UIProgressView {
        let view = UIProgressView()
        view.progressViewStyle = .bar
        view.trackTintColor = .systemGray6
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 24)
        ])
        return view
    }
}

public extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}


