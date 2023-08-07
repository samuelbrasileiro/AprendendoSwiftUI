/*:
 # Desafio 4 - Lista de Tarefas
 
 Neste desafio, você criará uma lista de tarefas simples usando SwiftUI. A lista conterá tarefas que podem ser marcadas como concluídas ou não concluídas.
 
 ## Passo 1: Estrutura Básica
 
 ```swift
 import SwiftUI
 
 struct ContentView: View {
    @State private var tasks: [String] = ["Tarefa 1", "Tarefa 2", "Tarefa 3"]
 
    var body: some View {
        VStack {
            // Adicione os componentes aqui
        }
    }
 }
 ```
 
 ## Passo 2: Exibindo a Lista de Tarefas
 
 Use o componente `List` para exibir a lista de tarefas. Você pode usar um `ForEach` para percorrer as tarefas e exibi-las na lista.
 
 ```swift
     List {
         ForEach(tasks, id: \.self) { task in
            // Exibir cada tarefa na lista
         }
     }
 ```
 
 ## Passo 3: Botão de Conclusão
 
 Adicione um botão ao lado de cada tarefa na lista para marcar a tarefa como concluída ou não concluída. Use o componente `Button` e a modificação de estado `@State` para implementar essa funcionalidade.
 
 ```swift
 Button(action: {
     // Ação do botão de conclusão da tarefa
     // Altere o status da tarefa entre concluída e não concluída
    }) {
     Image(systemName: "checkmark.circle")
 }
 ```
 
 ## Passo 4: Personalização
 
 Personalize a lista de tarefas! Experimente diferentes estilos para os botões de conclusão e a aparência geral da lista.
 
 ## Passo 5: Desafio Extra (Opcional)
 
 Se você quiser um desafio extra, adicione a funcionalidade de adicionar novas tarefas à lista. Crie um campo de texto e um botão "Adicionar" para que o usuário possa inserir novas tarefas.
 
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
 
 Parabéns por concluir o Desafio 4! Você criou uma lista de tarefas simples usando SwiftUI. Continue praticando e experimentando para aprimorar suas habilidades de criação de interfaces com SwiftUI.
 
 Na próxima página, teremos outro desafio para você! Divirta-se explorando e criando!
 */
//#-hidden-code

import SwiftUI

struct Task: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var isCompleted: Bool
}

struct ChallengeView: View {
    @State private var tasks: [Task] = [
        Task(name: "Tarefa 1", isCompleted: false),
        Task(name: "Tarefa 2", isCompleted: false),
        Task(name: "Tarefa 3", isCompleted: false)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Button(action: {
                            // Ação do botão de conclusão da tarefa
                            toggleTaskCompletion(task)
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .black)
                        }
                        Text(task.name)
                    }
                }
            }
        }
    }
    
    private func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks[index].isCompleted.toggle()
        }
    }
}

struct ExtraChallengeView: View {
    @State private var tasks: [Task] = [
        Task(name: "Tarefa 1", isCompleted: false),
        Task(name: "Tarefa 2", isCompleted: false),
        Task(name: "Tarefa 3", isCompleted: false)
    ]
    
    @State private var newTaskName = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(tasks) { task in
                    HStack {
                        Button(action: {
                            // Ação do botão de conclusão da tarefa
                            toggleTaskCompletion(task)
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .black)
                        }
                        Text(task.name)
                    }
                }
            }
            
            HStack {
                TextField("Nova Tarefa", text: $newTaskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Ação do botão "Adicionar"
                    addNewTask()
                }) {
                    Text("Adicionar")
                }
            }
        }
    }
    
    private func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(of: task) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    private func addNewTask() {
        if !newTaskName.isEmpty {
            let newTask = Task(name: newTaskName, isCompleted: false)
            tasks.append(newTask)
            newTaskName = ""
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
