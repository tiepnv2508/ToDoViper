//
//  TodoListPresenter.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class TodoListPresenter: TodoListPresenterProtocol {
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
    
    func viewWilAppear() {
        interactor?.retrieveTodos()
    }
    
    func showTodoDetail(_ todo: TodoItem) {
        let builder = TodoDetailBuilder(todo: todo)
        router?.transistTo(builder)
    }
    
    func addTodo(_ todo: TodoItem) {
        interactor?.saveTodo(todo)
    }
    
    func removeTodo(_ todo: TodoItem) {
        interactor?.deleteTodo(todo)
    }
}

extension TodoListPresenter: TodoListInteractorOutputProtocol {
    func didAddToDo(_ todo: TodoItem) {
        interactor?.retrieveTodos()
    }
    
    func didRemoveTodo(_ todo: TodoItem) {
        interactor?.retrieveTodos()
    }
    
    func didRetrieveTodos(_ todos: [TodoItem]) {
        view?.showTodos(todos)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
}
