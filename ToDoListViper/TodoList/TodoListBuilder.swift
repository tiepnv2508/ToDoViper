//
//  TodoListBuilder.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import UIKit

class TodoListBuilder: BaseBuilder {
    func provide() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navController = storyboard.instantiateViewController(withIdentifier: "TodoListNavigation") as! UINavigationController
        guard let todoListViewController = navController.topViewController as? TodoListViewController else { fatalError("Invalid View Controller") }
        
        let presenter: TodoListPresenterProtocol & TodoListInteractorOutputProtocol = TodoListPresenter()
        let interactor: TodoListInteractorInputProtocol = TodoListInteractor()
        let router = TodoListRouter(viewController: todoListViewController)
        
        todoListViewController.presenter = presenter
        presenter.view = todoListViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return navController
    }
}
