//
//  MoveDetails.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/13.
//

import UIKit

struct MoveDetails: Decodable {
    let accuracy: Int?
    let power: Int?
    let type: moveType
    let pp: Int?
    let descriptions: [moveDescription]
    
    enum CodingKeys: String, CodingKey {
        case accuracy
        case power
        case type
        case pp
        case descriptions = "flavor_text_entries"
        
    }
}

struct moveDescription: Decodable {
    let text: String
    let languageModel: language
    
    enum CodingKeys: String, CodingKey {
        case text = "flavor_text"
        case languageModel = "language"
    }
}

struct moveType: Decodable {
    let name: String
}

extension MoveDetails: DisplayableMove {
    var typeLabel: String {
        type.name
    }
    
    var ppLabel: String {
        (pp != nil) ? String(pp!) : "Unknown"
    }
    
    var moveDescription: String {
        let en = descriptions.first(where: {
            $0.languageModel.name.contains("en")
        })
        
        return en?.text ?? ""
    }
    
    var accuracyLabel: String {
        (accuracy != nil) ? String(accuracy!) : "Unknown"
    }
    
    var powerLabel: String {
        (power != nil) ? String(power!) : "Unknown"
    }
}

/*
 {
 "accuracy":100,                                        √
 "contest_combos":{...}(2 hidden elements),
 "contest_effect":{...}(1 hidden elements),
 "contest_type":{...}(2 hidden elements),
 "damage_class":{...}(2 hidden elements),
 "effect_chance":30,
 "effect_changes":[...](0 hidden elements),
 "effect_entries":[...](1 hidden elements),
 "flavor_text_entries":[...](67 hidden elements),       √
 "generation":{...}(2 hidden elements),
 "id":44,
 "learned_by_pokemon":[...](161 hidden elements),
 "machines":[...](0 hidden elements),
 "meta":{...}(12 hidden elements),
 "name":"bite",                                         √
 "names":[...](10 hidden elements),
 "past_values":[...](1 hidden elements),
 "power":60,                                            √
 "pp":25,                                               √
 "priority":0,
 "stat_changes":[...](0 hidden elements),
 "super_contest_effect":{...}(1 hidden elements),
 "target":{...}(2 hidden elements),
 "type":{...}(2 hidden elements)                        √
 }
 */
