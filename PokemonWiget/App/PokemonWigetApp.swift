//
//  PokemonWigetApp.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/01/29.
//

import SwiftUI

@main
struct PokemonWigetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(pokeApiProvider: PokeAPIProviderImpl())
        }
    }
}
