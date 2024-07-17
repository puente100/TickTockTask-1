//
//  ContentView.swift
//  TickTockTask
//
//  Created by Daniel Puente on 7/1/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newnewTask : String = ""
    
    
    var searchBar: some View {
        HStack{
            TextField("Insert new task", text: self.$newnewTask)
            Button(action: self.addTask, label: {
                Image(systemName: "plus.rectangle")
            })
        }
    }
    
    func addTask (){
        taskStore.tasks.append(Task(id:String(
            taskStore.tasks.count + 1), newTask: newnewTask))
        self.newnewTask = ""
    }
    
    var body: some View {
        VStack {
            NavigationStack{
                searchBar
                VStack{
                    List{
                        ForEach(self.taskStore.tasks) {
                            task in
                            Text(task.newTask)
                        }.onMove(perform: self.move)
                            .onDelete(perform: self.delete)
                        
                    }.navigationTitle("TickTockTask")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) { EditButton()
                            }
                        }
                }
            }
        }
        .padding()
    }
    
    func move (from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func delete (at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}





#Preview {
    ContentView()
}
