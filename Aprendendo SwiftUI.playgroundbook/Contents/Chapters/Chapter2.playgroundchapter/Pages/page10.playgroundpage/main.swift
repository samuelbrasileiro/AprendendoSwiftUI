/*:
# Desafio 9: Lista de Filmes

Neste desafio, você criará um aplicativo de lista de filmes com informações detalhadas sobre cada filme. O aplicativo exibirá os filmes em uma grade de cards e, ao tocar em um card, mostrará informações detalhadas sobre o filme selecionado.

## Passo 1: Estrutura Básica

```swift
import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    var title: String
    var imageName: String
    var description: String
}

struct MovieListView: View {
    let movies: [Movie] = [
        Movie(title: "Filme 1", imageName: "filme1", description: "Descrição do Filme 1."),
        Movie(title: "Filme 2", imageName: "filme2", description: "Descrição do Filme 2."),
        Movie(title: "Filme 3", imageName: "filme3", description: "Descrição do Filme 3."),
        // Adicione mais filmes aqui
    ]

    var body: some View {
        // Adicione os componentes aqui
    }
}
```

## Passo 2: Grade de Cards

Crie uma grade de cards para exibir os filmes usando o componente `LazyVGrid`. Os cards devem conter o título e uma miniatura do filme.

```swift
LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), spacing: 16) {
    // Adicione cards de filmes aqui
}
```

## Passo 3: Exibição de Informações Detalhadas

Crie uma exibição de informações detalhadas para cada filme. Quando um card de filme for clicado, exiba as informações detalhadas na tela.

```swift
if let movie = selectedMovie {
    // Exiba informações detalhadas do filme aqui
}
```

## Passo 4: Selecionando Filmes

Adicione a lógica para selecionar um filme quando o card for clicado. Use a modificação de estado `@State` para controlar a exibição das informações detalhadas.

```swift
@State private var selectedMovie: Movie?

// Dentro do LazyVGrid, adicione o evento de clique para selecionar o filme
.onTapGesture {
    // Ação do clique no card de filme
    // Defina o filme selecionado como o filme correspondente ao card
}
```

## Passo 5: Personalização

Personalize o aplicativo de lista de filmes! Experimente diferentes estilos para os cards, tamanhos de fonte e cores para criar uma experiência de lista de filmes atraente.
 
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

Parabéns por concluir o Desafio 9 de Lista de Filmes com Grids! Você criou um aplicativo de lista de filmes com informações detalhadas usando SwiftUI e grids. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces com SwiftUI.

As grids são uma ótima maneira de organizar informações e criar layouts flexíveis em suas interfaces. Continue explorando e criando projetos para se tornar um(a) expert em grids com SwiftUI!
 */
//#-hidden-code
struct Movie: Identifiable {
    let id = UUID()
    var title: String
    var imageName: String
    var description: String
}

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            Color.red
                .frame(minHeight: 80)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Text(movie.title)
                .font(.headline)
                .padding(.top, 8)
        }
    }
}

struct ChallengeView: View {
    @State private var selectedMovie: Movie?
    
    var body: some View {
        LazyVGrid(columns: [.init(), .init()], spacing: 16) {
            ForEach(movies) { movie in
                MovieCard(movie: movie)
                    .onTapGesture {
                        selectedMovie = movie
                    }
            }
        }
        .padding()
        .sheet(item: $selectedMovie) { movie in
            MovieDetail(movie: movie)
        }
    }
    
    let movies: [Movie] = [
        Movie(title: "The Shawshank Redemption", imageName: "shawshank_redemption", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."),
        Movie(title: "The Godfather", imageName: "the_godfather", description: "An organized crime dynasty's aging patriarch transfers control of his clandestine empire to his reluctant son."),
        Movie(title: "The Dark Knight", imageName: "the_dark_knight", description: "When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham."),
        Movie(title: "Barbie as Rapunzel", imageName: "barbie_as_rapunzel", description: "Barbie stars as the legendary princess trapped in a tower by an evil sorceress, using her creativity and courage to plot her escape."),
        Movie(title: "Barbie of Swan Lake", imageName: "barbie_of_swan_lake", description: "In this magical tale, Barbie is transformed into a swan by day and a princess by night, discovering courage and true friendship."),
        Movie(title: "Barbie and the Magic of Pegasus", imageName: "barbie_and_the_magic_of_pegasus", description: "Barbie embarks on a flying horse adventure to save her sister and defeat an evil wizard with the help of a magical crystal."),
        Movie(title: "Barbie: A Fashion Fairytale", imageName: "barbie_a_fashion_fairytale", description: "Barbie's fashion dreams come alive in this adventure where she discovers a magical world within her aunt's fashion house.")
    ]
}

struct MovieDetail: View {
    let movie: Movie
    
    var body: some View {
        VStack {
                Color.red
                .frame(minHeight: 80)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
            
            Text(movie.title)
                .font(.title)
            
            Text(movie.description)
                .padding()
            
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
                  Text("Meu Desafio").tag(1)
              }
              .pickerStyle(SegmentedPickerStyle())
              
              Spacer()
              
              if selectedIndex == 0 {
                  ChallengeView()
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