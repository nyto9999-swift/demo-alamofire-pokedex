//
//  PokemonDescriptions.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/13.
//

import UIKit

struct PokemonDescriptions: Decodable {
    let descriptions : [description]
    
    enum CodingKeys: String, CodingKey {
        case descriptions = "flavor_text_entries"
    }
}

struct description: Decodable {
    let text: String
    let languageModel: language
    
    enum CodingKeys: String, CodingKey {
        case text = "flavor_text"
        case languageModel = "language"
    }
}
struct language: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension PokemonDescriptions: DisplayablePokemonDescription {
    var text: String {
        
        let en = descriptions.first(where: {
            $0.languageModel.name.contains("en")
        })
        
        return en?.text ?? ""
    }
}

protocol DisplayablePokemonDescription {
    var text: String { get }
}

/*
 https://pokeapi.co/api/v2/pokemon-species/1/
 {
     "base_happiness":70,
     "capture_rate":45,
     "color":{...}(2 hidden elements),
     "egg_groups":[...](2 hidden elements),
     "evolution_chain":{...}(1 hidden elements),
     "evolves_from_species":null,
     "flavor_text_entries":[
         {
         "flavor_text":"A strange seed was planted on its back at   √ birth.The plant sprouts and grows with this POKéMON.",
         "language":{
             "name":"en",                                           √
             "url":"https://pokeapi.co/api/v2/language/9/",
         },
     "version":{...}(2 hidden elements)
         },
         {...}(3 hidden elements),
     ],
 }
 */
