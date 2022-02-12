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

/*
 Pokemons Model
 {
     "abilities":[...],
     "id":1,
     "main_region":{...},
     "moves":[...],
     "name":"generation-i",
     "names":[...],
     "pokemon_species":[
         {
             "name":"bulbasaur",                                   ✓
             "url":"https://pokeapi.co/api/v2/pokemon-species/1/", ✓
         },
         {...},
         {...},...
     ],
     "types":[...],
     "version_groups":[...])
 }
 */
