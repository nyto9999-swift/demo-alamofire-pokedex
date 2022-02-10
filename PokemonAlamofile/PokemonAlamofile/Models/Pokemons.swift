//
//  Pokemons.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/7.
//

struct Pokemons: Decodable {
    let all: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
      case all = "pokemon_species"
     
    }
}

struct Search: Decodable {
    let id: Int
    let name: String
    enum CodingKeys: String, CodingKey {
      case name
      case id
    }
}
