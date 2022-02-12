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
            imageView1.heightAnchor.constraint(equalToConstant: 96.0),
            imageView1.widthAnchor.constraint(equalToConstant: 96.0)
        ])
        NSLayoutConstraint.activate([
            textLabel1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            textLabel1.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 5),
            textLabel1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func configure(for urlString:String, title: String){
        
        textLabel1.text = title
        
        let cacheKey = urlString
        let cache = ImageCache.default
        let cached = cache.isCached(forKey: urlString)
        
        if cached {
            cache.retrieveImage(forKey: cacheKey, completionHandler: { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                    case .success(let value):
                        self.imageView1.image = value.image
                        
//                        print("Cache Image: \(String(describing: value.image)) CacheType: \(value.cacheType)")
//                        print("Height: \(self.imageView1.frame.height)  Width: \(self.imageView1.frame.width)")
                    case .failure(let error):
                        print("Error: \(error)")
                }
            })
        }else {
            AF.request(urlString)
                .validate()
                .responseDecodable(of: PokemonDetails.self) { [weak self] (response) in
                    
                    guard let pokeDetails = response.value,
                          let url = URL(string: pokeDetails.imageViewUrl),
                          let self = self
                    else { return }

                    print("sending..data: \(pokeDetails.imageViewUrl)")
                    
                    let resource = ImageResource(downloadURL: url, cacheKey: cacheKey)
                    
                    self.imageView1.kf.indicatorType = .activity
                    self.imageView1.kf.setImage(
                        with: resource,
                        options: [.waitForCache,
                                  .transition(.flipFromLeft(0.4))
                                 ],
                        progressBlock: { receivedSize,totalSize in
                            let percentage = (Float(receivedSize) / Float(totalSize)) * 100.0
                            print("dowloading progress: \(percentage)%")
                        },
                        completionHandler: { result in
                            switch result {
                                case .success(let result):
                                    self.imageView1.sizeThatFits(result.image.size)
                                case .failure(let error):
                                    print(error)
                            }
                        })
                    
                }
        }
        //https://github.com/onevcat/Kingfisher/wiki/Cheat-Sheet
    }
}


