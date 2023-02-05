//
//  PokemonGetWigetBundle.swift
//  PokemonGetWiget
//
//  Created by Etsushi Otani on 2023/02/04.
//

import WidgetKit
import SwiftUI

@main
struct PokemonGetWigetBundle: WidgetBundle {
    var body: some Widget {
        PokemonGetWiget()
        PokemonGetWigetLiveActivity()
    }
}
