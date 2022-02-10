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
    
    private let button: UIButton = {
       let view = UIButton()
        view.setTitle("Ability", for: .normal)
        view.backgroundColor = .green
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemPink
        setupViews()
        setupConstraints()
        
    }
    
    public convenience init(){
        self.init(frame: .zero)
        configure()
    }
    
    private func setupViews(){
        contentView.addSubviews(button)
    }
    
    private func setupConstraints(){
        button.frame = contentView.frame
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {

        guard let data = data else { return }
        button.setTitle(data, for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
    }

}
