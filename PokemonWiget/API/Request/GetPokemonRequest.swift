//
//  GetPokemonRequest.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/01/29.
//

import Foundation
import Moya

struct GetPokemonRequest: PokeAPI {
    typealias Response = PokemonResponse
        
    var path: String {
        "pokemon/\(id)"
    }
    
    var method: Moya.Method = .get
    
    var task: Moya.Task = .requestPlain
    
    let id: Int
}
