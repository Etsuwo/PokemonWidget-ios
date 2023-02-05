//
//  SmallPokemonGetView.swift
//  PokemonGetWigetExtension
//
//  Created by Etsushi Otani on 2023/02/05.
//

import SwiftUI

struct SmallPokemonGetView: View {
    let pokemon: Pokemon?

    var body: some View {
        if let pokemon = pokemon {
            VStack {
                NetworkImage(url: URL(string: pokemon.image))
                    .padding(.horizontal, 32)
                Group {
                    Text(pokemon.name)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                    Text("ゲットだぜー！！！")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }.offset(y: -4)
            }
        } else {
            Text("ポケモンゲットならず")
        }
    }
}

struct SmallPokemonGetView_Previews: PreviewProvider {
    static var previews: some View {
        SmallPokemonGetView(pokemon: Pokemon(name: "ピカチュウ", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"))
    }
}
