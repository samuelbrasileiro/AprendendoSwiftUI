/*:

# Aprendendo SwiftUI - Experimento 1

## Como funciona um Texto?

 Antes de entrarmos no SwiftUI, imagine que você tem um quadro-negro onde pode escrever qualquer coisa. Em SwiftUI, esse quadro-negro é o nosso 'Text', e o que escrevemos nele são as nossas 'Strings'.

## Variáveis e Tipos de Dados

**Variável** é como uma mochila onde você pode armazenar diferentes tipos de itens: livros (textos), lápis (números) e até mesmo uma lanterna que pode estar ligada (verdadeiro) ou desligada (falso).

- **String:** Armazena textos.
```swift
var name: String = "João"
```

- **Int:** Armazena números inteiros.
```swift
var age: Int = 25
```

- **Double:** Números com casas decimais.
```swift
var height: Double = 1.75
```

- **Bool:** Valores verdadeiro (`true`) ou falso (`false`).
```swift
var isLoading: Bool = true
```

 💡 *Dica: Pense em variáveis como etiquetas que podem ser coladas em diferentes itens.*


 ## Opcionais e Nil

 Às vezes, você não sabe se sua mochila tem um item específico. Em Swift, usamos **opcionais** para isso. Eles nos dizem se há algo na mochila (`valor`) ou se está vazia (`nil`).

  ```swift
  var age: Int? = nil
  ```

 ## Texto em SwiftUI

 Agora, com sua mochila de variáveis pronta, vamos aprender como mostrá-las usando o `Text` em SwiftUI!

 ```swift
 Text("Olá, mundo!")
 ```

 
## Exibindo um Texto usando uma variável

Agora que entendemos variáveis e tipos de dados, vamos aprender como usar a variável para exibir um texto personalizado no SwiftUI. Vamos modificar o código para exibir o nome do usuário usando uma variável:

Primeiro, vamos declarar uma variável chamada `nome` do tipo `String` e atribuir um valor a ela:

```swift
var nome: String = "Maria"
```

Em seguida, vamos usar essa variável para exibir o texto personalizado:

```swift
Text("Olá, \(nome)!")
```

## Exibindo um Texto Padrão (Placeholder)
 
 Teremos vários casos onde será necessário mostrar um texto padrão caso algum valor seja nulo. Por exemplo, se um usuário não fornecer seu nome, o normal é aparecer "Sem Nome", ao invés de nada:
 
 Primeiro, vamos declarar uma variável opcional chamada `nome` do tipo `String`:
 
 ```swift
 var nome: String?
 ```
 O resultado final vai ser modificado somente se escrevermos algum texto em `nome`.
 ```swift
 nome = "João"
 ```
 Para escrever um texto padrão, é necessário escrever um novo operador `??` após o uso da variável opcional:
 
 ```swift
 Text(nome ?? "Sem Nome")
 ```
 Note que o `??` verifica se nome é nulo. Se nome for nulo, escreve "Sem Nome". Se nome tiver preenchido, escrevemos o nome, "João".
 
 
 ## Desafio 1

 1. Crie uma variável chamada `nome` e mostre ela no `Text`:
 ```swift
 var nome: String = "Maria"
 Text("Olá, \(nome)!")
 ```
*/

 import SwiftUI
 import PlaygroundSupport

 struct Challenge1View: View {
     //#-editable-code
     // Adicione a variável aqui
     
     
     //#-end-editable-code
     var body: some View {
         VStack {
             //#-editable-code
             // Adicione o Text aqui
             
             //#-end-editable-code
         }
         //#-hidden-code
         .padding()
         //#-end-hidden-code
     }
 }
 
/*:
 
 
 2. O que acontece se o nome for opcional e estiver vazio? Tente aplicar isso no Desafio 1.

 ```swift
 var nome: String?
 nome = "João"
 Text(nome ?? "Sem Nome")
 ```
 
💡 *Dica: Usamos `??` para verificar se há um valor na nossa mochila opcional.*

## Modificando a Aparência de um Texto

No SwiftUI, você pode facilmente modificar a aparência do texto, como fonte, cor e alinhamento. Vamos ver alguns exemplos:

1. **Modificando a Fonte:**
```swift
Text("Texto com Fonte Personalizada")
    .font(.title)
```

2. **Alterando a Cor:**
```swift
Text("Texto em Azul")
    .foregroundColor(.blue)
```

3. **Alinhamento do Texto:**
```swift
Text("Texto Centralizado")
    .multilineTextAlignment(.center)
```

## Desafio 2

Use o espaço abaixo para experimentar! Crie seu próprio estilo para o texto.

*/

import SwiftUI
import PlaygroundSupport

struct Challenge2View: View {
    //#-editable-code
    @State private var myText: String? = "Me Configure!"
    //#-end-editable-code
    var body: some View {
        VStack {
            //#-editable-code
            Text(myText ?? "Texto Padrão")
                .font(.title)
                .foregroundColor(.blue)
            //#-end-editable-code
        }
        //#-hidden-code
        .padding()
        //#-end-hidden-code
    }
}

/*:

...

## Desafio 3

Agora que você sabe como trabalhar com `Text` e variáveis, tente criar uma saudação personalizada usando o nome e a idade do usuário.

1. Crie duas variáveis: `nome` e `idade`.
2. Use essas variáveis para mostrar um texto no formato: "Olá, [nome]! Você tem [idade] anos!".

Por exemplo, se você definir `nome` como "Maria" e `idade` como 20, o resultado deve ser: "Olá, Maria! Você tem 20 anos!".

💡 *Dica: Lembre-se de usar interpolação de strings (usando `\(variável)`) para incluir variáveis dentro do seu texto.*

*/

struct Challenge3View: View {
    //#-editable-code
    // Adicione as variáveis aqui
    
    
    //#-end-editable-code
    var body: some View {
        VStack {
            //#-editable-code
            // Adicione o Text aqui
            
            //#-end-editable-code
        }
        //#-hidden-code
        .padding()
        //#-end-hidden-code
    }
}

/*:
 ## Refletindo

 - **Autoavaliação:** Em uma escala de 1 a 5, quão confortável você se sente usando o `Text` em SwiftUI agora?
 1. 🙁 Não me sinto confortável.
 2. 😐 Entendi o básico, mas preciso de mais prática.
 3. 😌 Sinto-me moderadamente confortável.
 4. 😊 Estou bastante confortável, mas ainda tenho algumas dúvidas.
 5. 😄 Muito confiante!
 
 - **Desafios:** Qual foi o desafio mais interessante? Havia algum conceito que você achou difícil de entender inicialmente?

 - **Aplicações Práticas:** Em quais situações do mundo real você acha que pode aplicar o que aprendeu hoje sobre `Text`?

 - **Feedback:** Achou que algo poderia ser abordado de forma diferente?

 
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
            Picker(selection: $selectedExampleIndex, label: Text("Selecione o Desafio")) {
                Text("Desafio 1").tag(0)
                Text("Desafio 2").tag(1)
                Text("Desafio 3").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            
            if selectedExampleIndex == 0 {
                Challenge1View()
            } else if selectedExampleIndex == 1 {
                Challenge2View()
            } else {
                Challenge3View()
            }
            Spacer()
        }
        .padding()
    }
}
let contentView = ContentView()
PlaygroundPage.current.setLiveView(contentView)
//#-end-hidden-code
