//
//  PokemonCell.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/11.
//

import UIKit
import Kingfisher
import Alamofire

final class PokemonCell: UITableViewCell {
    
    static let identifier = "PokemonCell"
    
    private lazy var textLabel1: UILabel = textLabel()
    public lazy var imageView1: UIImageView = imageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(imageView1, textLabel1)
        
        setupConstraints()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            textLabel1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            textLabel1.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 5),
            textLabel1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(for urlString:String, text: String){
        textLabel1.text = text
        
        
        AF.request(urlString)
            .validate()
            .responseDecodable(of: PokemonDetails.self) { [weak self] (response) in
                guard let pokeDetails = response.value else { print("pokedetails"); return  }
                
                print("sending..data: \(pokeDetails.imageViewUrl)")
                
                guard let self = self else {
                    return
                }

                
                self.imageView1.kf.setImage(with: URL(string: pokeDetails.imageViewUrl))
            }
        
    }
    
    override func prepareForReuse() {
         super.prepareForReuse()
        textLabel1.text = ""
        imageView1.image = nil
     }
    
}


