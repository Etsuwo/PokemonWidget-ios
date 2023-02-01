//
//  SpeciesResponse.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/02/01.
//

import Foundation

struct SpeciesResponse: Decodable {
    let names: [Name]
}

struct Name: Decodable {
    let name: String
    let language: Language
}

struct Language: Decodable {
    let name: String
}
