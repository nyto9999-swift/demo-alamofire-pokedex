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

/*
 Generations model
 {
     "count":8,
     "next":null,
     "previous":null,
     "results":[
         {
             "name":"generation-i",                           ✓
             "url":"https://pokeapi.co/api/v2/generation/1/", ✓
         },
         {
             "name":"generation-ii",
             "url":"https://pokeapi.co/api/v2/generation/2/",
         },
         {...}(2 hidden elements),
         {...}...
     ]
 }
*/
