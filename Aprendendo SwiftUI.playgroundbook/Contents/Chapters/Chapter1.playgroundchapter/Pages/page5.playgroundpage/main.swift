/*:
 # Aprendendo SwiftUI - Experimento 4: Botão

 ## Introdução

 Os botões são elementos fundamentais em qualquer interface de usuário. Eles permitem que o usuário interaja com o aplicativo, executando ações específicas.

 ## O Básico: Como Funciona um Botão?

 Um botão no SwiftUI é composto por duas partes principais:

 1. **Ação:** O que acontece quando o botão é pressionado.
 2. **Conteúdo:** Como o botão é apresentado visualmente.

 Vamos observar um exemplo básico.

 Note que temos a ação (que imprime uma mensagem no console) e o conteúdo (que é um texto).
 
 */

 //#-hidden-code
 import SwiftUI
 import PlaygroundSupport
 //#-end-hidden-code

 struct ButtonExample: View {
//#-editable-code
     

     var body: some View {
         Button(action: {
             print("Botão foi clicado!")
         }) {
             Text("Clique aqui!")
         }
         .padding()
         .background(Color.blue)
         .foregroundColor(.white)
         .cornerRadius(10)
     }
//#-end-editable-code
 }


/*:


## Desafio 1: Botão com dois textos

Ao invés de ser apenas um texto no botão, adicione dois textos no Botão.
 
 💡 *Dica: Você pode botar os dois textos dentro de um VStack e o VStack dentro do botão.*


## Botão com Ação Personalizada

Já que entendemos o básico, vamos dar um passo adiante. Os botões podem fazer muito mais do que apenas imprimir mensagens. Eles podem mudar o estado de sua interface!

*/

struct CustomButtonExample: View {
//#-editable-code
    @State private var textColor = Color.white

    var body: some View {
        Button(action: {
            textColor = getRandomColor()
        }) {
            Text("Mude minha cor!")
        }
        .padding()
        .background(textColor)
        .cornerRadius(10)
        .foregroundColor(.black)
    }
//#-end-editable-code

    private func getRandomColor() -> Color {
        return [Color.red, Color.blue, Color.green].randomElement() ?? .yellow
    }
}

/*:
 
 ## Entendendo o `@State`

 O `@State` é uma propriedade wrapper fornecida pelo SwiftUI, que indica que o valor da propriedade pode mudar ao longo do tempo e que a interface deve ser atualizada para refletir essa mudança.

 Imagine `@State` como uma maneira de dizer ao SwiftUI para "observar" uma variável. Quando o valor dessa variável muda, o SwiftUI sabe que precisa reconstruir a view para refletir essa nova informação.

 No nosso exemplo `CustomButtonExample`, o `@State` é usado para monitorar a variável `textColor`. Quando o botão é pressionado e a cor muda, o SwiftUI automaticamente atualiza a view para mostrar a nova cor.

## Desafio 2
 
Ao invés de mudar a cor do fundo do botão, mude a cor do texto do botão!


## Desafio 3

Crie um botão que, ao ser pressionado, aumente um contador exibido no texto do botão.

  1. Você vai adicionar uma variável contador
  `@State var contador: Int = 0`
  2. Crie um botão, com action e um texto "Adicionar"
  3. Dentro da action do botão, você escreve contador = contador + 1, para acrescentar 1 no contador
  4. Adicione um Text para visualizar o valor do contador

*/

struct CounterView: View {
//#-editable-code
    // Adicione as variáveis aqui

    var body: some View {
        VStack {
            // Adicione as views aqui
            
        }
    }
    
//#-end-editable-code
}
/*:
## **Refletindo**
 
### **Autoavaliação:**
Em uma escala de 1 a 5, quão confortável você se sente ao usar Stacks em SwiftUI?

### **Desafios:**
Qual foi o aspecto mais desafiador ao trabalhar com Stacks? Há algum conceito que você achou particularmente confuso?

### **Aplicações Práticas:**
Em quais situações do mundo real você imagina usar Stacks?

### **Feedback:**
Há algo que você gostaria de explorar mais ou que acha que poderia ser explicado de forma diferente?
### Escreva as reflexões nos comentários:
*/
//#-hidden-code
/*
//#-end-hidden-code
 
//#-editable-code
 Autoavaliação:
 
 Desafios:
 
 Aplicações Práticas:
 
 Feedback:

//#-end-editable-code
//#-hidden-code
*/

struct ContentView: View {
    @State private var selectedExampleIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $selectedExampleIndex, label: Text("Selecione o Exemplo")) {
                Text("Botão com Print").tag(0)
                Text("Botão com Ação").tag(1)
                Text("Desafio 3").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selectedExampleIndex == 0 {
                ButtonExample()
            } else if selectedExampleIndex == 1 {
                CustomButtonExample()
            } else if selectedExampleIndex == 2 {
                CounterView()
            }
            
            Spacer()
        }
        .padding()
    }
}
let contentView = ContentView()
PlaygroundPage.current.setLiveView(contentView)
//#-end-hidden-code
