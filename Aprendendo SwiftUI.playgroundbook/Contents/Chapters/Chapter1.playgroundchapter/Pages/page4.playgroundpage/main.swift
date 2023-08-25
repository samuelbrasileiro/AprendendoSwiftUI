/*:
# Aprendendo SwiftUI - Experimento 3: Stacks

 ## **Introdução aos Stacks**
 Stacks no SwiftUI são ferramentas fundamentais que nos permitem alinhar e organizar Views. Eles agem como contêineres que distribuem os elementos de acordo com o tipo do Stack. Existem três tipos principais:

 1. **VStack:** Alinha os elementos verticalmente.
 2. **HStack:** Alinha os elementos horizontalmente.
 3. **ZStack:** Sobrepoem os elementos, ideal para criar efeitos de camada.

 ## **Aprofundando em Cada Stack**

 ### **VStack: Pilha Vertical**

 Veja como um `VStack` pode organizar os elementos de cima para baixo:


*/
//#-hidden-code
import PlaygroundSupport
import SwiftUI
//#-end-hidden-code
struct VStackExample: View {
    //#-editable-code
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Detalhes")
                .font(.title)

            Text("João das Neves")
                .font(.headline)
            
            Text("Desenvolvedor iOS")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
    //#-end-editable-code
}

/*:

 ## Desafio 1

Agora que você visualizou como funciona a VStack, experimente adicionar mais elementos ao `VStackExample` e observe como eles são organizados.
 1. Adicione um novo `Text` com o nome de uma cidade, com cor azul, entre o nome e a profissão.
 2. Adicione um novo `Text` com um endereço, depois da profissão.
 
 
### **HStack: Pilha Horizontal**

 Observe como um `HStack` organiza os elementos horizontalmente:

*/

struct HStackExample: View {
    //#-editable-code
    
    var body: some View {
        HStack(spacing: 20) {
            Text("João das Neves")
            
            Text("Curtir")
        }
    }
    //#-end-editable-code
}

/*:
 ### Desafio 2
 Tente adicionar um texto com a quantidade de curtidas, como "92 curtidas" à direita do texto "Curtir" e observe o comportamento.
 O comportamento foi igual ao que você esperava?
 
 ### **Mesclando Stacks**

 Não estamos limitados a usar um único tipo de Stack. Veja como você pode combinar um `VStack` e um `HStack` para criar uma interface complexa:

*/

struct MixedStacksExample: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("João das Neves")
                .font(.headline)
            
            Text("Desenvolvedor iOS")
                .font(.subheadline)
            HStack {
                Text("Curtir")
                    .font(.headline)
                    .foregroundColor(.blue)

                Text("95 curtidas")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

/*:
### **ZStack: Pilha deSobreposição**

 O `ZStack` permite que você crie designs de sobreposição. Elementos adicionados mais recentemente aparecerão "na frente" dos adicionados anteriormente.

*/

struct ZStackExample: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
            
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
        }
    }
}

/*:
 ### Desafio 3
 
 Crie uma interface de cartão de usuário que inclui um nome, profissão, quantidade de seguidores, idade e data de nascimento.
 
 Use tanto VStack quanto HStack.
 
 Divirta-se criando sua interface personalizada!
 */

struct ActivityView: View {
    //#-editable-code
    
    
    var body: some View {
        VStack {
            
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
                Text("VStack").tag(0)
                Text("HStack").tag(1)
                Text("MixStack").tag(2)
                Text("ZStack").tag(3)
                Text("Desafio 4").tag(4)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selectedExampleIndex == 0 {
                VStackExample()
            } else if selectedExampleIndex == 1 {
                HStackExample()
            } else if selectedExampleIndex == 2 {
                MixedStacksExample()
            } else if selectedExampleIndex == 3 {
                ZStackExample()
            } else {
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