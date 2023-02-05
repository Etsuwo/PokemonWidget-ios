//
//  NetworkImage.swift
//  PokemonWiget
//
//  Created by Etsushi Otani on 2023/02/05.
//

import SwiftUI

// https://stackoverflow.com/questions/63086029/ios-widgetkit-remote-images-fails-to-load

struct NetworkImage: View {

  let url: URL?

  var body: some View {
    Group {
     if let url = url, let imageData = try? Data(contentsOf: url),
       let uiImage = UIImage(data: imageData) {

       Image(uiImage: uiImage)
         .resizable()
         .aspectRatio(contentMode: .fill)
      }
      else {
       Image("placeholder-image")
      }
    }
  }
}
