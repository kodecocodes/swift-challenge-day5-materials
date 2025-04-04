import SwiftUI

struct ContentView: View {
    
    @State var playerRow = 0
    @State var playerCol = 7
    @State var wonGame = false
    var carrotRow = 10
    var carrotCol = 3
    
    var data = [
        ["🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟧","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩"],
        ["🟩","🟧","🟧","🟧","🟧","🟧","🟧","🟧","🟩","🟧","🟧","🟧","🟧","🟧","🟧","🟩"],
        ["🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟧","🟩","🟩","🟩","🟩","🟩","🟩","🟧","🟩"],
        ["🟩","🟧","🟧","🟧","🟧","🟧","🟩","🟧","🟧","🟧","🟧","🟧","🟧","🟧","🟧","🟩"],
        ["🟩","🟧","🟩","🟩","🟩","🟧","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟧","🟩"],
        ["🟩","🟩","🟩","🟩","🟩","🟧","🟧","🟧","🟧","🟧","🟧","🟧","🟧","🟧","🟧","🟩"],
        ["🟩","🟧","🟧","🟧","🟧","🟧","🟩","🟩","🟩","🟩","🟧","🟩","🟧","🟩","🟧","🟩"],
        ["🟩","🟧","🟩","🟩","🟩","🟧","🟩","🟧","🟧","🟧","🟧","🟩","🟧","🟩","🟧","🟩"],
        ["🟩","🟧","🟧","🟧","🟩","🟧","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟧","🟩"],
        ["🟩","🟩","🟩","🟧","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟧","🟧","🟧","🟧","🟩"],
        ["🟩","🟩","🟩","🥕","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩","🟩"]
    ]
    
    func generateRow(rowData: [String], drawPlayer: Bool) -> Text {
        var textString = ""
        for colIndex in 0...rowData.count - 1 {
            if colIndex == playerCol && drawPlayer {
                textString += "🐰"
            } else {
                textString += rowData[colIndex]                
            }

        }
        return Text(textString)
    }
    
    func isValidMove(row: Int, col: Int) -> Bool {
        return data[row][col] == "🟧" || data[row][col] == "🥕"
    }
    
    var body: some View {
        Text("Player Location: \(playerRow), \(playerCol)")
        Spacer()
        VStack {
            ForEach(0..<data.count, id: \.self) { rowIndex in 
                HStack {
                    generateRow(rowData: data[rowIndex], drawPlayer: playerRow == rowIndex)
                }    
            }
        }
        Spacer()
        HStack {
            Button {
                if isValidMove(row: playerRow-1, col: playerCol) {
                    playerRow -= 1 
                    wonGame = playerRow == carrotRow && playerCol == carrotCol
                }
            } label: {
                Text("⬆️").font(.system(size: 50))
            }
            Button {
                if isValidMove(row: playerRow+1, col: playerCol) {
                    playerRow += 1
                    wonGame = playerRow == carrotRow && playerCol == carrotCol                    
                }
            } label: {
                Text("⬇️").font(.system(size: 50))
            }
            Button {
                if isValidMove(row: playerRow, col: playerCol-1) {
                    playerCol -= 1
                    wonGame = playerRow == carrotRow && playerCol == carrotCol
                }
            } label: {
                Text("⬅️").font(.system(size: 50))
            }
            Button {
                if isValidMove(row: playerRow, col: playerCol+1) {
                    playerCol += 1
                    wonGame = playerRow == carrotRow && playerCol == carrotCol
                }
            } label: {
                Text("➡️").font(.system(size: 50))
            }
        }
        .alert("Congrats! You won!", isPresented: $wonGame) {
            Button("OK") {}
        }
        Spacer()
    }
}
