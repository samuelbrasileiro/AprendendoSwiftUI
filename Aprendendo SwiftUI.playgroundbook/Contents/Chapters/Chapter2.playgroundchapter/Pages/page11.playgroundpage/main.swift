/*:
# Desafio 10: Aplicativo de Desenho Interativo

Neste desafio, você criará um aplicativo de desenho interativo usando gestos (gestures). O aplicativo permitirá que o usuário desenhe na tela arrastando o dedo e também limpe o desenho com um toque.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct DrawingView: View {
    @State private var points: [CGPoint] = []

    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Desenho Interativo

Use o gesto `DragGesture` para permitir que o usuário desenhe na tela arrastando o dedo. Adicione os pontos de toque do gesto a um array para formar o desenho.

```swift
ZStack {
    // Adicione uma cor de fundo para o desenho
    Color.white

    // Desenho interativo
    Path { path in
        for point in points {
            path.addLine(to: point)
        }
    }
    .stroke(Color.black, lineWidth: 2)
    .gesture(
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                // Ação do gesto de arrastar o dedo (desenho)
                points.append(value.location)
            }
    )
}
```

## Passo 3: Limpar Desenho

Adicione um gesto de toque (`TapGesture`) para limpar o desenho quando o usuário tocar na tela.

```swift
ZStack {
    // Adicione uma cor de fundo para o desenho
    Color.white

    // Desenho interativo
    // (mesmo código do Passo 2)

    .gesture(
        TapGesture(count: 1)
            .onEnded {
                // Ação do gesto de toque (limpar desenho)
                points.removeAll()
            }
    )
}
```

## Passo 4: Personalização

Personalize o aplicativo de desenho! Experimente diferentes cores, tamanhos de pincel e interações para criar uma experiência de desenho atraente.

## Passo 5: Desafio Extra (Opcional)

 Para o desafio extra, adicione mais opções de personalização ao aplicativo de desenho. Permita ao usuário escolher a cor e o tamanho do pincel para criar desenhos ainda mais criativos.
 
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

  //#-end-editable-code
/*:
## Conclusão

Parabéns por concluir o Desafio 10 de Aplicativo de Desenho Interativo! Você criou um aplicativo que permite ao usuário desenhar na tela usando gestos. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces interativas com SwiftUI.

Os gestos são uma ótima maneira de adicionar interatividade e dinamismo às suas interfaces. Continue explorando e criando projetos para se tornar um(a) expert em gestos com SwiftUI!
*/
//#-hidden-code
struct ChallengeView: View {
    @State private var points: [CGPoint] = []

    var body: some View {
        ZStack {
            Color.white
            
            Path { path in
                for point in points {
                    path.addLine(to: point)
                }
            }
            .stroke(Color.black, lineWidth: 2)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        points.append(value.location)
                    }
            )
            .gesture(
                TapGesture(count: 1)
                    .onEnded {
                        points.removeAll()
                    }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExtraChallengeView: View {
    @State private var points: [CGPoint] = []
    @State private var brushColor: Color = .black
    @State private var brushSize: CGFloat = 2.0
    
    var body: some View {
        ZStack {
            Color.white
            
            Path { path in
                for point in points {
                    path.addLine(to: point)
                }
            }
            .stroke(brushColor, lineWidth: brushSize)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        points.append(value.location)
                    }
            )
            .gesture(
                TapGesture(count: 1)
                    .onEnded {
                        points.removeAll()
                    }
            )
            
            VStack {
                Spacer()
                HStack {
                    ColorPicker("Color", selection: $brushColor)
                        .padding()
                    Slider(value: $brushSize, in: 1...10, step: 1)
                        .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
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

