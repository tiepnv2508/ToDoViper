//
//  TodoListRouter.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import Foundation

class TodoListRouter: BaseRouter, TodoListRouterProtocol {
    func transistTo(_ builder: BaseBuilder) {
        let newViewController = builder.provide()
        viewController?.navigationController?.pushViewController(newViewController, animated: true)
    }
}
