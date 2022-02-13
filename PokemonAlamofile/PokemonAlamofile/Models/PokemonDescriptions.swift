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
