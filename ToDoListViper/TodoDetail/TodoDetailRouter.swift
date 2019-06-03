//
//  TodoDetailRouter.swift
//  ToDoListViper
//
//  Created by Kaka on 6/3/19.
//  Copyright © 2019 Tiep Nguyen. All rights reserved.
//

import UIKit

class TodoDetailRouter: BaseRouter, TodoDetailRouterProtocol {
    func transistBack() {
        viewController?.dismiss(animated: true)
    }
}
