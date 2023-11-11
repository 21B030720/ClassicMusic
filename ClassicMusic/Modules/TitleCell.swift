//
//  TitleCell.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 24.10.2023.
//

import UIKit

class TitleCell: UICollectionViewCell {
    //    let content: UIImageView = UIImageView()
        let content: UIView = UIView()
        let imageView: UIImageView = UIImageView()
        let labelView: UILabel = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(content)
            content.translatesAutoresizingMaskIntoConstraints = false
            content.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            content.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100).isActive = true
            content.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
            
            content.addSubview(imageView)
            content.addSubview(labelView)
            setupImageView()
            setupTextView()
            
        }
        
        func setupImageView() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.leftAnchor.constraint(equalTo: content.leftAnchor, constant: 10).isActive = true
            imageView.topAnchor.constraint(equalTo: content.topAnchor).isActive = true
    //        imageView.rightAnchor.constraint(equalTo: content.rightAnchor).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: bounds.width ).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: bounds.height - 100).isActive = true
        }
        
        func setupTextView() {
            labelView.translatesAutoresizingMaskIntoConstraints = false
            labelView.leftAnchor.constraint(equalTo: content.leftAnchor).isActive = true
            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            labelView.rightAnchor.constraint(equalTo: content.rightAnchor).isActive = true
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder: ) has not been emplemented")
        }
}
