import SwiftUI

struct ContentView: View {
    @State private var userCode = """
    func helloWorld() {
        print("Hello, World!")
    }
    """
    
    @State private var width: CGFloat = 400
    @State private var height: CGFloat = 300
    @State private var lineSpacing: CGFloat = 4
    @State private var textSize: CGFloat = 12
    @State private var circleYPosition: CGFloat = 20 // Initial Y position
    
    let originalWidth: CGFloat = 400
    let originalHeight: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack {
                // Your code snippet with Mac screen outline overlay
                CodeSnapshotView(code: $userCode, width: width, height: height, lineSpacing: lineSpacing, textSize: textSize, circleYPosition: circleYPosition)
                
                // TextField to change the code
                MyMultilineTextField(text: $userCode, placeholder: "Enter new code")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Adjust screen size sliders
                VStack(spacing: 16) {
                    VStack {
                        Text("Width:")
                        Slider(value: $width, in: 100...600, step: 1)
                        Text("\(Int(width))")
                    }
                    VStack {
                        Text("Height:")
                        Slider(value: $height, in: 100...400, step: 1)
                        Text("\(Int(height))")
                    }
                    
                    // Adjust line spacing slider
                    VStack {
                        Text("Line Spacing:")
                        Slider(value: $lineSpacing, in: 0...20, step: 1)
                        Text("\(Int(lineSpacing))")
                    }
                    
                    // Adjust text size slider
                    VStack {
                        Text("Text Size:")
                        Slider(value: $textSize, in: 8...20, step: 1)
                        Text("\(Int(textSize))")
                    }
                    
                    // Slider to adjust circle Y position
                    VStack {
                        Text("Circle Y Position:")
                        Slider(value: $circleYPosition, in: 0...height - 20, step: 1)
                        Text("\(Int(circleYPosition))")
                    }
                }
                .padding()
                
                // Done button to dismiss keyboard
                Button("Done") {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                // Button to take a snapshot
                Button(action: {
                    // Take snapshot action
                    takeSnapshot()
                }) {
                    Text("Take Snapshot")
                }
                .padding()
            }
        }
    }
    
    func takeSnapshot() {
        // Take snapshot code
        // This is just a placeholder for the actual snapshot functionality
        print("Snapshot taken!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
@main
struct ImagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}