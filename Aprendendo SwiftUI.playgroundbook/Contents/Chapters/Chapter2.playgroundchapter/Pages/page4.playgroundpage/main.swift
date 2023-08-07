/*:
# Desafio 3 - Cartão de Convite

Neste desafio, você criará um cartão de convite personalizado usando SwiftUI. O cartão de convite conterá informações sobre o evento, como título, data, hora e local.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Stack Entrelaçado

Use vários stacks entrelaçados para organizar as informações do cartão de convite. Você pode usar `VStack`, `HStack` e `ZStack` conforme necessário para criar a estrutura desejada.

```swift
VStack {
    VStack {
        // Componentes para exibir o título do evento
    }

    HStack {
        // Componentes para exibir a data, hora e local do evento
    }
}
```

## Passo 3: Personalização

Personalize o cartão de convite! Experimente diferentes estilos para os textos, cores, fundos e espaçamentos para criar uma aparência única para o cartão.

## Passo 4: Desafio Extra (Opcional)

Se você quiser um desafio extra, adicione um botão "Confirmar Presença" ao cartão de convite. Use a modificação de estado `@State` para alternar entre "Confirmado" e "Não Confirmado" ao clicar no botão.

```swift
Button(action: {
    // Ação do botão "Confirmar Presença"
    // Alterne entre "Confirmado" e "Não Confirmado"
}) {
    Text("Confirmar Presença")
}
```
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

Parabéns por concluir o Desafio 3! Você criou um cartão de convite personalizado usando SwiftUI. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces com SwiftUI.

Na próxima página, teremos outro desafio para você! Divirta-se explorando e criando!
*/
//#-hidden-code

struct ChallengeView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Convite para o Evento")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Data:")
                    Text("Hora:")
                    Text("Local:")
                }
                VStack(alignment: .leading) {
                    Text("21 de Agosto, 2023")
                    Text("18:00 - 21:00")
                    Text("Local do Evento")
                }
            }
            
            Spacer()
        }
    }
}

struct ExtraChallengeView: View {
    @State private var isConfirmed = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Convite para o Evento")
                    .font(.title)
                    .foregroundColor(.blue)
                    .padding()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Data:")
                    Text("Hora:")
                    Text("Local:")
                }
                VStack(alignment: .leading) {
                    Text("21 de Agosto, 2023")
                    Text("18:00 - 21:00")
                    Text("Local do Evento")
                }
            }
            
            Button(action: {
                // Ação do botão "Confirmar Presença"
                isConfirmed.toggle()
            }) {
                Text(isConfirmed ? "Confirmado" : "Confirmar Presença")
                    .padding()
                    .foregroundColor(.white)
                    .background(isConfirmed ? Color.green : Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
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
