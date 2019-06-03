//
//  TodoListInteractor.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import Foundation

class TodoListInteractor: TodoListInteractorInputProtocol {
    weak var presenter: TodoListInteractorOutputProtocol?
    var todoStoreAPI = TodoStoreAPI.shared
    var todos: [TodoItem] {
        return todoStoreAPI.todos
    }
    
    func retrieveTodos() {
        presenter?.didRetrieveTodos(todos)
    }
    
    func saveTodo(_ todo: TodoItem) {
        todoStoreAPI.addTodo(todo)
        presenter?.didAddToDo(todo)
    }
    
    func deleteTodo(_ todo: TodoItem) {
        todoStoreAPI.removeTodo(todo)
        presenter?.didRemoveTodo(todo)
    }
}
