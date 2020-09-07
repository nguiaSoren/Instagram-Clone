//
//  PostTableViewCell.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/29/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class HomePostCell: UITableViewCell {

    static var identifier = "PostTableViewCell"
    let profileImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 17.5
        return imageView
    }()
    
    let usernameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = UIFont(name: "ProximaNova-Bold", size: 16)
        return label
    }()
    
    let firstContainerView:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .tertiarySystemBackground
        return view1
    }()
    
    let imagePost:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let secondContainerView:UIView = {
        let view2 = UIView()
        view2.backgroundColor = .tertiarySystemBackground
        return view2
    }()
    
    let numberOfLikes:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
         label.font = UIFont(name: "ProximaNova-Regular", size: 16)
        return label
    }()
    
    let secondUsernameLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = UIFont(name: "ProximaNova-Bold", size: 16)
        return label
    }()
    
    let LegendPostLabel:UILabel = {
           let label = UILabel()
           label.textColor = .black
           label.numberOfLines = 2
         label.font = UIFont(name: "ProximaNova-Regular", size: 16)
           return label
       }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(firstContainerView)
        firstContainerView.addSubview(profileImageView)
        firstContainerView.addSubview(usernameLabel)
        contentView.addSubview(imagePost)
        contentView.addSubview(secondContainerView)
        secondContainerView.addSubview(numberOfLikes)
        secondContainerView.addSubview(secondUsernameLabel)
        secondContainerView.addSubview(LegendPostLabel)
     
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let contentViewWidth = contentView.width
        firstContainerView.frame = CGRect(x: 0, y: 0, width: contentView.width, height: 50)
         let firstContainerViewCenterY = firstContainerView.center.y
        profileImageView.frame  = CGRect(x: 10, y: 7.5, width: 35, height: 35)
        usernameLabel.frame = CGRect(x: profileImageView.right+15, y:firstContainerViewCenterY-10 , width: contentView.width-20, height: 20)
        imagePost.frame  = CGRect(x: 0, y: firstContainerView.bottom, width: contentView.width, height: contentView.width)
        secondContainerView.frame = CGRect(x:0, y: imagePost.bottom, width: contentView.width, height: 100)
        numberOfLikes.frame = CGRect(x: 10, y: 10, width: 80, height: 40)
        secondUsernameLabel.frame = CGRect(x:10, y: numberOfLikes.bottom, width:50, height: 20)
        let size = secondUsernameLabel.sizeThatFits(CGSize(width: 50, height: 20))
        secondUsernameLabel.frame.size.width = size.width
        LegendPostLabel.frame  = CGRect(x: secondUsernameLabel.right+10, y: numberOfLikes.bottom, width:contentViewWidth-size.width-40, height: 20)
    
        
    }
    
    func configure(model:InstagramPost){
        profileImageView.image = model.authorProfilePicture
        usernameLabel.text = model.authorUsername
        imagePost.image = model.postImage
        numberOfLikes.text = "\(model.numberOfLikes) Likes"
        secondUsernameLabel.text = model.authorUsername
        LegendPostLabel.text = model.legendPost
    }
    
}

