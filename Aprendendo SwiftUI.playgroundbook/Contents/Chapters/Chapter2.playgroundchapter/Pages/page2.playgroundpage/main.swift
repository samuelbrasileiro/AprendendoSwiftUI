/*:
# Desafio 1: Perfil de Usuário

Neste desafio, você criará um perfil de usuário simples usando SwiftUI. O perfil exibirá uma foto do usuário, o nome, a idade e uma breve descrição.

## Passo 1: Estrutura Básica

Comece criando um novo projeto no Xcode e abra o arquivo ContentView.swift. Dentro da estrutura `ProfileView`, substitua o código existente pelo seguinte esqueleto:

```swift
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // Adicione os componentes aqui
        }
    }
}
```

## Passo 2: Foto do Usuário

Adicione uma foto do usuário usando o componente `Image`. Você pode usar uma imagem de sua escolha ou um ícone do sistema fornecido pelo SwiftUI.

```swift
Image(systemName: "person.circle.fill")
    .resizable()
    .frame(width: 100, height: 100)
    .foregroundColor(.blue)
```

## Passo 3: Informações do Usuário

Agora, adicione as informações do usuário, incluindo o nome, a idade e a descrição, usando o componente `Text`.

```swift
Text("Nome: Seu Nome")
    .font(.headline)

Text("Idade: Sua Idade")
    .font(.subheadline)

Text("Breve Descrição sobre Você")
    .multilineTextAlignment(.center)
```

## Passo 4: Personalização

Personalize o perfil do usuário! Experimente diferentes fontes, cores, alinhamentos e espaçamentos para criar uma aparência única.
 
## Passo 5: Desafio Extra (Opcional)
 
 Explore novas funções avançadas: Adicione um botão que permita ao usuário editar as informações do perfil. Quando o botão for clicado, exiba campos de texto editáveis para que o usuário possa atualizar seu nome, idade e descrição.
 
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

Parabéns por concluir o Desafio 1! Você criou um perfil de usuário personalizado usando SwiftUI. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces com SwiftUI.

Na próxima página, teremos outro desafio para você! Divirta-se explorando e criando!
*/

//#-hidden-code
struct ChallengeView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text("Nome: John Doe")
                .font(.headline)

            Text("Idade: 30 anos")
                .font(.subheadline)

            Text("Sou um entusiasta de SwiftUI e adoro criar aplicativos incríveis.")
                .multilineTextAlignment(.center)

            Spacer()
        }
    }
}

struct ExtraChallengeView: View {
    @State private var isEditing: Bool = false
    @State private var name: String = "John Doe"
    @State private var age: String = "30 anos"
    @State private var description: String = "Sou um entusiasta de SwiftUI e adoro criar aplicativos incríveis."

    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            if isEditing {
                TextField("Nome", text: $name)
                    .font(.headline)

                TextField("Idade", text: $age)
                    .font(.subheadline)

                TextField("Descrição", text: $description)
                    .multilineTextAlignment(.center)
            } else {
                Text("Nome: \(name)")
                    .font(.headline)

                Text("Idade: \(age)")
                    .font(.subheadline)

                Text(description)
                    .multilineTextAlignment(.center)
            }

            Button(action: {
                isEditing.toggle()
            }) {
                Text(isEditing ? "Salvar" : "Editar")
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
