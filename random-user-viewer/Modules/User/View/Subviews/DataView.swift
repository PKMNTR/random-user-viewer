//
//  DataView.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import UIKit

class DataView: UIView {
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 5
        return stack
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let emailLabel = UILabel()
    
    let phoneLabel = UILabel()
    
    let cellLabel = UILabel()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Address:"
        return label
    }()
    
    let streetLabel = UILabel()
    
    let cityLabel = UILabel()
    
    let stateLabel = UILabel()
    
    let countryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        activateConstraints()
    }
    
    func setupUI() {
        addSubview(stack)
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(emailLabel)
        stack.addArrangedSubview(phoneLabel)
        stack.addArrangedSubview(cellLabel)
        stack.addArrangedSubview(addressLabel)
        stack.addArrangedSubview(streetLabel)
        stack.addArrangedSubview(cityLabel)
        stack.addArrangedSubview(stateLabel)
        stack.addArrangedSubview(countryLabel)
    }
    
    func activateConstraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateUI(withUserData data: User) {
        nameLabel.text = "\(data.name.title) \(data.name.first) \(data.name.last)"
        emailLabel.text = data.email
        phoneLabel.text = "Phone: \(data.phone)"
        cellLabel.text = "Cell: \(data.cell)"
        streetLabel.text = "\(data.location.street.name) \(data.location.street.number)"
        cityLabel.text = data.location.city
        stateLabel.text = data.location.state
        countryLabel.text = data.location.country
    }
    
}
