//
//  ColorType.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/10.
//

import UIKit

func getColor(for data: String) -> UIColor {
    
    switch data {
        case "simple":
            return .yellow
        case "moody":
            return .blue
        default:
            return .white
    }
}
