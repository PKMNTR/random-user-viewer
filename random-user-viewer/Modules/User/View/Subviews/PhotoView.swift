//
//  PhotoView.swift
//  random-user-viewer
//
//  Created by Ricardo Ramirez on 29/03/21.
//

import UIKit
import SDWebImage

class PhotoView: UIView {
    
    let photoIV: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
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
        addSubview(photoIV)
    }
    
    func activateConstraints() {
        photoIV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoIV.topAnchor.constraint(equalTo: topAnchor),
            photoIV.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoIV.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoIV.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateUIWith(userImageUrl urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        photoIV.sd_setImage(with: url, completed: nil)
    }
    
}
