//
//  UIView+Extensions.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import UIKit
import Kingfisher

public extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -20.0).isActive = true
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

public extension UIImageView {
   func loadImage(_ url : URL?) {
       self.kf.indicatorType = .activity
       self.kf.setImage(with: url)
   }

   func loadImage(_ url : String?) {
       guard let urlStr = url else {return}
       self.kf.setImage(with: URL.init(string: urlStr))
   }
        
    func loadImage(_ url : ImageResource?) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }

}



public var logoUrl = [
    "https://archives.bulbagarden.net/media/upload/archive/5/55/20210623191331%21Lets_Go_Pikachu_Logo_JP.png",
    "https://archives.bulbagarden.net/media/upload/9/90/HeartGold_logo.png",
    "https://archives.bulbagarden.net/media/upload/8/8c/Pokemon_FireRed_Logo_JP.png",
    "https://archives.bulbagarden.net/media/upload/a/ae/Pokemon_Pearl_Logo_JP.png",
    "https://archives.bulbagarden.net/media/upload/thumb/a/ae/Pokémon_Black_EN_logo.png/320px-Pokémon_Black_EN_logo.png",
    "https://archives.bulbagarden.net/media/upload/thumb/4/4c/Pokémon_XY_logo.png/320px-Pokémon_XY_logo.png",
    "https://archives.bulbagarden.net/media/upload/c/c7/Pokemon_Sun_logo.png",
    "https://archives.bulbagarden.net/media/upload/thumb/f/f4/Sword_Shield_Expansion_Pass_logo_EN.png/320px-Sword_Shield_Expansion_Pass_logo_EN.png"
]
