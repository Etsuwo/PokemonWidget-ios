//
//  GetPokemonUsecase.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/02/01.
//

import Foundation

struct GetPokemonUsecase {
    let provider: PokeAPIProvider = PokeAPIProviderImpl()
    let id: Int
    private let language = "ja-Hrkt"
    
    func exec() async throws -> Pokemon {
        let pokemon = try await provider.exec(request: GetPokemonRequest(id: id))
        let species = try await provider.exec(request: GetSpeciesRequest(id: id))
        let name = species.names.first { $0.language.name == language }!
        return Pokemon(
            name: name.name,
            image: pokemon.sprites.other.officialArtwork.frontDefault
        )
    }
}

struct Pokemon {
    let name: String
    let image: String
}
