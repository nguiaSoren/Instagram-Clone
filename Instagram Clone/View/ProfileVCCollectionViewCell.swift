//
//  UserProfileCollectionViewCell.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/30/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class ProfileVCCollectionViewCell: UICollectionViewCell {
    static var identifier = "UserProfileCollectionViewCell"
    
    let profileImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 2
        imageView.image = #imageLiteral(resourceName: "soren")
        return imageView
    }()
    
    let postsLabel:UILabel = {
        let label = UILabel()
        label.text = "Posts"
        label.font = UIFont(name:"ProximaNova-Regular", size: 16)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let followersLabel:UILabel = {
        let label = UILabel()
        label.text = "Followers"
        label.font = UIFont(name:"ProximaNova-Regular", size: 16)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let followingLabel:UILabel = {
        let label = UILabel()
        label.text = "Following"
        label.font = UIFont(name:"ProximaNova-Regular", size: 16)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let numberOfPostsLabel:UILabel = {
        let label = UILabel()
        label.text = "34"
        label.font = UIFont(name:"ProximaNova-Bold", size: 18)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let numberOfFollowersLabel:UILabel = {
        let label = UILabel()
        label.text = "2290000"
        label.font = UIFont(name:"ProximaNova-Bold", size: 18)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfFollowingLabel:UILabel = {
           let label = UILabel()
           label.text = "6,356"
           label.font = UIFont(name:"ProximaNova-Bold", size: 18)
           label.sizeToFit()
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    let fullNameLabel:UILabel = {
        let label = UILabel()
        label.text = "ctp_fx CEO"
        label.font = UIFont(name:"ProximaNova-Bold", size: 16)
        label.sizeToFit()
        return label
    }()
    
    let bioTextView:UITextView = {
        let textView = UITextView()
        textView.text = "📲Copy our exact trade \n✈️18000+ clients worldwide \n📨 click the link to get started \n•#forex #forexsignalservice #forexmarket #fx \njoin.copytradeprofitfx.com/sales-newp65sdhh2\n•Chart Artist/FX Analysts\n•Pro Membership +25 Analysis-Setups/Week"
        textView.font = UIFont(name:"ProximaNova-Regular", size: 16)
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isSelectable = true
        textView.sizeToFit()
        textView.backgroundColor = .tertiarySystemGroupedBackground
        return textView
    }()
    
    let followButton:UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = UIColor(red:0.27058824, green: 0.55686275, blue: 1, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name:"ProximaNova-Bold", size: 16)
        button.layer.cornerRadius = 2
        return button
    }()
    
    let messageButton:UIButton = {
           let button = UIButton()
           button.setTitle("Message", for: .normal)
            button.backgroundColor = .white
           button.setTitleColor(.black, for: .normal)
           button.titleLabel?.font = UIFont(name:"ProximaNova-Bold", size: 16)
           button.layer.cornerRadius = 2
           return button
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // if number of whatever.count > 3 take the three first and add K
        // like 229000 = 229K
        contentView.backgroundColor = .tertiarySystemGroupedBackground
        contentView.addSubview(profileImageView)
        contentView.addSubview(postsLabel)
        contentView.addSubview(followersLabel)
        contentView.addSubview(followingLabel)
        contentView.addSubview(numberOfPostsLabel)
        contentView.addSubview(numberOfFollowersLabel)
        contentView.addSubview(numberOfFollowingLabel)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(bioTextView)
        contentView.addSubview(followButton)
        contentView.addSubview(messageButton)
      
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.frame = CGRect(x: 10, y: 10, width: 110, height: 110)
        //   postsLabel.frame.origin = CGPoint(x: 200, y: 40)
        
        if contentView.width <= 375 { // for iphone 8 screenWidth size and lower like SE
            postsLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
            postsLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 20).isActive = true
            followersLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
            followersLabel.leftAnchor.constraint(equalTo: postsLabel.rightAnchor, constant: 20).isActive = true
            followingLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
            followingLabel.leftAnchor.constraint(equalTo: followersLabel.rightAnchor, constant: 20).isActive = true
        }else{ // bigger screen
            postsLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
            postsLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 30).isActive = true
            followersLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
            followersLabel.leftAnchor.constraint(equalTo: postsLabel.rightAnchor, constant: 30).isActive = true
            followingLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
            followingLabel.leftAnchor.constraint(equalTo: followersLabel.rightAnchor, constant: 30).isActive = true
        }
        
        numberOfPostsLabel.bottomAnchor.constraint(equalTo: postsLabel.topAnchor, constant: 0).isActive = true
        numberOfPostsLabel.centerXAnchor.constraint(equalTo: postsLabel.centerXAnchor).isActive = true
        numberOfFollowersLabel.bottomAnchor.constraint(equalTo: followersLabel.topAnchor, constant: 0).isActive = true
        numberOfFollowersLabel.centerXAnchor.constraint(equalTo: followersLabel.centerXAnchor).isActive = true
        numberOfFollowingLabel.bottomAnchor.constraint(equalTo: followingLabel.topAnchor, constant: 0).isActive = true
        numberOfFollowingLabel.centerXAnchor.constraint(equalTo: followingLabel.centerXAnchor).isActive = true
        fullNameLabel.frame.origin = CGPoint(x:profileImageView.left+2, y: profileImageView.bottom+10)
        bioTextView.frame.origin = CGPoint(x:profileImageView.left+2, y: fullNameLabel.bottom)
        followButton.frame = CGRect(x:profileImageView.left+2, y: bioTextView.bottom+2, width: contentView.width/2.2, height: 25)
        messageButton.frame = CGRect(x:followButton.right+10, y: bioTextView.bottom+2, width: contentView.width/2.2, height: 25)
    }
    
    
   

    }

