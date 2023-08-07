/*:
# Aprendendo SwiftUI - Experimento 3: Stacks

## Introdução aos Stacks

Stacks são uma parte essencial do SwiftUI que nos permitem organizar e posicionar elementos de interface de forma flexível e eficiente. No SwiftUI, existem três tipos principais de Stacks:

1. VStack: Uma pilha vertical que organiza seus elementos de cima para baixo.
2. HStack: Uma pilha horizontal que organiza seus elementos da esquerda para a direita.
3. ZStack: Uma pilha que posiciona os elementos em uma sobreposição, permitindo criar efeitos de camadas.

## Como funciona?

Abaixo, você encontrará exemplos práticos para cada tipo de Stack (VStack, HStack e ZStack). Execute o Código e use a Segmented Control para selecionar o exemplo que deseja visualizar.
 
Adicionei algumas propriedades para melhorar a visualização, mas elas não são o objetivo.

## VStack: Pilha Vertical

Neste exemplo, uma pilha vertical (VStack) organiza três elementos verticalmente: um ícone, um título e uma descrição.

*/
//#-hidden-code
import PlaygroundSupport
import SwiftUI
//#-end-hidden-code
struct VStackExample: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Text("John Doe")
                .font(.headline)
            
            Text("Desenvolvedor iOS")
                .font(.subheadline)
        }
        .padding()
    }
}

/*:
## HStack: Pilha Horizontal

Neste exemplo, uma pilha horizontal (HStack) organiza dois elementos horizontalmente: um ícone e um texto.

*/

struct HStackExample: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.red)
            
            Text("Curtir")
                .font(.headline)
        }
        .padding()
    }
}


/*:
## VStack e HStack Misturados

Agora, vamos combinar os dois Stacks para criar uma interface com o ícone, título, descrição e um botão, todos organizados verticalmente.

*/

struct MixedStacksExample: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Text("John Doe")
                .font(.headline)
            
            Text("Desenvolvedor iOS")
                .font(.subheadline)
            
            HStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.red)
                
                Text("Curtir")
                    .font(.headline)
            }
        }
        .padding()
    }
}

/*:
## ZStack: Sobreposição de Elementos

Uma pilha Z (ZStack) sobrepoem um círculo azul com uma estrela amarela, criando um efeito de camadas.

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
 ## Vamos Praticar!
 
 Agora é sua vez de praticar! Experimente editar os exemplos existentes ou criar suas próprias interfaces usando VStack, HStack ou ZStack. Use a Segmented Control para selecionar e visualizar cada exemplo.
 
 Lembre-se de que você pode utilizar os ícones do sistema (systemName) disponíveis no SwiftUI ou até mesmo adicionar suas próprias imagens.
 
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
## Bora Continuar
 
 Agora que você é expert em diagramação de views através de Stacks, bora explorar como funcionam os botões!
*/
//#-hidden-code
struct ContentView: View {
    @State private var selectedExampleIndex = 0

    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $selectedExampleIndex, label: Text("Selecione o Exemplo")) {
                Text("VStack").tag(0)
                Text("HStack").tag(1)
                Text("MixStack").tag(2)
                Text("ZStack").tag(3)
                Text("Atividade").tag(4)
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
