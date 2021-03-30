//
//  UserRouter.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import Foundation

class UserRouter {
    
    weak var presenter: UserRouterToPresenter?
    
    class func createModule() -> UserView {
        let view = UserView()
        let interactor = UserInteractor()
        let router = UserRouter()
        let presenter = UserPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter
        
        presenter.requestUserData()
        
        return view
    }
    
}

extension UserRouter: UserPresenterToRouter {
    
}
