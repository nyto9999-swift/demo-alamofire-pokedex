//
//  ProfileStackView.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//
import UIKit
import Kingfisher

final class ProfileStackView: UIStackView {
    
    var data: DisplayablePokemon? //passed data
    
    private lazy var textLabel1: UILabel = textLabel()
    private lazy var textLabel2: UILabel = textLabel()
    private lazy var typeButton1: UIButton = typeButton()
    private lazy var typeButton2: UIButton = typeButton()
    private lazy var imageView: UIImageView = imageView()

    private lazy var textStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var typeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    private func setupViews(){
        self.addArrangedSubviews(imageView, textStackView)
        textStackView.addArrangedSubviews(textLabel1, textLabel2, typeStackView)
        typeStackView.addArrangedSubviews(typeButton1,typeButton2)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    public convenience init() {
        self.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileStackView {
    public func configure(){
        guard let data = data else { return }
        
        let text1 = data.nameLabelText
        let height = data.hwLabelText.height
        let weight = data.hwLabelText.weight
        let type1 = data.typeLabelText.type1
        let type2 = data.typeLabelText.type2

        textLabel1.text = "Name: \(text1)"
        textLabel2.text = "Height: \(height) Weight: \(weight)"
        
        typeButton1.setTitle(type1, for: .normal)
        typeButton1.configuration?.baseBackgroundColor = getTypeColor(for: type1)
        
        if type2 == "" {
            typeButton2.isHidden = true
        }
        else {
            typeButton2.isHidden = false
            typeButton2.setTitle(type2, for: .normal)
            typeButton2.configuration?.baseBackgroundColor = getTypeColor(for: type2)
        }
        
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.kf.setImage(with: URL(string: data.imageViewUrl),
                              options: [
                                .processor(processor)
                              ])
    }
}
