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
    private let pikachu = "ピカチュウ"
    private let language = "ja-Hrkt"

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
    
    func testGetSpeciesRequest() {
        let expection = expectation(description: "testGetSpeciesRequest")
        Task {
            do {
                let request = GetSpeciesRequest(id: 25)
                let species = try await provider.exec(request: request)
                let name = species.names.first { $0.language.name == language }
                XCTAssertNotNil(name)
                XCTAssertEqual(name!.name, pikachu)
                expection.fulfill()
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10)
    }
}
