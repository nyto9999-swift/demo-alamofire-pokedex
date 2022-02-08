//
//  ProfileStackView.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import Foundation
import UIKit


final class ProfileStackView: UIStackView {
    private let padding: CGFloat = 8
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .white
        image.layer.cornerRadius = 8
        image.sizeToFit()
        image.layoutIfNeeded()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var textStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textLabel1: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = .left
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textLabel2: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = .left
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeLabel1: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = .left
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeLabel2: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.textAlignment = .left
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        configureProfile()
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addArrangedSubviews(imageView, textStackView)
        textStackView.addArrangedSubviews(textLabel1, textLabel2, typeStackView)
        typeStackView.addArrangedSubviews(typeLabel1,typeLabel2)
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        
    }
}

extension ProfileStackView {
    public func configureProfile(){
        textLabel1.text = "Name: bulbasaur"
        textLabel2.text = "Heif"
        typeLabel1.text = "Fire"
        typeLabel2.text = "Posision"
        imageView.image = UIImage(systemName: "circle")
    }
}
