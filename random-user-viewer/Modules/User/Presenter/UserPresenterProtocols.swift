//
//  UserPresenterProtocols.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import Foundation

protocol UserViewToPresenter: class {
    func requestUserData()
}

protocol UserInteractorToPresenter: class {
    func response(withUserData data: User)
    func response(withError error: String)
}

protocol UserRouterToPresenter: class {
    
}
