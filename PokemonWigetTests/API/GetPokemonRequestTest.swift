//
//  PokemonWigetTests.swift
//  PokemonWigetTests
//
//  Created by Etsushi Otani on 2023/01/29.
//

import XCTest
@testable import PokemonWiget

final class PokemonWigetTests: XCTestCase {
    
    private let provider = PokeAPIProviderImpl()
    private let frontDefault = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"

    func testGetPokemonRequest() {
        let expection = expectation(description: "testGetPokemonRequest")
        Task {
            do {
                let request = GetPokemonRequest(id: 25)
                let pokemon = try await provider.exec(request: request)
                XCTAssertEqual(frontDefault, pokemon.sprites.other.officialArtwork.frontDefault)
                expection.fulfill()
            
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 10)
    }
}
