//
//  SetProfilePhotoViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/27/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class SetProfilePhotoViewController: UIViewController {
    
    
    var email:String!
    var fullName:String!
    var password:String!
    var birthday:String!
    var username:String!
    
    let addProfilePhotoLabel:UILabel  = {
        let label = UILabel()
        label.text = "Add Profile Photo"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        return label
    }()
    
    let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "Add your name so friends know it's you"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "user Profile Icon")
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 150
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    let containerView:UIView = {
        let view1 = UIView()
        //  view1.backgroundColor = .red
        return view1
        
    }()
    
    let addPhotoButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Add a Photo", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addPhotoButtonTouched), for: .touchUpInside)
        return button
    }()
    
    let skipLabel:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        label.text  = "Skip"
        label.isUserInteractionEnabled = true
        return label
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("////////////////")
        print("WE ARE ON SET PROFILE PHOTO")
        print("username = \(username ?? "username not found")")
        print("fullName = \(fullName ?? "username not found")")
        print("password = \(password ?? "passwordnot found")")
        print("birthday = \(birthday ?? "birthday not found")")
        print("email = \(email ?? "email not found")")
        view.backgroundColor = .white
        view.addSubview(addProfilePhotoLabel)
        view.addSubview(infoLabel)
        view.addSubview(profileImageView)
        view.addSubview(containerView)
        containerView.addSubview(addPhotoButton)
        containerView.addSubview(skipLabel)
        let profileImageViewGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTouched))
        profileImageView.addGestureRecognizer(profileImageViewGesture)
        let skipLabelGesture = UITapGestureRecognizer(target: self, action: #selector(skipLabelTouched))
        skipLabel.addGestureRecognizer(skipLabelGesture)
    }
    
    
    init(email:String,fullName:String , password:String, Birthday:String,username:String) {
        super.init(nibName: nil, bundle: nil)
        self.email = email
        self.fullName = fullName
        self.password = password
        self.birthday = Birthday
        self.username = username
        
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
        let containerViewCenterX = containerView.center.x
        addProfilePhotoLabel.frame = CGRect(x: sizeWidth, y: sizeHeight/2, width: 300, height: 40)
        infoLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor, constant: 0).isActive = true
        infoLabel.frame.origin.y = addProfilePhotoLabel.bottom+10
        profileImageView.frame = CGRect(x: viewCenterX-150, y: viewCenterY-150, width: 300, height: 300)
        containerView.frame = CGRect(x: 0, y: sizeHeight*5, width: view.width, height:view.height-(sizeHeight*5))
        addPhotoButton.frame = CGRect(x: 26, y: 10, width: containerView.width-52, height: 40)
        skipLabel.frame  = CGRect(x:containerViewCenterX-20 , y: 60, width: 60, height: 30)
        //60 pour le y de skip label car le add button y = 10 et la height 40 donc son bottom cest 10+40 = 50 et 60 c'est 10 truc en bas
        // si on veut quun truc soit centré sur une view par exemmple on prend son centre(de la view) - la moitié de l'object comme ca dès que ca arrive à la moitié de la l'object il est au centre
        // la constrainterror dans ce code est du à la presentation de l'alertController , cest un bug d'apple
    }
    
    
    @objc func profileImageTouched(_ sender:UITapGestureRecognizer){
        print("profileImageTouched")
        presentAlert()
    }
    
    @objc func addPhotoButtonTouched(){
        print("add photo button touched")
        presentAlert()
    }
    
    @objc func skipLabelTouched(){
        print("Skip/Next label touched")
        guard let image = profileImageView.image else {return}
        print("///////////////////////////////")
        print(image.description)
        print("///////////////////////////////")
        let vc = ConfirmationFirstPostViewController(email: email, fullName: fullName, password: password, Birthday: birthday, username: username, profileImage: image)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
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
        present(alert, animated: true, completion: nil)
        
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

extension SetProfilePhotoViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {return}
        DispatchQueue.main.async {
            self.profileImageView.image = image
        }
        skipLabel.text = "Next"
        picker.dismiss(animated: true, completion: nil)
    }
}
