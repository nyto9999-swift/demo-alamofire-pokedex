//
//  ColorType.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/10.
//

import UIKit

var gens = ["Yellow", "Gold.Sliver", "Ruby.Sapphire", "Diamand.Pearl", "Black.White", "X.Y", "Sun.Moon", "Sword.Shield"]



func getTypeColor(for type: String) -> UIColor {
        switch type {
            case "normal":
                return .lightGray
            case "grass":
                return .systemGreen
            case "fire":
                return .orange
            case "water":
                return .systemBlue
            case "electric":
                return .systemYellow
            case "ice":
                return .systemCyan
            case "fighting":
                return .systemRed
            case "poison":
                return .purple
            case "flying":
                return .systemCyan
            case "psychic":
                return .systemPink
            case "bug":
                return .green
            case "rock":
                return .brown
            case "ghost":
                return .systemPurple
            case "ground":
                return .systemBrown
            case "dark":
                return .darkGray
            case "dragon":
                return .purple
            case "steel":
                return .systemGray3
            case "fairy":
                return .systemPink
            default:
                return .white
        }
}
