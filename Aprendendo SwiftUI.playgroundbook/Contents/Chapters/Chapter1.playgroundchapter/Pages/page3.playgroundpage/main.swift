/*:
 # Aprendendo SwiftUI - Experimento 2
 
 ## Entendendo a Estrutura de uma View no SwiftUI
 
 Antes de mergulharmos no código, vamos entender a estrutura básica de uma View no SwiftUI e como as diferentes partes se unem para criar a interface do usuário.
 
 ## View
 
 No SwiftUI, uma View é representada como uma struct. Uma struct no Swift é uma maneira de combinar propriedades e métodos relacionados. Neste caso, a View é nossa combinação visual de elementos na tela.
*/
struct ContentView: View {
    // Código da View aqui...
    var body: some View {
        // Retorno da hierarquia de visualização (estrutura da View)
        //#-hidden-code
        VStack {
            
        }
        //#-end-hidden-code
    }
}
/*:
 ## Propriedades e Personalização
 
 Uma das forças do SwiftUI é a personalização. Ao adicionar propriedades à nossa View, podemos moldar e adaptar nossa View de maneira dinâmica.
 
*/
struct MyTextView: View {
    var userText: String = "Olá, Mundo!"// Propriedade
    
    var body: some View {
        Text(userText) // Utilizando a propriedade na View
    }
}
/*:
 
 ## `import` e Frameworks
 
 A instrução `import traz ferramentas e funcionalidades de frameworks externos. Com ela, expandimos as capacidades de nossa aplicação.
 
 */
import SwiftUI // Importando o framework SwiftUI
/*:
 
 ## `Preview` e Visualização Interativa
 
 Com o SwiftUI, podemos ver nossas mudanças em tempo real, graças ao `PreviewProvider`.
 
*/
struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView(userText: "Hello, SwiftUI!") // Visualização interativa da View
    }
}


/*:
 
 ## Desafio 1
 
 Agora que você já aprendeu como criar uma View básica e como usar propriedades para personalizar essa View, vamos colocar isso em prática.
 
 1. Adicione uma nova variáveis `String` chamada `name` na view.
 2. Adicione outras duas variáveis do tipo `Float`, chamadas `weight` e `height`.
 3. Use essas variáveis para mostrar um texto no formato: "[name] está com [weight] quilos e [height] cm de altura".

 Por exemplo, se você definir `nome` como "Samuel", `weight` como 70 e height como 1.73, o resultado deve ser: "Samuel está com 70 quilos e 1.73 m de altura".
 
 💡 *Dica:  Use a View `Text` para exibir sua mensagem.*
 
*/

import SwiftUI
import PlaygroundSupport

struct Challenge1View: View {
    //#-editable-code
    // Adicione as variáveis aqui
    
    
    var body: some View {
        VStack {
            // Adicione as Views aqui
            
        }
    }
    //#-end-editable-code
}

/*:

  ## Structs

  ### 1. O que é uma Struct?

  Em Swift, a `struct` é uma forma de agrupar propriedades (como variáveis e constantes) e comportamentos (como funções) relacionados em uma única unidade. Pense nisso como criar um novo tipo de dado!

  🧠 ***Dica Intelectual:** Em termos técnicos, uma `struct` é um tipo de valor. Isso significa que quando você passa uma `struct` de uma função para outra, ela é copiada, não referenciada.*

  ### 2. Montando sua Primeira Estrutura

 Podemos usar uma `struct` para representar um livro:

  ```swift
  struct Book {
      var title: String
      var author: String
      var pages: Int
  }
  ```

  Agora, temos um novo tipo chamado `Book` que pode armazenar um título, autor e número de páginas.

  ### 3. Funções

  Você pode não apenas armazenar informações em sua `struct`, mas também definir ações que fazem sentido para ela:

  ```swift
  struct Book {
      var title: String
      var author: String
      var pages: Int
      
      func description() -> String {
          return "\(title) é um livro de \(author) com \(pages) páginas."
      }
  }
  ```

  ### 4. Deixe a Estrutura Trabalhar para Você

  Agora, você pode criar um novo livro e descobrir sua descrição em um piscar de olhos:

  ```swift
  let myFavoriteBook = Book(title: "Swift Avançado", author: "Maria José", pages: 300)
  print(myFavoriteBook.description())
  ```

  🎉 **Resultado:** `Swift Avançado é um livro de Maria José com 300 páginas.`


 
 ## Desafio 2
 
 Como agora você já sabe Structs, vamos recriar a View do Desafio 1, agora usando `Struct`.
 
 1. Crie uma nova `Struct` chamada `Pessoa` com as variáveis `name`, `weight` e `height`.
 2. Crie uma função `imcDescription` dentro de `Pessoa` que retorna uma `String`: "[name] está com um imc igual a [cálculo do imc (peso/altura^2)]"
 3. Adicione uma variável do tipo `Pessoa` na View.
 4. Adicione um Text na View e chame a função ``
 
 Por exemplo, se você definir `nome` como "Samuel", `weight` como 70 e height como 1.73, o resultado deve ser: "Samuel está com um imc igual a 23.38"
 
 💡 *Dica:  Você pode fazer cálculos diretamente na interpolação de strings (`\(variável)`)*

*/

import SwiftUI
import PlaygroundSupport

//#-editable-code
// Adicione os Structs aqui


//#-end-editable-code
struct Challenge2View: View {
    //#-editable-code
    // Adicione as variáveis aqui
    
    
    var body: some View {
        VStack {
            // Adicione as Views aqui
            
        }
    }
    //#-end-editable-code
}

/*:
 
 ## Desafio 3: Usando `import`
 
 Já vimos que é possível importar frameworks com a keyword `import`.
 
 1. Importe o framework `Foundation`.
 2. Use a classe `Date` do framework `Foundation` para exibir a data atual na sua View.
 
*/
//#-editable-code
// Adicione os imports aqui
import SwiftUI
import PlaygroundSupport


//#-end-editable-code

struct Challenge3View: View {
    //#-editable-code
    // Adicione as variáveis aqui
    
    
    var body: some View {
        VStack {
            // Adicione as Views aqui
            
            
        }
    }
    //#-end-editable-code
}

/*:
 
 ## Refletindo

 - **Autoavaliação:** Em uma escala de 1 a 5, quão confortável você se sente ao criar e personalizar Views em SwiftUI?

 1. 🙁 Não me sinto confortável.
 2. 😐 Entendi o básico, mas preciso de mais prática.
 3. 😌 Sinto-me moderadamente confortável.
 4. 😊 Estou bastante confortável, mas ainda tenho algumas dúvidas.
 5. 😄 Muito confiante!

 - **Desafios:**
    - Qual aspecto das `structs` você achou mais desafiador de compreender?
    - Ao trabalhar com Views, houve algum momento em que você se sentiu particularmente confuso?

 - **Aplicações Práticas:** Pense sobre os aplicativos que você usa diariamente ou sobre os projetos que gostaria de criar.
    - Como você pode estruturar as informações e as interfaces de usuário usando `structs` e Views?

 - **Feedback:**
     - Achou que algo poderia ser abordado de forma diferente?
     - Achou que algum tópico precisava de mais exemplos práticos ou uma explicação mais aprofundada?

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
struct ContentView2: View {
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
let contentView = ContentView2()
PlaygroundPage.current.setLiveView(contentView)
//#-end-hidden-code

