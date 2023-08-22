/*:
# Desafio 10: Aplicativo de Navegação

Neste desafio, você criará um aplicativo de navegação com várias telas usando SwiftUI. O aplicativo terá uma tela inicial com uma lista de itens e, ao tocar em um item da lista, será exibida uma tela de detalhes com informações mais detalhadas sobre o item selecionado.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var description: String
}

struct ListView: View {
    let items: [Item] = [
        Item(name: "Item 1", description: "Descrição do Item 1."),
        Item(name: "Item 2", description: "Descrição do Item 2."),
        Item(name: "Item 3", description: "Descrição do Item 3."),
        // Adicione mais itens aqui
    ]

    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Tela Inicial

Crie a tela inicial com uma lista de itens. Use o componente `List` para exibir os itens e adicione a navegação para a tela de detalhes.

```swift
NavigationView {
    List(items) { item in
        // Adicione o link para a tela de detalhes
        NavigationLink(destination: Destination, label: {
            Text(item.name)
        })
    }
}
```

## Passo 3: Tela de Detalhes

Crie a tela de detalhes para exibir informações mais detalhadas sobre o item selecionado. Use o componente `Text` para exibir o nome e a descrição do item.

```swift
struct DetailView: View {
    let item: Item

    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)

            Text(item.description)
                .multilineTextAlignment(.center)
        }
    }
}
```

## Passo 4: Ligando Tela Inicial à Tela de Detalhes

Agora você deve ligar a tela inicial à tela de detalhes. Quando um item da lista for selecionado, a tela de detalhes com as informações do item selecionado deve ser exibida.

```swift
NavigationView {
    List(items) { item in
        NavigationLink(destination: DetailView(item: item), label: {
            Text(item.name)
        })
    }
}
```

## Passo 5: Personalização

Personalize o aplicativo de navegação! Experimente diferentes estilos para as listas, detalhes e cores para criar uma experiência de navegação única.

## Passo 6: Desafio Extra (Opcional)
 
 Você criará um aplicativo de navegação com várias telas. O aplicativo terá uma tela inicial com uma lista de itens e, ao tocar em um item da lista, será exibida uma tela de detalhes com informações mais detalhadas sobre o item selecionado.
 
## Meu código

No bloco de código abaixo, complete o desafio:
*/

import SwiftUI
import PlaygroundSupport
//#-editable-code

// Adicione suas outras views aqui


struct ContentView: View {

    
    var body: some View {
        // Aqui você adiciona seu código
        VStack {
            
        }
    }
}
//#-end-editable-code
/*:
## Conclusão

Parabéns por concluir o Desafio 10 de Aplicativo de Navegação! Agora você tem um aplicativo com várias telas, permitindo que o usuário navegue entre os itens e veja mais informações sobre cada um. Continue praticando e experimentando para aprimorar suas habilidades de navegação com SwiftUI.

A navegação é um aspecto importante na criação de aplicativos e interfaces complexas, permitindo que os usuários interajam e explorem o conteúdo de maneira intuitiva. Continue explorando e criando projetos para se tornar um(a) expert em navegação com SwiftUI!
*/
//#-hidden-code

struct Item: Identifiable {
    let id = UUID()
    var name: String
    var description: String
}

struct DetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)
            
            Text(item.description)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct ChallengeView: View {
    let items: [Item] = [
        Item(name: "Item 1", description: "Descrição do Item 1."),
        Item(name: "Item 2", description: "Descrição do Item 2."),
        Item(name: "Item 3", description: "Descrição do Item 3.")
        // Adicione mais itens aqui
    ]
    
    var body: some View {
        NavigationView {
            List(items) { item in
                NavigationLink(destination: DetailView(item: item), label: {
                    Text(item.name)
                })
            }
            .navigationTitle("Lista de Itens")
        }
    }
}

struct ExtraChallengeView: View {
    let items: [Item] = [
        Item(name: "Item 1", description: "Descrição do Item 1."),
        Item(name: "Item 2", description: "Descrição do Item 2."),
        Item(name: "Item 3", description: "Descrição do Item 3.")
        // Adicione mais itens aqui
    ]
    
    @State private var selectedItem: Item? = nil
    
    var body: some View {
        NavigationView {
            List(items) { item in
                Text(item.name)
                    .onTapGesture {
                        selectedItem = item
                    }
            }
            .navigationTitle("Lista de Itens")
            .sheet(item: $selectedItem) { item in
                DetailView(item: item)
            }
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

