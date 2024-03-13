//
// ContentView.swift : Assignment1
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.
import SwiftUI

struct EmojiCounter: Identifiable {
    let id = UUID()
    let emoji: String
    var count: Int
}

struct EmojiCounterView: View {
    @State private var emojiCounters: [EmojiCounter] = [
        EmojiCounter(emoji: "😂", count: 0),
        EmojiCounter(emoji: "😍", count: 0),
        EmojiCounter(emoji: "😊", count: 0),
        EmojiCounter(emoji: "🤓", count: 0),
        EmojiCounter(emoji: "😎", count: 0)
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach($emojiCounters) { $emojiCounter in
                    HStack {
                        Text(emojiCounter.emoji)
                            .font(.largeTitle)
                        Spacer()
                        Text("Counter: \(emojiCounter.count)")
                        Spacer()
                        Button(action: {
                            emojiCounter.count += 1
                        }) {
                            Text("+")
                                .font(.title)
                                .foregroundColor(.green)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.green, lineWidth: 2)
                                )
                        }
                        Button(action: {
                            emojiCounter.count -= 1
                        }) {
                            Text("-")
                                .font(.title)
                                .foregroundColor(.red)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.red, lineWidth: 2)
                                )
                        }
                    }
                }
            }
            .navigationBarTitle("Emoji Counter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiCounterView()
    }
}
