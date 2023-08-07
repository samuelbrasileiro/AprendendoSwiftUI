/*:
# Desafio 8: Galeria de Fotos Animada

Neste desafio, você criará um aplicativo de galeria de fotos com animações de transição e efeitos especiais. O aplicativo exibirá uma grade de miniaturas de fotos e, ao tocar em uma miniatura, a foto em tela cheia será exibida com efeitos de animação.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct PhotoGalleryView: View {
    @State private var isPhotoExpanded = false

    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Grade de Miniaturas

Crie uma grade de miniaturas de fotos usando o componente `LazyVGrid`. As miniaturas devem ser clicáveis para mostrar a foto em tela cheia.

```swift
LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 8) {
    // Adicione miniaturas de fotos clicáveis aqui
}
```

## Passo 3: Exibição de Foto em Tela Cheia

Crie um efeito de transição para exibir a foto em tela cheia quando a miniatura for clicada. Use a modificação de estado `@State` para controlar a exibição em tela cheia.

```swift
if isPhotoExpanded {
    // Adicione a lógica para a foto em tela cheia aqui
}
```

## Passo 4: Animações e Efeitos

Adicione efeitos de animação à transição entre a miniatura e a foto em tela cheia. Por exemplo, você pode adicionar um efeito de escala e opacidade.

```swift
// Efeito de escala e opacidade
.transition(.scale)
.opacity(isPhotoExpanded ? 1 : 0)
```

## Passo 5: Personalização

Personalize a galeria de fotos animada! Experimente diferentes efeitos de animação, durações e interações para criar uma experiência de galeria única.

## Passo 6: Desafio Extra (Opcional)

 Integre mais interatividade à galeria de fotos. Permita ao usuário percorrer as fotos em tela cheia usando gestos de deslizar para a esquerda e para a direita.
 
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

Parabéns por concluir o Desafio 8 de Galeria de Fotos Animada! Você criou um aplicativo de galeria de fotos com animações de transição e efeitos especiais. Continue praticando e experimentando para aprimorar suas habilidades de animações com SwiftUI.

As animações podem trazer vida e interatividade às suas interfaces, tornando a experiência do usuário mais agradável. Continue explorando e criando projetos para se tornar um(a) expert em animações com SwiftUI!
 */
 //#-hidden-code

struct ChallengeView: View {
    @State private var isPhotoExpanded = false
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 8) {
                // Adicione miniaturas de fotos clicáveis aqui
                ForEach(1...9, id: \.self) { index in
                    Image("photo\(index)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                isPhotoExpanded.toggle()
                            }
                        }
                }
            }
            
            if isPhotoExpanded {
                Image("photo1")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isPhotoExpanded.toggle()
                        }
                    }
                    .transition(.scale)
                    .opacity(isPhotoExpanded ? 1 : 0)
            }
        }
        .padding()
    }
}

struct ExtraChallengeView: View {
    @State private var isPhotoExpanded = false
    @State private var currentPhotoIndex = 1
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 8) {
                // Adicione miniaturas de fotos clicáveis aqui
                ForEach(1...9, id: \.self) { index in
                    Image("photo\(index)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                isPhotoExpanded.toggle()
                            }
                            currentPhotoIndex = index
                        }
                }
            }
            
            if isPhotoExpanded {
                Image("photo\(currentPhotoIndex)")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isPhotoExpanded.toggle()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                let threshold: CGFloat = 100
                                if value.translation.width > threshold {
                                    currentPhotoIndex -= 1
                                    if currentPhotoIndex < 1 {
                                        currentPhotoIndex = 9
                                    }
                                } else if value.translation.width < -threshold {
                                    currentPhotoIndex += 1
                                    if currentPhotoIndex > 9 {
                                        currentPhotoIndex = 1
                                    }
                                }
                            }
                    )
                    .transition(.scale)
                    .opacity(isPhotoExpanded ? 1 : 0)
            }
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

