//
//  ProfileStackView.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//
import UIKit
import Kingfisher

final class ProfileStackView: UIStackView {
    var data: DisplayablePokemon?
    
    private lazy var textLabel1: UILabel = textLabel()
    private lazy var textLabel2: UILabel = textLabel()
    private lazy var typeLabel1: UILabel = textLabel()
    private lazy var typeLabel2: UILabel = textLabel()
    private lazy var imageView: UIImageView = imageView()

   
    private lazy var textStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        view.distribution = .fillProportionally
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
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    public convenience init() {
        self.init(frame: .zero)
        configure()
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
        
        self.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        self.isLayoutMarginsRelativeArrangement = true
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension ProfileStackView {
    
    public func configure(){
        
        textLabel1.text = "Name: \(data?.nameLabelText ?? "")"
        textLabel2.text = "Height: \(data?.hwLabelText.height ?? 0) Weight: \(data?.hwLabelText.weight ?? 0)"
        
        typeLabel1.text = "Type: \(data?.typeLabelText.type1 ?? "")"
        
        if data?.typeLabelText.type2 == "" {
            typeLabel2.text = ""
        }
        else {
            typeLabel2.text = "Type: \(data?.typeLabelText.type2 ?? "")"
        }
        
        let processor = DownsamplingImageProcessor(size: imageView.bounds.size)
        imageView.kf.setImage(with: URL(string: data?.imageViewUrl ?? ""),
        options: [
            .processor(processor)
        ])
        
    }
}
