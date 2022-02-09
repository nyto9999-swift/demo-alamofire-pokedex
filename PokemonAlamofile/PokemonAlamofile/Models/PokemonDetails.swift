//
//  PokemonDetail.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/9.
//
struct PokemonDetails: Decodable {
    let name: String
    let weight: Int
    let height: Int
    let types: [type]
    let image: image
    enum CodingKeys: String, CodingKey {
        case name
        case weight
        case height
        case types
        case image = "sprites"
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
    let type: t
    
    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}

struct t: Decodable {
    let name : String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}


extension PokemonDetails: DisplayablePokemon {
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


