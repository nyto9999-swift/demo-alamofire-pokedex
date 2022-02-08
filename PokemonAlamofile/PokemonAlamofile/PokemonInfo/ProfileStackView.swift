//
//  ProfileStackView.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import Foundation
import UIKit


final class ProfileStackView: UIStackView {
    
    private lazy var textLabel1: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = .red
        return textLabel
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addArrangedSubview(textLabel1)
    }
    
    private func setupConstraints(){
        
    }
}

extension ProfileStackView {
    public func configureProfile(){
        textLabel1.text = "text1"
    }
}
