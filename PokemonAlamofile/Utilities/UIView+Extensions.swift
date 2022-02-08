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
}
