//
//  AbilityCollectionViewCell.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/10.
//

import UIKit

class AbilityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AbilityColeectionViewCell"
    var data: String?
    
    private lazy var textLabel: UILabel = {
       let view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.sizeToFit()
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemGray6
        setupViews()
        setupConstraints()
    }
    
    public convenience init(){
        self.init(frame: .zero)
        configure()
    }
    
    private func setupViews(){
        contentView.addSubviews(textLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            textLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            textLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {

        guard let data = data else { return }
        
        textLabel.text = data
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel.text = ""
        
    }

}
