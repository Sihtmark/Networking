//
//  ProfileCell.swift
//  NetworkingProject
//
//  Created by Sergei Poluboiarinov on 2022-11-16.
//

import Foundation
import UIKit

class ProfileCell: UITableViewCell {
    let stackView = UIStackView()
    let imageView1 = UIImageView()
    let userIdLabel = UILabel()
    let idLabel = UILabel()
    let titleLabel = UILabel()
    
    static let reuseID = "ProfileCell"
    static let rowHeight: CGFloat = 350
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileCell {
    func setup() {
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView1.backgroundColor = .cyan
        imageView1.contentMode = .scaleAspectFit
        imageView1.layer.cornerRadius = 10
        imageView1.clipsToBounds = true
        
        userIdLabel.translatesAutoresizingMaskIntoConstraints = false
        userIdLabel.layer.cornerRadius = 7
        userIdLabel.clipsToBounds = true
        userIdLabel.backgroundColor = .systemGray5
        userIdLabel.textAlignment = .center
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.layer.cornerRadius = 7
        idLabel.clipsToBounds = true
        idLabel.backgroundColor = .systemGray5
        idLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.layer.cornerRadius = 7
        titleLabel.clipsToBounds = true
        titleLabel.backgroundColor = .systemGray5
        titleLabel.textAlignment = .center
        
        contentView.addSubview(imageView1)
        contentView.addSubview(userIdLabel)
        contentView.addSubview(idLabel)
        contentView.addSubview(titleLabel)
        
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            imageView1.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            imageView1.centerXAnchor.constraint(equalTo: userIdLabel.centerXAnchor),
//            trailingAnchor.constraint(equalToSystemSpacingAfter: imageView1.trailingAnchor, multiplier: 2),
//            imageView1.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView1.heightAnchor.constraint(equalToConstant: 200),
            userIdLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView1.bottomAnchor, multiplier: 2),
            userIdLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: userIdLabel.trailingAnchor, multiplier: 2),
            idLabel.topAnchor.constraint(equalToSystemSpacingBelow: userIdLabel.bottomAnchor, multiplier: 2),
            idLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: idLabel.trailingAnchor, multiplier: 2),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: idLabel.bottomAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2)
        ])
    }
}

