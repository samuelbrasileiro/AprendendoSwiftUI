/*:
# Desafio 7: Animação Simples

Neste exercício, você criará um botão que animará seu tamanho ao ser pressionado.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct AnimatedButtonView: View {
    @State private var isButtonExpanded = false

    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Botão Animado

Crie um botão que animará seu tamanho ao ser pressionado. Use a modificação de estado `@State` para controlar o tamanho do botão.

```swift
Button(action: {
    // Ação do botão
    // Alterne o estado para animar o tamanho do botão
}) {
    Text("Toque Aqui!")
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(isButtonExpanded ? 50 : 10)
        .animation(.spring()) // Adicione a animação aqui
}
```

## Passo 3: Personalização

Personalize o botão animado! Experimente diferentes cores, tamanhos e durações de animação para criar uma experiência de animação interessante.

## Passo 4: Desafio Extra (Opcional)

Adicione mais animações ao botão. Experimente diferentes tipos de animações e efeitos para tornar a interação com o botão ainda mais interessante.
 
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

Parabéns por concluir o Exercício de Animação! Agora você tem um botão animado que muda de tamanho ao ser pressionado. Continue praticando e experimentando para aprimorar suas habilidades de animação com SwiftUI.

Espero que tenha gostado do exercício! As animações são uma ótima maneira de tornar suas interfaces mais interativas e envolventes. Continue explorando e criando projetos para se tornar um(a) expert em animações com SwiftUI!
*/
//#-hidden-code
struct ChallengeView: View {
    @State private var isButtonExpanded = false
    
    var body: some View {
        VStack {
            Button(action: {
                // Ação do botão
                // Alterne o estado para animar o tamanho do botão
                withAnimation(.spring()) {
                    isButtonExpanded.toggle()
                }
            }) {
                Text("Toque Aqui!")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(isButtonExpanded ? 50 : 10)
            }
            
            Text(isButtonExpanded ? "Botão Expandido!" : "Botão Normal")
        }
        .padding()
    }
}

struct ExtraChallengeView: View {
    @State private var isButtonExpanded = false
    @State private var isButtonRotated = false
    
    var body: some View {
        VStack {
            Button(action: {
                // Ação do botão
                // Alterne o estado para animar o tamanho e a rotação do botão
                withAnimation(.spring()) {
                    isButtonExpanded.toggle()
                }
                
                withAnimation(.easeInOut(duration: 0.5)) {
                    isButtonRotated.toggle()
                }
            }) {
                Text("Toque Aqui!")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(isButtonExpanded ? 50 : 10)
                    .rotationEffect(.degrees(isButtonRotated ? 180 : 0))
            }
            
            Text(isButtonExpanded ? "Botão Expandido!" : "Botão Normal")
        }
        .padding()
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


