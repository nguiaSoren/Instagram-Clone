//
//  HomeViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/29/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class HomePostsViewController: UIViewController {
    
    let tableView:UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        return table
    }()
    
    var isTableViewHeaderHidden = false
    var navigationBarTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        view.addSubview(tableView)
         /* if navigationBarTitle.isEmpty {
               guard let title2 = UserDefaults.standard.value(forKey: "username") as? String else{
               print("we returned from the viewDidload() because we don't have this value in our data")
               return
               }
               title = title2
               }else{
              title = navigationBarTitle
               }*/
         title = navigationBarTitle
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    var posts = [InstagramPost]()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
        tableView.frame = view.bounds
        posts.append(InstagramPost(authorUsername: "Soren Nguia", authorProfilePicture:#imageLiteral(resourceName: "soren"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "profile name,occupation,location"), creationDate: Date(), legendPost: "This is my new Idea of App", numberOfLikes: 20, authorEmail: "nguiasoren@gmail.com"))
        posts.append(InstagramPost(authorUsername: "will Smith", authorProfilePicture:#imageLiteral(resourceName: "will"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "food"), creationDate: Date(), legendPost: "very good breakfast, you need to test it in order to become like me, I am the best", numberOfLikes: 200, authorEmail: "willsmith@gmail.com"))
        posts.append(InstagramPost(authorUsername: "Selena Gomez", authorProfilePicture:#imageLiteral(resourceName: "Selena-Gomez"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "sport"), creationDate: Date(), legendPost: "I think, I will start doing sport althought I am already too sexy and pretty", numberOfLikes: 200, authorEmail: "selenagomez@gmail.com"))
        posts.append(InstagramPost(authorUsername: "Soren Nguia", authorProfilePicture:#imageLiteral(resourceName: "soren"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "trading"), creationDate: Date(), legendPost: "I started trading, I hope the results will be consequent , I am impatient to learn new things ", numberOfLikes: 30, authorEmail: "nguiasoren@gmail.com"))
        posts.append(InstagramPost(authorUsername: "will smith", authorProfilePicture:#imageLiteral(resourceName: "will"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "HairStyle"), creationDate: Date(), legendPost: "My best face in movie", numberOfLikes: 20, authorEmail: "nguiasoren@gmail.com"))
        posts.append(InstagramPost(authorUsername: "Apple", authorProfilePicture:#imageLiteral(resourceName: "apple"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "ideas tabBar Item"), creationDate: Date(), legendPost: "what do you think of this app on our new Iphone 12, we will select one in the comments that we'll give the new phone", numberOfLikes:20000, authorEmail: "apple@gmail.com"))
        posts.append(InstagramPost(authorUsername: "Soren Nguia", authorProfilePicture:#imageLiteral(resourceName: "soren"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "profile name,occupation,location"), creationDate: Date(), legendPost: "This is my new Idea of App", numberOfLikes: 20, authorEmail: "nguiasoren@gmail.com"))
        posts.append(InstagramPost(authorUsername: "will Smith", authorProfilePicture:#imageLiteral(resourceName: "will"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "food"), creationDate: Date(), legendPost: "very good breakfast, you need to test it in order to become like me, I am the best", numberOfLikes: 200, authorEmail: "willsmith@gmail.com"))
        posts.append(InstagramPost(authorUsername: "Selena Gomez", authorProfilePicture:#imageLiteral(resourceName: "Selena-Gomez"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "sport"), creationDate: Date(), legendPost: "I think, I will start doing sport althought I am already too sexy and pretty", numberOfLikes: 200, authorEmail: "selenagomez@gmail.com"))
        posts.append(InstagramPost(authorUsername: "Soren Nguia", authorProfilePicture:#imageLiteral(resourceName: "soren"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "trading"), creationDate: Date(), legendPost: "I started trading, I hope the results will be consequent , I am impatient to learn new things ", numberOfLikes: 30, authorEmail: "nguiasoren@gmail.com"))
        posts.append(InstagramPost(authorUsername: "will smith", authorProfilePicture:#imageLiteral(resourceName: "will"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "HairStyle"), creationDate: Date(), legendPost: "My best face in movie", numberOfLikes: 20, authorEmail: "nguiasoren@gmail.com"))
        posts.append(InstagramPost(authorUsername: "Apple", authorProfilePicture:#imageLiteral(resourceName: "apple"), postMediaUrl:"", postImage: #imageLiteral(resourceName: "ideas tabBar Item"), creationDate: Date(), legendPost: "what do you think of this app on our new Iphone 12, we will select one in the comments that we'll give the new phone", numberOfLikes:20000, authorEmail: "apple@gmail.com"))
        tableView.tableHeaderView?.backgroundColor = .white
        if !isTableViewHeaderHidden{
            tableView.tableHeaderView = createHeaderView()
        }
    }
    
    func createHeaderView() -> UIView {
        let headerView = UIView()
        headerView.frame.size  = CGSize(width: view.width, height: 100)
        headerView.layer.borderColor = UIColor.lightGray.cgColor
        headerView.layer.borderWidth = 0.4
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: headerView.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "majin")
        headerView.addSubview(collectionView)
        return headerView
    }
    
    
    
}

extension HomePostsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        let usernameLabeGesture = UITapGestureRecognizer(target: self, action: #selector(usernameLabelTouched))
        cell.usernameLabel.isUserInteractionEnabled = true
        cell.usernameLabel.addGestureRecognizer(usernameLabeGesture)
        cell.configure(model: posts[indexPath.row])
        return cell
    }
    @objc func usernameLabelTouched(_ gesture:UITapGestureRecognizer){
        let location = gesture.location(in: tableView)
        guard let  indexPath = tableView.indexPathForRow(at: location) else {
            print("We could not find the indexPath, So we returned")
            return
        }
        let safeEmail = posts[indexPath.row].authorEmail
        let  username = posts[indexPath.row].authorUsername
        let vc = ProfileViewController()
        //    vc.substituteSafeEmail = safeEmail
        // vc.title = username
        navigationController?.pushViewController(vc, animated: true)
        //        print(posts[indexPath.row].authorEmail)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.width+50+100
    }
}

extension HomePostsViewController:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "majin", for: indexPath)
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 40
        return cell
    }
    
    
    
}
