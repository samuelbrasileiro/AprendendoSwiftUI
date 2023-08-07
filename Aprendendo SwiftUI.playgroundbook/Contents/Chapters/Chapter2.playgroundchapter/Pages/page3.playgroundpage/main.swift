/*:
 # Desafio 2 - Contador
 
 Neste desafio, você criará uma interface interativa usando botões no SwiftUI. A interface conterá um contador que poderá ser aumentado e diminuído ao clicar nos botões correspondentes.
 
 ## Passo 1: Estrutura Básica
 
 ```swift
 import SwiftUI
 
 struct ContentView: View {
     @State private var count = 0
     
     var body: some View {
         VStack {
            // Adicione os componentes aqui
         }
     }
 }
 ```
 
 ## Passo 2: Botões de Controle
 
 Agora, adicione dois botões para aumentar e diminuir o contador. Use o componente `Button` e a modificação de estado `@State` para controlar o valor do contador.
 
 ```swift
 Button(action: {
     // Ação do botão de aumento do contador
        count += 1
     }) {
     Text("Aumentar")
 }
 
 Button(action: {
         // Ação do botão de diminuição do contador
         count -= 1
     }) {
    Text("Diminuir")
 }
 ```
 
 ## Passo 3: Exibindo o Contador
 
 Adicione um componente `Text` para exibir o valor do contador.
 
 ```swift
 Text("Contagem: \(count)")
    .font(.headline)
 ```
 
 ## Passo 4: Personalização
 
 Personalize a interface interativa! Experimente diferentes estilos de botões, tamanhos de fonte e cores para criar uma aparência única para a interface.
 
 ## Passo 5: Desafio Extra (Opcional)
 
 Se você quiser um desafio extra, adicione um botão "Zerar" que redefine o contador para zero quando clicado. Use a modificação de estado `@State` para implementar essa funcionalidade.
 
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
 
 Parabéns por concluir o Desafio 2! Agora você tem uma interface interativa que pode aumentar, diminuir e zerar o contador usando botões no SwiftUI. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces com SwiftUI.
 
 Na próxima página, teremos outro desafio para você! Divirta-se explorando e criando!
 */
//#-hidden-code

struct ChallengeView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Button(action: {
                // Ação do botão de aumento do contador
                count += 1
            }) {
                Text("Aumentar")
            }
            
            Button(action: {
                // Ação do botão de diminuição do contador
                count -= 1
            }) {
                Text("Diminuir")
            }
            
            Text("Contagem: \(count)")
                .font(.headline)
            
            Spacer()
        }
    }
}


struct ExtraChallengeView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Button(action: {
                // Ação do botão de aumento do contador
                count += 1
            }) {
                Text("Aumentar")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Button(action: {
                // Ação do botão de diminuição do contador
                count -= 1
            }) {
                Text("Diminuir")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                // Ação do botão "Zerar"
                count = 0
            }) {
                Text("Zerar")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text("Contagem: \(count)")
                .font(.headline)
            
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
