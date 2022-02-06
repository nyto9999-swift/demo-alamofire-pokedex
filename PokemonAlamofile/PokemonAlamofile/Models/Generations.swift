//
//  Generations.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import Foundation

struct Generations: Decodable {
  let count: Int
  let all: [Generation]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
