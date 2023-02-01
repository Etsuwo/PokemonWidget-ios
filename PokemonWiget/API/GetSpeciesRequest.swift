//
//  GetSpeciesRequest.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/02/01.
//

import Foundation
import Moya

struct GetSpeciesRequest: PokeAPI {
    typealias Response = SpeciesResponse
    
    var path: String {
        "pokemon-species/\(id)"
    }
    
    var method: Moya.Method = .get
    
    var task: Moya.Task = .requestPlain
    
    let id: Int
}
