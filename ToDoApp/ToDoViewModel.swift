//
//  ToDoViewModel.swift
//  ToDoApp
//
//  Created by Cem Aksoy on 18.01.2025.
//

import Foundation
import CoreData

class ToDoViewModel: ObservableObject {
  let container = NSPersistentContainer(name: "ToDoContainer")
  @Published var tasks = [Task]()
  
  init() {
    container.loadPersistentStores { description, error in
      if let error = error {
        print("Error occured: \(error)")
      }
    }
    loadToDos()
  }
  
  func loadToDos() {
    let request = NSFetchRequest<Task> (entityName: "Task")
    do {
      tasks = try container.viewContext.fetch(request)
    } catch {
      print("Error occured during loading the data.")
    }
  }
  
  func addTask(title: String, date: Date, detail: String, isCompleted: Bool) {
    let newTask = Task(context: container.viewContext)
    newTask.title = title
    newTask.detail = detail
    newTask.isCompleted = isCompleted
    newTask.date = date
    saveTask()
  }
  
  func saveTask() {
    do {
      try container.viewContext.save()
      loadToDos()
    } catch {
      print("Couldn't save the task")
    }
  }
  
}
