/*:
# Aprendendo SwiftUI - Desafio 6: Cores

Neste desafio, você criará um aplicativo que permite ao usuário mudar o tema de pintura do aplicativo usando um botão. O tema de pintura incluirá a cor de fundo e a cor das formas desenhadas.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct PaintingView: View {
    @State private var backgroundColor: Color = .white
    @State private var shapeColor: Color = .black

    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Botão de Mudança de Tema

Adicione um botão que permita ao usuário mudar o tema de pintura ao ser clicado. Use a modificação de estado `@State` para alternar as cores de fundo e das formas.

```swift
Button(action: {
    // Ação do botão de mudança de tema
    // Alterne as cores de fundo e das formas
}) {
    Text("Mudar Tema")
}
```

## Passo 3: Formas Desenhadas

Desenhe algumas formas simples, como círculos ou retângulos, usando as cores de fundo e das formas definidas pelo usuário.

```swift
Rectangle()
    .foregroundColor(shapeColor)
    .frame(width: 100, height: 100)
```

## Passo 4: Personalização

Personalize o aplicativo de pintura! Experimente diferentes cores para as formas e fundo para criar temas interessantes.

## Passo 5: Desafio Extra (Opcional)

 Para o desafio extra, adicione mais opções de cores para o tema de pintura. Permita ao usuário escolher entre várias cores diferentes para as formas e o fundo.

 ## Meu código

   No bloco de código abaixo, complete o desafio:
*/

  import SwiftUI
  import PlaygroundSupport
  //#-editable-code


  struct ContentView: View {
      
      var body: some View {
          // Seu código vai aqui!
          VStack {
              
          }
      }
  }

  let contentView = ContentView()
  //#-end-editable-code
/*:
## Conclusão

Parabéns por concluir o Desafio de Tema de Pintura! Agora você tem um aplicativo simples que permite ao usuário mudar o tema de pintura usando um botão. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces com SwiftUI.

Espero que tenha se divertido criando esse desafio! Continue explorando e criando projetos para se tornar um(a) expert em SwiftUI!
*/
//#-hidden-code
struct ChallengeView: View {
    @State private var backgroundColor: Color = .white
    @State private var shapeColor: Color = .black
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(shapeColor)
                .frame(width: 100, height: 100)
                .padding()
            
            Button(action: {
                // Ação do botão de mudança de tema
                // Alterne as cores de fundo e das formas
                withAnimation {
                    swapColors()
                }
            }) {
                Text("Mudar Tema")
            }
        }
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func swapColors() {
        let temp = backgroundColor
        backgroundColor = shapeColor
        shapeColor = temp
    }
}

struct ExtraChallengeView: View {
    @State private var backgroundColor: Color = .white
    @State private var shapeColor: Color = .black
    @State private var selectedColorIndex = 0
    
    let colors: [Color] = [.black, .blue, .green, .orange, .pink, .purple, .red, .yellow]
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(shapeColor)
                .frame(width: 100, height: 100)
                .padding()
            
            Picker(selection: $selectedColorIndex, label: Text("Cor de Fundo")) {
                ForEach(0..<colors.count) { index in
                    Rectangle()
                        .foregroundColor(colors[index])
                        .tag(index)
                        .frame(width: 50, height: 50)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            Button(action: {
                // Ação do botão de mudança de tema
                // Alterne as cores de fundo e das formas
                withAnimation {
                    swapColors()
                }
            }) {
                Text("Mudar Tema")
            }
        }
        .background(colors[selectedColorIndex])
        .edgesIgnoringSafeArea(.all)
    }
    
    private func swapColors() {
        let temp = backgroundColor
        backgroundColor = shapeColor
        shapeColor = temp
    }
}

struct SegmentedView: View {
    @State private var selectedIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $selectedIndex, label: Text("Selecione o Desafio")) {
                Text("Desafio Resolvido").tag(0)
                Text("Desafio Extra").tag(1)
                Text("Meu Desafio").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selectedIndex == 0 {
                ChallengeView()
            } else if selectedIndex == 1 {
                ExtraChallengeView()
            } else  {
                ContentView()
            }
            
            Spacer()
        }
        .padding()
    }
}
let segmentedView = SegmentedView()
PlaygroundPage.current.setLiveView(segmentedView)
//#-end-hidden-code

