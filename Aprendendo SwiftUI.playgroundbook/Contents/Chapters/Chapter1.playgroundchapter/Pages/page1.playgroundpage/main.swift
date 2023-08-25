/*:
# Aprendendo SwiftUI - Introdução! 😃

Olá, Aprendiz! Seja bem-vindo ao mundo do SwiftUI! 🚀

Neste tutorial, embarcaremos em uma jornada emocionante para aprender a criar interfaces incríveis usando o SwiftUI, uma tecnologia fantástica desenvolvida pela Apple!

## Por que aprender SwiftUI?

O SwiftUI é uma maneira inovadora e poderosa de criar interfaces de usuário para aplicativos iOS, macOS, watchOS e tvOS. Com o SwiftUI, você pode trazer suas ideias à vida de forma rápida e divertida, tudo através do código Swift.

### Simplicidade e Diversão!

Imagine criar botões, caixas de texto, imagens e muito mais, tudo isso usando a elegância do código Swift. O SwiftUI foi projetado para ser intuitivo e fácil de usar, permitindo que você se concentre na expressão da sua criatividade em vez de lidar com detalhes complexos.

### Visualização em Tempo Real!

Uma das coisas mais legais sobre o SwiftUI é a capacidade de ver suas alterações em tempo real enquanto escreve o código. Isso significa que você pode fazer experimentos e ajustes imediatamente, tornando o processo de desenvolvimento muito mais interativo e gratificante!

## Vamos começar!

Estamos empolgados para iniciar essa jornada com você! Nas próximas páginas, mergulharemos nos conceitos fundamentais do SwiftUI e, ao final deste playground, você estará pronto para criar suas próprias interfaces de usuário deslumbrantes.

Antes de começarmos, por favor, insira seu nome abaixo para personalizarmos sua experiência. 👇
*/

//#-hidden-code

import Commons
import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    @State private var userName: String
    
    init(name: String) {
        self.userName = name
    }
    var body: some View {
        GreetingsView(userName: $userName)
    }
}
//#-end-hidden-code
//#-code-completion(everything, hide)
let name: String = /*#-editable-code*/"<#Escreva seu nome#>"/*#-end-editable-code*/

var view = ContentView(name: name)
//#-hidden-code
PlaygroundPage.current.setLiveView(view)
//#-end-hidden-code

/*:
## O que é o SwiftUI?

O SwiftUI é uma tecnologia da Apple que permite criar interfaces de usuário para aplicativos de uma maneira fácil e divertida! Com o SwiftUI, você pode criar botões, caixas de texto, imagens e muito mais, tudo usando código Swift!

Além disso, com o SwiftUI, você pode ver as alterações em tempo real conforme escreve o código. Isso significa que você pode fazer experimentos e ver como seu aplicativo fica na hora!

Vamos começar a fazer alguns experimentos!
*/
