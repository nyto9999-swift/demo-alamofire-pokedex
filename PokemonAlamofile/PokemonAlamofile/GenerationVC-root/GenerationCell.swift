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

    public lazy var imageView1: UIImageView = imageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(imageView1)
        setupConstraints()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        imageView1.pin(to: contentView)
    }
    
    
    func configure(for index: Int){
        
        self.imageView1.image = UIImage(named: "g\(index + 1)")
    }

}


