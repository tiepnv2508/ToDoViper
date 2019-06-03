//
//  TodoDetailPresenter.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import UIKit

class TodoDetailPresenter: TodoDetailPresenterProtocol {
    weak var view: TodoDetailViewProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    var router: TodoDetailRouterProtocol?
    
    func viewDidLoad() {
        if let todoItem = interactor?.todoItem {
            view?.showTodo(todoItem)
        }
    }
    
    func deleteTodo() {
        interactor?.deleteTodo()
    }
    
    func editTodo(title: String, content: String) {
        interactor?.editTodo(title: title, content: content)
    }
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    func didDeleteTodo() {
        router?.transistBack()
    }
    
    func didEditTodo(_ todo: TodoItem) {
        view?.showTodo(todo)
    }
}
