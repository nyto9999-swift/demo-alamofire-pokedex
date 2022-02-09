//
//  Generation.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import Foundation

struct Generation: Decodable {
  let name: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case url
  }
}

extension Generation: Displayable {
    var titleLabelText: String {
        name
    }
    
    var subtitleLabelText: String {
        url
    }
}
