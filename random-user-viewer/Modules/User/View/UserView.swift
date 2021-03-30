//
//  UserView.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import UIKit

class UserView: UIViewController {
    
    var presenter: UserViewToPresenter?
    
    let loadingView = LoadingView()
    
    let mainScrollView = UIScrollView()
    
    let mainContainer = UIView()
    
    let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    let photoView = PhotoView()
    
    let dataView = DataView()
    
    let mapView = MapView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func loadView() {
        super.loadView()
        title = "People randomizer"
        setupUI()
        activateConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainContainer)
        mainContainer.addSubview(mainStack)
        mainStack.addArrangedSubview(photoView)
        mainStack.addArrangedSubview(dataView)
        mainStack.addArrangedSubview(mapView)
    }
    
    func activateConstraints() {
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        mainContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainContainer.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainContainer.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainContainer.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor)
        ])
        
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: mainContainer.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: mainContainer.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: mainContainer.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: mainContainer.bottomAnchor)
        ])
        
        photoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
        ])
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ])
    }
    
}

extension UserView: UserPresenterToView {
    
    func showLoadingView() {
        add(loadingView)
    }
    
    func hideLoadingView() {
        loadingView.remove()
    }
    
    func updateUI(withUserData data: User) {
        photoView.updateUIWith(userImageUrl: data.picture.large)
        dataView.updateUI(withUserData: data)
        guard let latitude = Double(data.location.coordinates.latitude),
              let longitude = Double(data.location.coordinates.longitude)
            else {
            return
        }
        mapView.centerMapOn(latitude: latitude, longitude: longitude)
    }
    
    func updateUI(withError error: String) {
        present(
            SystemAlertHelper.createInformativeAlert(
                title: "Error",
                message: error,
                buttonTitle: "Ok",
                completion: nil
            ),
            animated: true,
            completion: nil
        )
    }
    
}
