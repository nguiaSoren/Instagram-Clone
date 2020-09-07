//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/29/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var safeEmail = ""
    var navBarTitle = ""
    
    var post = [InstagramPost]()
    var IsCurrentUser = true
    var imageArray = [UIImage]()
    var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true// this allow our sectionHeader to follow with the scroll
        let collectionView = UICollectionView(frame:.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(GridCollectionViewCell.self, forCellWithReuseIdentifier:"gridCell")
        collectionView.register(ProfileVCCollectionViewCell.self, forCellWithReuseIdentifier: ProfileVCCollectionViewCell.identifier)
        collectionView.register(ProfileVCSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")// we  register our sectionHeader class
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*  if substituteSafeEmail == nil {
         guard let email1 = UserDefaults.standard.value(forKey: "safeEmail") as? String else{
         print("we returned from the viewDidload() because we don't have this value in our data")
         return
         }
         safeEmail(email1)
         }else{
         safeEmail(substituteSafeEmail!)
         }*/
        // safeEmail is nil for the moment
        if IsCurrentUser {
         /*   guard let safeEmail = UserDefaults.standard.value(forKey: "safeEmail") as? String ,let username = UserDefaults.standard.value(forKey: "username") as? String else{
                print("we returned from viewDidLoad()")
                return
            }
            self.safeEmail = safeEmail
             title = username*/
            //firebase function to retrieve informations about User thanks to safeEmail
            //firebase function to retrieve posts and image about current User thanks to safeEmail
            //post.Append(ourdata)
            collectionView.reloadData()
        }else{
         //   title = navBarTitle
            //firebase function to retrieve informations about User thanks to safeEmail
            //firebase function to retrieve posts and image about current User thanks to safeEmail
            //post.Append(ourdata)
            collectionView.reloadData()
        }
        collectionView.delegate  = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        title = "beerus19 ˅"
        // reload data
         imageArray.append(#imageLiteral(resourceName: "sorenInstagram2"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram1"))
         imageArray.append(#imageLiteral(resourceName: "sorenInstagram3"))
        imageArray.append(#imageLiteral(resourceName: "soren"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram5"))
        imageArray.append(#imageLiteral(resourceName: "sorenIntagram7"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram5"))
        imageArray.append(#imageLiteral(resourceName: "sorenIntagram7"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram2"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram4"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram9"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram4"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram9"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram8"))
        imageArray.append(#imageLiteral(resourceName: "majin logo"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram3"))
        imageArray.append(#imageLiteral(resourceName: "sorenInstagram1"))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    
}

extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return imageArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            //make sure the identifier of your cell for first section
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileVCCollectionViewCell.identifier, for: indexPath) as! ProfileVCCollectionViewCell
            return cell
        }else{
            //make sure the identifier of your cell for second section
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! GridCollectionViewCell
            cell.configure(with: imageArray[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! ProfileVCSectionHeader
            return sectionHeader
        } else { //No footer in this case but can add option for that
            return UICollectionReusableView()
        }
    }//I set my SectionHeaderView
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1{
            return CGSize(width: view.width, height: 50)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }//I set my SectionHeaderView.size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.width, height: 350)
        }else{
            return CGSize(width: view.width/3-0.2, height:view.width/3-0.2) // I put view.width/3 because I want 3 items in each line
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HomePostsViewController()
        vc.isTableViewHeaderHidden = true
        vc.navigationBarTitle = "username"
        //  vc.posts = self.posts  // the self post will be loaded with the profile.posts thank to the email
        navigationController?.pushViewController(vc, animated: true)
    }
}
