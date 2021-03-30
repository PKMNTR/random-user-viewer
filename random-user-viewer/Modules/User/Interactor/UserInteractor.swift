//
//  UserInteractor.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import Foundation

class UserInteractor {
    
    weak var presenter: UserInteractorToPresenter?
    
}

extension UserInteractor: UserPresenterToInteractor {
    
    func requestUserData() {
        guard let url = URL(string: "https://randomuser.me/api/") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let _ = error {
                DispatchQueue.main.async {
                    self?.presenter?.response(withError: "Something happens at getting data")
                }
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode),
                let responseData = data,
                let data = try? JSONDecoder().decode(UserDataResponse.self, from: responseData),
                let user = data.results.first
                else {
                    DispatchQueue.main.async {
                        self?.presenter?.response(withError: "Something happens at getting data")
                    }
                    return
            }
            DispatchQueue.main.async {
                self?.presenter?.response(withUserData: user)
            }
        }
        task.resume()
    }
    
}
