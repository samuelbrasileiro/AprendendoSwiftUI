import SwiftUI
import PlaygroundSupport

public struct GreetingsView: View {
    @Binding public var userName: String
    @State private var animateText = false
    
    public init(userName: Binding<String>) {
        self._userName = userName
    }
    
    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if userName != "" {
                    Text("Olá, \(userName)!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(10)
                        .scaleEffect(animateText ? 1.5 : 1.0)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                        .onAppear {
                            self.animateText.toggle()
                        }
                }
                
                Text("Espero que você ame o nosso curso :)")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
                    .padding(.top, 20)
                    .scaleEffect(animateText ? 1.2 : 1.0)
                    .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
                    .onAppear {
                        self.animateText.toggle()
                    }
            }
        }
    }
}
