//
//  ImagesCollectionViewCell.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/30/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
    
    let gridImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(gridImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gridImageView.frame = CGRect(x:0, y: 0, width: contentView.width, height: contentView.height)
    }
    
    func configure(with image:UIImage){
        gridImageView.image = image
    }
    
}
