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
    @State var newnewTask = String()
  
    
    var searchBar: some View {
        HStack{
            TextField("Insert new task", text: self.$newnewTask)
            Button(action: self.addTask, label: {
                Image(systemName: "plus.rectangle")
            })
        }
    }
    
    func addTask (){
        taskStore.task.append(Task(id:String(
            taskStore.task.count + 1), newTask: newnewTask))
        self.newnewTask = ""
        }
    
    var body: some View {
        VStack {
            NavigationStack{
                searchBar
                VStack{
                    List(self.taskStore.task) {
                        task in
                        Text(task.newTask)
                    }.navigationTitle("To Do List")
                }.onMove(perform: <#T##Optional<(Foundation.IndexSet, Int) -> Void>#>)
            }
        }
        .padding()
    }
}

func move (from source: IndexSet, to destination: Int) {
    TaskStore.task.move(fromOffsets: source, toOffset: destination)
}

#Preview {
    ContentView()
}
