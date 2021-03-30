//
//  UserViewProtocols.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import Foundation

protocol UserPresenterToView: class {
    func showLoadingView()
    func hideLoadingView()
    func updateUI(withUserData data: User)
    func updateUI(withError error: String)
}

