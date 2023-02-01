//
//  PokemonResponse.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/01/29.
//

import Foundation
import Moya

struct PokemonResponse: Decodable {
    let sprites: Sprites
}

struct Sprites: Decodable {
    let other: Other
}

struct Other: Decodable {
    let officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
