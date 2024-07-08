//
//  DataStore.swift
//  TickTockTask
//
//  Created by Daniel Puente on 7/1/24.
//

import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var newTask = String()
}

class TaskStore: ObservableObject {
    @Published var task = [Task]()
}
