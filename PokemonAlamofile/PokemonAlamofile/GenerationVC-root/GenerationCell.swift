//
//  PokemonCell.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/11.
//

import UIKit
import Kingfisher
import Alamofire

final class GenerationCell: UITableViewCell {
    
    static let identifier = "GenerationCell"
    public lazy var textLabel1: UILabel = textLabel(align: .center)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(textLabel1)
        setupConstraints()
    }

    func setupConstraints(){
        textLabel1.pin(to: contentView)
    }
    
    func configure(for index: Int){
        textLabel1.text = gens[index]
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


