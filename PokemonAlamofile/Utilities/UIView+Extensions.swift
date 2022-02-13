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


func getTypeColor(for type: String) -> UIColor {
        switch type {
            case "normal":
                return .lightGray
            case "grass":
                return .systemGreen
            case "fire":
                return .orange
            case "water":
                return .systemBlue
            case "electric":
                return .systemYellow
            case "ice":
                return .systemCyan
            case "fighting":
                return .systemRed
            case "poison":
                return .purple
            case "flying":
                return .systemCyan
            case "psychic":
                return .systemPink
            case "bug":
                return .green
            case "rock":
                return .brown
            case "ghost":
                return .systemPurple
            case "ground":
                return .systemBrown
            case "dark":
                return .darkGray
            case "dragon":
                return .purple
            case "steel":
                return .systemGray3
            case "fairy":
                return .systemPink
            default:
                return .white
        }
}

var gens = ["Yellow", "Gold.Sliver", "Ruby.Sapphire", "Diamand.Pearl", "Black.White", "X.Y", "Sun.Moon", "Sword.Shield"]

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
