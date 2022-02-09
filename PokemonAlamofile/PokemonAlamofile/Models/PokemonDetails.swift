//
//  PokemonDetail.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/9.
//

import SwiftUI

struct PokemonDetails: Decodable {
    
    let name: String
    let weight: Int
    let height: Int
    let types: [type]
    let image: image
    let stats: [stat]
    enum CodingKeys: String, CodingKey {
        case name
        case weight
        case height
        case types
        case image = "sprites"
        case stats
    }
}

extension PokemonDetails: DisplayablePokemon {
    
    var statsArray: Array<stat> {
        stats
    }
    
    var imageViewUrl: String {
        image.url
    }
    
    var typeLabelText: (type1: String, type2: String) {
        
        if types.count != 2 {
            return (types[0].type.name, "")
        }
        return (types[0].type.name, types[1].type.name)
    }
    
    var nameLabelText: String {
        name
    }
    
    var hwLabelText: (height: Int, weight: Int) {
        (height, weight)
    }
    
}


struct stat: Decodable {
    let value: Int
    
    enum CodingKeys: String, CodingKey {
        case value = "base_stat"
    }
}

struct image: Decodable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
}

struct type: Decodable {
    let slot : Int
    let type: value
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}

struct value : Decodable {
    let name : String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}




