//
//  DisplayableMove.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/12.
//

protocol DisplayableMove {
    var accuracyLabel: String { get }
    var powerLabel: String { get }
    var typeLabel: String { get }
    var ppLabel: String { get }
    var moveDescription: String { get }
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
