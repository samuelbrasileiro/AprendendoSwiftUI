/*:
# Desafio 5: Ficha de Cadastro

Neste desafio, você criará uma ficha de cadastro em um app usando o SwiftUI. Os campos de texto permitirão que o usuário insira seus dados. Não se esqueça do botão de concluir.
 
 Lembre-se que, ao apertar o botão de concluir, é necessário checar se os dados foram escritos.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct ContentView: View {
    @State private var text: String = ""

    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Campo de Texto

Crie um campo de texto onde o usuário possa inserir texto.

```swift
TextField("Digite seu texto", text: $text)
    .padding()
    .textFieldStyle(RoundedBorderTextFieldStyle())
```

## Passo 3: Personalização

Personalize o campo de texto! Experimente diferentes estilos, tamanhos de fonte e cores para criar um campo de texto personalizado único.

## Passo 4: Desafio Extra (Opcional)
 
 Para o nome de usuário, mostre um contador de caractere na table view. Além disso, cheque se os dados foram escritos de maneira correta: A idade é um número válido, o email é um email válido, etc.
 
## Meu código

No bloco de código abaixo, complete o desafio:
*/

import SwiftUI
import PlaygroundSupport
//#-editable-code

struct ContentView: View {
    @State private var text: String = ""

    var body: some View {
        VStack {
            
        }
    }
}

//#-end-editable-code

/*:
## Conclusão

Parabéns por concluir o Desafio 5 de Campo de Texto Personalizado! Agora você tem um campo de texto que permite ao usuário inserir texto e exibe a contagem de caracteres em tempo real. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces com SwiftUI.
 */

//#-hidden-code
struct ChallengeView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var age: String = ""

    var body: some View {
        VStack {
            TextField("Nome", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Idade", text: $age)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Concluir", action: {
                // Ação do botão de concluir
                // Aqui você pode realizar a validação dos dados inseridos
                if !name.isEmpty && !email.isEmpty && !age.isEmpty {
                    // Dados válidos, faça o que for necessário aqui
                    print("Nome: \(name)")
                    print("Email: \(email)")
                    print("Idade: \(age)")
                } else {
                    // Dados inválidos, exiba uma mensagem de erro ou alerta
                    print("Dados inválidos. Preencha todos os campos corretamente.")
                }
            })
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct ExtraChallengeView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var age: String = ""

    var body: some View {
        VStack {
            TextField("Nome", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Idade", text: $age)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Concluir", action: {
                // Ação do botão de concluir
                // Aqui você pode realizar a validação dos dados inseridos
                if !name.isEmpty && isValidEmail(email) && isValidAge(age) {
                    // Dados válidos, faça o que for necessário aqui
                    print("Nome: \(name)")
                    print("Email: \(email)")
                    print("Idade: \(age)")
                } else {
                    // Dados inválidos, exiba uma mensagem de erro ou alerta
                    print("Dados inválidos. Preencha todos os campos corretamente.")
                }
            })
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)

            // Contador de caracteres para o nome
            Text("Caracteres no nome: \(name.count)")
                .foregroundColor(name.count > 10 ? .red : .black)
        }
        .padding()
    }

    // Função para validar o email
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    // Função para validar a idade (considerando que seja um número inteiro)
    private func isValidAge(_ age: String) -> Bool {
        return Int(age) != nil
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

