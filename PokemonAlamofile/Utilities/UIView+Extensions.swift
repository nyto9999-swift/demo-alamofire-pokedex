//
//  UIView+Extensions.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import UIKit

public extension UIView {
    
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
    
    func textLabel() -> UILabel {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = .left
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


