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
        
        let cacheKey = urlString
        let cache = ImageCache.default
        let cached = cache.isCached(forKey: urlString)
        
        if cached {
            cache.retrieveImage(forKey: cacheKey, completionHandler: { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                    case .success(let value):
                        print("Cache Image: \(value.image) CacheType: \(value.cacheType)")
                        self.imageView1.image = value.image
                    case .failure(let error):
                        print("Error: \(error)")
                }
            })
        }else {
        
            AF.request(urlString)
                .validate()
                .responseDecodable(of: PokemonDetails.self) { [weak self] (response) in
                    guard let pokeDetails = response.value else { print("pokedetails"); return  }
                    guard let self = self else { return }
                    guard let url = URL(string: pokeDetails.imageViewUrl) else { return }
                    
                    
                    print("sending..data: \(pokeDetails.imageViewUrl)")
                    
                    let resource = ImageResource(downloadURL: url, cacheKey: cacheKey)
                    self.imageView1.kf.setImage(with: resource)
                }
        }
        //https://github.com/onevcat/Kingfisher/wiki/Cheat-Sheet
    }
    
    override func prepareForReuse() {
         super.prepareForReuse()
        textLabel1.text = "Loading"
        imageView1.image = nil
        imageView1.kf.indicatorType = .activity
     }
    
}


