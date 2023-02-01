//
//  ContentView.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/01/29.
//

import SwiftUI

struct ContentView: View {
    let pokeApiProvider: PokeAPIProvider
    @State var name = "ピカチュウ"
    
    var body: some View {
        VStack {
            Text(name)
                .bold()
                .font(.system(size: 40))
                
            Text("ゲットだぜ！！！")
                .bold()
                .font(.system(size: 40))
                .padding(.top, 4)
            
            Button(action: {
                Task {
                    let request = GetPokemonRequest(id: Int.random(in: 0...10))
                    let pokemon = try! await pokeApiProvider.exec(request: request)
                    
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
