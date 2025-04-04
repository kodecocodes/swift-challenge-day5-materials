import SwiftUI

struct ContentView: View {
    
    @State var playerRow = 0
    @State var playerCol = 7
    
    var body: some View {
        Text("Player Location: \(playerRow), \(playerCol)")
        Spacer()
        VStack {
            Text("🟩🟩🟩🟩🟩🟩🟩🐰🟩🟩🟩🟩🟩🟩🟩🟩")
            Text("🟩🟧🟧🟧🟧🟧🟧🟧🟩🟧🟧🟧🟧🟧🟧🟩")
            Text("🟩🟩🟩🟩🟩🟩🟩🟧🟩🟩🟩🟩🟩🟩🟧🟩")
            Text("🟩🟧🟧🟧🟧🟧🟩🟧🟧🟧🟧🟧🟧🟧🟧🟩")
            Text("🟩🟧🟩🟩🟩🟧🟩🟩🟩🟩🟩🟩🟩🟩🟧🟩")
            Text("🟩🟩🟩🟩🟩🟧🟧🟧🟧🟧🟧🟧🟧🟧🟧🟩")
            Text("🟩🟧🟧🟧🟧🟧🟩🟩🟩🟩🟧🟩🟧🟩🟧🟩")
            Text("🟩🟧🟩🟩🟩🟧🟩🟧🟧🟧🟧🟩🟧🟩🟧🟩")
            Text("🟩🟧🟧🟧🟩🟧🟩🟩🟩🟩🟩🟩🟩🟩🟧🟩")
            Text("🟩🟩🟩🟧🟩🟩🟩🟩🟩🟩🟩🟧🟧🟧🟧🟩")
            Text("🟩🟩🟩🟧🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩🟩")
        }
        Spacer()
        HStack {
            Button {
                playerRow -= 1
            } label: {
                Text("⬆️").font(.system(size: 50))
            }
            Button {
                playerRow += 1
            } label: {
                Text("⬇️").font(.system(size: 50))
            }
            Button {
                playerCol -= 1
            } label: {
                Text("⬅️").font(.system(size: 50))
            }
            Button {
                playerCol += 1
            } label: {
                Text("➡️").font(.system(size: 50))
            }
        }
        Spacer()
    }
}
