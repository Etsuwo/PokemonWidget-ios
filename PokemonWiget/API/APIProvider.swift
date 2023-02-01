//
//  APIProvider.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/01/29.
//

import Foundation
import Moya

typealias APIProvider = MoyaProvider<MultiTarget>

protocol PokeAPIProvider {
    func exec<T: PokeAPI>(request: T) async throws -> T.Response
}

final class PokeAPIProviderImpl: APIProvider, PokeAPIProvider {
    func exec<T: PokeAPI>(request: T) async throws -> T.Response {
        try await withCheckedThrowingContinuation { continutation in
                let target = MultiTarget(request)
                self.request(target) { result in
                    switch result {
                    case let .success(result):
                        do {
                            let response = try request.decode(from: result)
                            continutation.resume(returning: response)
                        } catch {
                            continutation.resume(throwing: error)
                        }
                    case let .failure(error):
                        continutation.resume(throwing: error)
                    }
                }
            }
    }
}
