//
//  TodoDetailBuilder.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import UIKit

class TodoDetailBuilder: BaseBuilder {
    var todo: TodoItem?
    init(todo: TodoItem) {
        self.todo = todo
    }
    
    func provide() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let todoDetailVC = storyboard.instantiateViewController(withIdentifier: "TodoDetailViewController") as? TodoDetailViewController else {
            fatalError("Invalid view controller type")
        }
        let presenter: TodoDetailPresenter & TodoDetailInteractorOutputProtocol = TodoDetailPresenter()
        todoDetailVC.presenter = presenter
        presenter.view = todoDetailVC
        let interactor: TodoDetailInteractorInputProtocol = TodoDetailInteractor()
        interactor.todoItem = todo
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router: TodoDetailRouterProtocol = TodoDetailRouter()
        presenter.router = router
        
        return todoDetailVC
    }
}
