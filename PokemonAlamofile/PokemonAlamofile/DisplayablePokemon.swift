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

