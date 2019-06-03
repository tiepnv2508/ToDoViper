//
//  TodoDetailInteractor.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import Foundation

class TodoDetailInteractor: TodoDetailInteractorInputProtocol {
    weak var presenter: TodoDetailInteractorOutputProtocol?
    var todoItem: TodoItem?
    var todoStoreAPI = TodoStoreAPI.shared
    
    func deleteTodo() {
        guard let todoItem = todoItem else { return }
        todoStoreAPI.removeTodo(todoItem)
        presenter?.didDeleteTodo()
    }
    
    func editTodo(title: String, content: String) {
        guard let todoItem = todoItem else { return }
        todoItem.title = title
        todoItem.content = content
        presenter?.didEditTodo(todoItem)
    }
}
