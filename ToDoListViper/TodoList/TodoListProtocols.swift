//
//  TodoListProtocols.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

protocol TodoListViewProtocol: class {
    var presenter: TodoListPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
    func showTodos(_ todos: [TodoItem])
    func showErrorMessage(_ message: String)
}

protocol TodoListPresenterProtocol: class {
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    //VIEW -> PRESENTER
    func viewWilAppear()
    func showTodoDetail(_ todo: TodoItem)
    func addTodo(_ todo: TodoItem)
    func removeTodo(_ todo: TodoItem)
}

protocol TodoListInteractorInputProtocol: class {
    var presenter: TodoListInteractorOutputProtocol? { get set }
    
    //PRESENTER -> INTERACTOR
    func retrieveTodos()
    func saveTodo(_ todo: TodoItem)
    func deleteTodo(_ todo: TodoItem)
}

protocol TodoListInteractorOutputProtocol: class {
    //INTERACTOR -> PRESENTER
    func didAddToDo(_ todo: TodoItem)
    func didRemoveTodo(_ todo: TodoItem)
    func didRetrieveTodos(_ todo: [TodoItem])
    func onError(message: String)
}

protocol TodoListRouterProtocol: class {
    //PRESENTER -> ROUTER
    func transistTo(_ builder: BaseBuilder)
}
