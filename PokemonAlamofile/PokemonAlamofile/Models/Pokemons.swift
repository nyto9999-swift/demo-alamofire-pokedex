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
