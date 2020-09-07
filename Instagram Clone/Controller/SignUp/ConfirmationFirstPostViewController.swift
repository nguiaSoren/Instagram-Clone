//
//  ConfirmationFirstPostViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/26/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit
import Firebase

class ConfirmationFirstPostViewController: UIViewController {
    
    var email:String!
    var fullName:String!
    var password:String!
    var birthday:String!
    var username:String!
    var profilePictureImage:UIImage!
    
    let profilePictureImageView:UIImageView = {
        let imageView  = UIImageView()
        imageView.contentMode  = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
       imageView.layer.cornerRadius = 50
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    let profilePhotoAddedLabel:UILabel  = {
        let label = UILabel()
        label.text = "Profile Photo Added"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    let changePhotoLabel:UILabel  = {
        let label  = UILabel()
        label.textColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        label.text = "Change Photo"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let sharePostLabel:UILabel  = {
        let label  = UILabel()
        label.textColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        label.text = "Also share this photo as a post"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    let infoLabel:UILabel  = {
        let label  = UILabel()
        label.textColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        label.text = "make this photo your first post so people can like and comment on it"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    private let nextButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        return button
    }()
    
    let responseSwitch:UISwitch = {
        let switch1 = UISwitch()
        switch1.isOn = true
        switch1.onTintColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        return switch1
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        profilePictureImageView.image = profilePictureImage
        view.addSubview(profilePictureImageView)
        view.addSubview(profilePhotoAddedLabel)
        view.addSubview(changePhotoLabel)
        view.addSubview(sharePostLabel)
        view.addSubview(infoLabel)
        view.addSubview(nextButton)
        view.addSubview(responseSwitch)
        let profilePictureImageViewGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTouched))
         profilePictureImageView.addGestureRecognizer(profilePictureImageViewGesture)
        let changePhotoLabelGesture = UITapGestureRecognizer(target: self, action: #selector(changePhotoLabelLabelTouched))
       changePhotoLabel.addGestureRecognizer(changePhotoLabelGesture)
    }
   
      
    
    
    init(email:String,fullName:String , password:String, Birthday:String,username:String,profileImage:UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.email = email
        self.fullName = fullName
        self.password = password
        self.birthday = Birthday
        self.username = username
        self.profilePictureImage = profileImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let sizeHeight = view.height/6
        let sizeWidth = view.width/4
        let viewCenterX = view.center.x
        let viewCenterY = view.center.y
        let profilePhotoCenterX =  profilePictureImageView.center.x
        
        profilePictureImageView.frame = CGRect(x: viewCenterX-50, y: sizeHeight/2, width: 100, height: 100)
         profilePhotoAddedLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor, constant: 0).isActive = true
        profilePhotoAddedLabel.frame.origin.y =  profilePictureImageView.bottom+20
        changePhotoLabel.frame = CGRect(x: profilePhotoCenterX-55, y: profilePhotoAddedLabel.bottom, width: 150, height: 40)
        sharePostLabel.frame = CGRect(x: 26, y: changePhotoLabel.bottom+20, width: 280, height: 30)
        infoLabel.frame = CGRect(x: 26, y: sharePostLabel.bottom+10, width: sizeWidth*3, height: 40)
        nextButton.frame  = CGRect(x: 26, y: infoLabel.bottom + 20, width: view.width - 52, height: 40)
        responseSwitch.frame  = CGRect(x: nextButton.right-49, y: changePhotoLabel.bottom+18, width: 49, height: 31)
        // we set responseSwitch.frame.origin.x = nextButton.right-49 for  because we want the end of our reponseSwitch width to be the same as the nextButton , so we take the end coordinates(right) of our nextbutton - responseSwitch.width(49) 
        
    }
    
    @objc func nextButtonTouched(){
        print(1)
      /*  if responseSwitch.isOn {
            //share post
        }*/
     /*   guard let email = email,let image = profilePictureImageView.image else{
            print("we return")
            return
        }*/
        let safeEmail = databaseManager.safeEmail(email)
        print(2)
    
        storageManager.shared.uploadProfileImage(with: profilePictureImageView.image!, safeEmail: safeEmail) { success in
            print("ok")
            if success {
                storageManager.shared.downloadURL(for: "images/profileImages/\(safeEmail)_profile_image") { result in
                    switch result {
                    case .success(let url):
                        print("downloaded url = \(url)")

                        
                    case .failure(let error):
                        print(error)
                    }
                    print(3)
                }
                print(4)
            }
            print(5)
        }
        
       print("nextButtonTouched")
        print("go to viewController")
     
    }
    
    @objc func profileImageTouched(){
       print("profileImageTouched")
        presentAlert()
    }
  
    
    @objc func changePhotoLabelLabelTouched(){
         print("changePhotoLabelLabelTouched")
        presentAlert()
    }
    func presentAlert(){
            let alert = UIAlertController(title: "Add Profile Photo", message: nil, preferredStyle: .actionSheet)
            let takePhotoAction = UIAlertAction(title: "Take Picture", style: .default) { [weak self] (action) in
                guard let strongSelf = self else {return}
                strongSelf.takePhoto()
            }
            let choosePhotoAction = UIAlertAction(title: "Choose From Library", style: .default) { [weak self](action) in
                guard let strongSelf = self else {return}
                strongSelf.choosePhoto()
            }
            
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            alert.addAction(takePhotoAction)
            alert.addAction(choosePhotoAction)
            alert.addAction(cancelAction)
           // alert.view.addSubview(UIView())
            present(alert, animated: true, completion: nil)
            
        }
       
    

  

}

extension ConfirmationFirstPostViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {return}
        DispatchQueue.main.async {
            self.profilePictureImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func takePhoto(){
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate  = self
        present(picker, animated: true, completion: nil)
    }
    
    func choosePhoto(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate  = self
        present(picker, animated: true, completion: nil)
    }
}
