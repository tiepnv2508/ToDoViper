//
//  TodoDetailViewProtocols.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import UIKit

protocol TodoDetailViewProtocol: class {
    var presenter: TodoDetailPresenterProtocol? { get set }
    
    //PRESENTER -> VIEW
    func showTodo(_ todo: TodoItem)
}

protocol TodoDetailPresenterProtocol: class {
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set }
    var router: TodoDetailRouterProtocol? { get set }
    
    //VIEW -> PRESENTER
    func viewDidLoad()
    func deleteTodo()
    func editTodo(title: String, content: String)
}

protocol TodoDetailInteractorInputProtocol: class {
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    var todoItem: TodoItem? { get set }
    
    //PRESENTER -> INTERACTOR
    func deleteTodo()
    func editTodo(title: String, content: String)
}

protocol TodoDetailInteractorOutputProtocol: class {
    //INTERACTOR -> PRESENTER
    func didDeleteTodo()
    func didEditTodo(_ todo: TodoItem)
}

protocol TodoDetailRouterProtocol: class {
    //PRESENTER -> ROUTER
    func transistBack()
}
