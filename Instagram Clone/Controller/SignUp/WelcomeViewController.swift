//
//  WelcomeViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/26/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var email:String!
    var fullName:String!
    var password:String!
    var birthday:String!
    var username:String!

    
    var welcomeLabel:UILabel = {
        let label = UILabel()
        label.text = "Welcome to Instagram"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "Find people to follow and start sharing photos. You can change your username anytime"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let nextButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        button.alpha = 1
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
      //  button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        return button
    }()
    
    private let containerView:UIView = {
           let view1 = UIView()
           view1.layer.borderWidth = 0.25
           view1.layer.borderColor = UIColor.gray.cgColor
           return view1
       }()
       
        private let primaryStackView:UIStackView = {
           let stackView = UIStackView()
           stackView.backgroundColor = .red
           stackView.axis = .horizontal
           stackView.distribution = .fillProportionally
           stackView.alignment = .center
           stackView.spacing = 4
           stackView.translatesAutoresizingMaskIntoConstraints = false
           return stackView
       }()
       
       private let SignInButton:UIButton = {
           let button = UIButton()
           button.setTitle("Sign In", for:.normal)
           button.setTitleColor(UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1), for: .normal)
           button.titleLabel?.font =  .systemFont(ofSize: 14, weight: .semibold)
           button.addTarget(self, action: #selector(signInButtonTouched), for: .touchUpInside)
           return button
       }()
       
       private let alreadyAccountLabel:UILabel = {
           let label = UILabel()
           label.text = "Already have an account?"
           label.textColor = .lightGray
           label.font = .systemFont(ofSize:14,weight:.medium)
           label.textAlignment = .center
           return label
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print("WE ARE ON WELCOME VIEWCONTROLLER")
        print("email = \(email ?? "noEmailSaved")")
        print("fullName = \(fullName ?? "fullName nil")")
        print("password = \(password ?? "password nil")")
          print("birthday = \(birthday ?? "birthday")")
           print("USERNAME= \(password ?? "password nil")")
        welcomeLabel.text = "Welcome to Instagram"+" "+"\(username ?? "Welcome to Instagram")"
        view.addSubview(welcomeLabel)
        view.addSubview(infoLabel)
        view.addSubview(nextButton)
       // view.addSubview(changeUsernameButton)
        view.addSubview(containerView)
        containerView.addSubview(primaryStackView)
        primaryStackView.addArrangedSubview(alreadyAccountLabel)
        primaryStackView.addArrangedSubview(SignInButton)
        view.backgroundColor = .white
        
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
        
        welcomeLabel.frame = CGRect(x:23, y:sizeHeight, width: view.width - 46, height: 100)
        
        infoLabel.frame  = CGRect(x: 26, y: welcomeLabel.bottom + 20, width: view.width - 52, height: 60)
        nextButton.frame  = CGRect(x: 26, y: infoLabel.bottom + 20, width: view.width - 52, height: 40)
        containerView.frame = CGRect(x: 0, y: sizeHeight*5.5, width:  view.width, height: view.height/12)
        primaryStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        primaryStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        
    }
    
    
    @objc func nextButtonTouched(){
        nextVCMethod()
    }
    
    @objc func signInButtonTouched(){
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    func nextVCMethod(){
        let vc = SetProfilePhotoViewController(email: email, fullName: fullName, password: password, Birthday: birthday, username: username)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true) {
          
        }
        
        
        
    }
    
    
    
    
}
