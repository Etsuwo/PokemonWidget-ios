//
//  PokemonGetWiget.swift
//  PokemonGetWiget
//
//  Created by Etsushi Otani on 2023/02/04.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> PokemonGetEntry {
        PokemonGetEntry(date: Date(), configuration: ConfigurationIntent(), pokemon: nil)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (PokemonGetEntry) -> ()) {
        let entry = PokemonGetEntry(date: Date(), configuration: configuration, pokemon: nil)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

        let entryDate = Calendar.current.date(byAdding: .minute, value: 15, to: Date())!
        Task {
            do {
                let pokemon = try await GetPokemonUsecase().exec()
                let entry = PokemonGetEntry(date: entryDate, configuration: configuration, pokemon: pokemon)
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                completion(timeline)
            } catch {
                let entry = PokemonGetEntry(date: entryDate, configuration: configuration, pokemon: nil)
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                completion(timeline)
            }
        }
    }
}

struct PokemonGetEntry: TimelineEntry {
    var date: Date
    let configuration: ConfigurationIntent
    let pokemon: Pokemon?
}

struct PokemonGetWigetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        if let pokemon = entry.pokemon {
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

struct PokemonGetWiget: Widget {
    let kind: String = "PokemonGetWiget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            PokemonGetWigetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct PokemonGetWiget_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGetWigetEntryView(entry: PokemonGetEntry(date: Date(), configuration: ConfigurationIntent(), pokemon: nil))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
