//
//  PokeAPI.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/01/29.
//

import Foundation
import Moya

protocol PokeAPI: TargetType {
    associatedtype Response: Decodable
    func decode(from response: Moya.Response) throws -> Response
}

extension PokeAPI {
    var baseURL: URL {
        URL(string: "https://pokeapi.co/api/v2/")!
    }

    var headers: [String: String]? {
        nil
    }

    func decode(from result: Moya.Response) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: result.data)
    }
}

class PokeAPIConstants {
    static let maxId = 1008
}
