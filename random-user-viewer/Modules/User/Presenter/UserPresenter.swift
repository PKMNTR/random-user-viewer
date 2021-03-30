//
//  UserPresenter.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import Foundation

import Foundation

class UserPresenter {
    
    weak var view: UserPresenterToView?
    var interactor: UserPresenterToInteractor?
    var router: UserPresenterToRouter?
        
    init(view: UserPresenterToView, interactor: UserPresenterToInteractor, router: UserPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension UserPresenter: UserInteractorToPresenter {
    
    func response(withUserData data: User) {
        view?.hideLoadingView()
        view?.updateUI(withUserData: data)
    }
    
    func response(withError error: String) {
        view?.hideLoadingView()
        view?.updateUI(withError: error)
    }
    
}

extension UserPresenter: UserRouterToPresenter {
    
}

extension UserPresenter: UserViewToPresenter {
    
    func requestUserData() {
        view?.showLoadingView()
        interactor?.requestUserData()
    }
    
}

