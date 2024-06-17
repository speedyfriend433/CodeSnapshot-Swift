import SwiftUI

struct CodeSnapshotView: View {
    @Binding var code: String
    var width: CGFloat
    var height: CGFloat
    var lineSpacing: CGFloat
    var textSize: CGFloat
    var circleYPosition: CGFloat // Add circleYPosition as a parameter
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Code screen
            ScrollView {
                VStack(alignment: .leading, spacing: lineSpacing) {
                    ForEach(1..<code.components(separatedBy: "\n").count + 1, id: \.self) { lineNumber in
                        HStack(spacing: 4) {
                            Text("\(lineNumber)")
                                .font(.system(size: textSize, weight: .regular, design: .monospaced))
                                .foregroundColor(.gray)
                                .frame(width: 20, alignment: .trailing)
                            TextField("", text: Binding(
                                get: { code.components(separatedBy: "\n")[lineNumber - 1] },
                                set: { newValue in
                                    var lines = code.components(separatedBy: "\n")
                                    lines[lineNumber - 1] = newValue
                                    code = lines.joined(separator: "\n")
                                }
                            ))
                            .font(.system(size: textSize, weight: .regular, design: .monospaced))
                            .foregroundColor(Color(red: 0.6, green: 0.6, blue: 0.6))
                            .padding(.vertical, 2)
                        }
                    }
                }
                .padding(.leading, 8)
                .frame(width: width, height: height)
                .background(Color(red: 0.1, green: 0.1, blue: 0.1))
                .cornerRadius(8)
            }
            
            // Traffic light buttons
            HStack(spacing: 4) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .offset(x: 0, y: circleYPosition) // Adjust Y position of the circle
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 8, height: 8)
                    .offset(x: 0, y: circleYPosition) // Adjust Y position of the circle
                Circle()
                    .fill(Color.green)
                    .frame(width: 8, height: 8)
                    .offset(x: 0, y: circleYPosition) // Adjust Y position of the circle
            }
            .padding(.horizontal, 16)
            .padding(.top, 4)
        }
    }
}