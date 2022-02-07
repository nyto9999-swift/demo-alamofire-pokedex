//
//  Pokemon.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/7.
//

struct Pokemon: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
      case name
      case url
    }
}

extension Pokemon: Displayable {
    var titleLabelText: String {
        name
    }
    
    var subtitleLabelText: String {
        url
    }
    
    
}
