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
}

public extension UIStackView {
  func addArrangedSubviews(_ views: UIView...) {
    for view in views {
      addArrangedSubview(view)
    }
  }
    
    func stateRow() -> UIStackView  {
        let view = UIStackView()
        view.axis = .vertical
        view.sizeToFit()
        view.distribution = .fill
        view.layoutIfNeeded()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 50)
        ])
        return view
    }
    
    func stateLabel() -> UILabel {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func textLabel() -> UILabel {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func stateBar() -> UIProgressView {
        let view = UIProgressView()
         view.progressViewStyle = .bar
         view.progressTintColor = .systemGreen
         view.trackTintColor = .darkGray
         view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 15)
        ])
        return view
    }
}


