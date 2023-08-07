/*:
# Aprendendo SwiftUI - Experimento 4: Botão

## Introdução ao Botão no SwiftUI

Botões são elementos essenciais para adicionar interatividade aos seus aplicativos SwiftUI. Eles permitem que os usuários executem ações, como imprimir uma mensagem na saída, navegar para outra tela ou executar uma tarefa específica.

## Exemplo Prático: Botão com Print

Vamos começar com um exemplo simples de botão que irá mostrar uma mensagem no console quando for clicado.

*/
//#-hidden-code
import SwiftUI
import PlaygroundSupport
//#-end-hidden-code
struct ButtonExample: View {
    var body: some View {
        Button(action: {
            print("Botão foi clicado!")
        }) {
            Text("Clique aqui!")
            //#-hidden-code
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
            //#-end-hidden-code
        }
        //#-hidden-code
        .padding()
        //#-end-hidden-code
    }
}

/*:
## Botão com Ação Personalizada

Agora, vamos criar um exemplo de botão que executa uma ação personalizada. Neste caso, quando o botão for clicado, a cor do texto será alterada aleatoriamente.
 
 O atributo `@State` é usado para permitir que os valores de propriedades sejam atualizados automaticamente, refletindo essas mudanças na interface do SwiftUI em tempo real.
*/

struct CustomButtonExample: View {
    @State private var textColor = Color.white
    
    var body: some View {
        Button(action: {
            textColor = getRandomColor()
        }) {
            Text("Clique para mudar a cor")
            //#-hidden-code
                .padding()
                .foregroundColor(.black)
            //#-end-hidden-code
                .background(textColor)
            //#-hidden-code
                .cornerRadius(10)
            //#-end-hidden-code
        }
        //#-hidden-code
        .padding()
        //#-end-hidden-code
    }
//#-hidden-code
    private func getRandomColor() -> Color {
        let colors: [Color] = [.red, .green, .blue, .orange, .purple]
        return colors.randomElement()!
    }
//#-end-hidden-code
}

/*:
## Vamos Praticar!

Agora, é hora de você criar um botão mais complexo! Crie um botão que, quando clicado, alterne entre dois textos diferentes: "Hello" e "Olá". Utilize uma propriedade para controlar o texto exibido e alterne entre eles com o botão.

Divirta-se praticando com botões e criando interatividade em seus aplicativos SwiftUI!

*/

struct ActivityView: View {
    @State private var textToShow = "Hello"
    
    var body: some View {
        VStack {
            Button(action: {
                // Alterne entre "Hello" e "Olá" ao clicar no botão
                //#-editable-code
                
                print("Clicou no botão")
                
                //#-end-editable-code
            }) {
                Text(textToShow)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            //#-hidden-code
            .padding()
            //#-end-hidden-code
        }
    }
}
/*:
$$ Bora Continuar
 
Parabéns!Agora você pode criar interatividade em seus aplicativos SwiftUI :)
*/
//#-hidden-code
struct ContentView: View {
    @State private var selectedExampleIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $selectedExampleIndex, label: Text("Selecione o Exemplo")) {
                Text("Botão com Print").tag(0)
                Text("Botão com Ação").tag(1)
                Text("Atividade").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selectedExampleIndex == 0 {
                ButtonExample()
            } else if selectedExampleIndex == 1 {
                CustomButtonExample()
            } else if selectedExampleIndex == 2 {
                ActivityView()
            }
            
            Spacer()
        }
        .padding()
    }
}
let contentView = ContentView()
PlaygroundPage.current.setLiveView(contentView)
//#-end-hidden-code
