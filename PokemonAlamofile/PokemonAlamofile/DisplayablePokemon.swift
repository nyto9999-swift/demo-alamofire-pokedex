//
//  DisplayablePokemon.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/9.
//

protocol DisplayablePokemon {
    var imageViewUrl: String { get }
    var nameLabelText: String { get }
    var hwLabelText: (height: Int, weight: Int) { get }
    var typeLabelText: (type1: String, type2: String) { get }
    var abilitiesButton: Array<ability> { get }
    var movesCell: Array<move> { get }
    var statsArray: Array<stat> { get }
}

/*
 PokemonDetails Model
 {
     "abilities":[...],     ✓
     "base_experience":64,  ✓
     "forms":[...],
     "game_indices":[...],
     "height":7,            ✓
     "held_items":[...],
     "id":1,
     "is_default":true,
     "location_area_encounters",
     "moves":[...],
     "name":"bulbasaur",
     "order":1,
     "past_types":[...],
     "species":{...},
     "sprites":{...},       ✓ poke image url
     "stats":[...],         ✓
     "types":[...],         ✓
     "weight":69,           ✓
 }
 */
