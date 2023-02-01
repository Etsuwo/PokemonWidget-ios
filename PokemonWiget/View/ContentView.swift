//
//  ContentView.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/01/29.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    let pokeApiProvider: PokeAPIProvider
    @State var name = ""
    @State var image = ""
    
    var body: some View {
        VStack {
            if (!name.isEmpty) {
                Text(name)
                    .bold()
                    .font(.system(size: 40))
                Text("ゲットだぜ！！！")
                    .bold()
                    .font(.system(size: 40))
                    .padding(.top, 4)
            }
            
            KFImage(URL(string: image))
                .padding(.top, 16)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity)
            
            Button(action: {
                Task {
                    let pokemon = try! await GetPokemonUsecase().exec()
                    name = pokemon.name
                    image = pokemon.image
                }
            }, label: {
                Text("ポケモンをゲット")
            })
            .padding()
            .foregroundColor(Color.white)
            .background(Color.black)
            .cornerRadius(6)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokeApiProvider: PokeAPIProviderImpl())
    }
}
