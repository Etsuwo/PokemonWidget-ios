//
//  MediumPokemonGetView.swift
//  PokemonGetWigetExtension
//
//  Created by Etsushi Otani on 2023/02/05.
//

import SwiftUI
import WidgetKit

struct MediumPokemonGetView: View {
    let pokemon: Pokemon?
    
    var body: some View {
        if let pokemon = pokemon {
            HStack(alignment: .center) {
                NetworkImage(url: URL(string: pokemon.image))
                    .aspectRatio(contentMode: .fit)
                    
                VStack {
                    Text(pokemon.name)
                        .fontWeight(.bold)
                    Text("ゲットだぜー！！！")
                        .padding(.top, 4)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct MediumPokemonGetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumPokemonGetView(pokemon: Pokemon(name: "ピカチュウ", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
