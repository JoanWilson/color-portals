import SwiftUI

struct CutsceneView: View {
    @Environment(\.mainWindowSize) var windowSize
    @State private var text: String = ""
    let historyText: String
    @State private var idle: Bool = false
    
    // Usados na func
    @State var aux = 0
    @State var rangeMarkdown: (startIndex: Int?, endIndex: Int?) = (nil, nil)
    
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: windowSize.width,
                       height: windowSize.height)
                .overlay {
                    let markdown = try! AttributedString(markdown: text )
                    Text(markdown)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 0, leading: 68, bottom: 10, trailing: 68))
                }
        }
        .onAppear {
            typeWriter()
            idle = true
        }.ignoresSafeArea()
    }
    
    func typeWriter(at position: Int = 0) {
        
        if position == 0 {
            text = ""
        }
        if position < historyText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) {
                if historyText[position] == "*" {
                    aux += 1
                    text.append("")
                    typeWriter(at: position + 1)
                    if aux == 2 {
                        rangeMarkdown.startIndex = position-1
                    }
                    if aux == 3 {
                        rangeMarkdown.endIndex = position
                    }
                } else {
                    text.append(historyText[position])
                    typeWriter(at: position + 1)
                }
                
            }
        }
        if position == historyText.count {
            if let startRange = rangeMarkdown.startIndex {
                text.insert("*", at: text.index(text.startIndex, offsetBy: startRange))
                text.insert("*", at: text.index(text.startIndex, offsetBy: startRange))
                text.insert("*", at: text.index(text.startIndex, offsetBy: rangeMarkdown.endIndex!))
                text.insert("*", at: text.index(text.startIndex, offsetBy: rangeMarkdown.endIndex!))
            }
        }
        
    }
}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
