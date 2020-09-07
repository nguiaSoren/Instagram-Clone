//
//  ChangeUsernameViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/26/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit
import JGProgressHUD
import Firebase

class ChangeUsernameViewController: UIViewController {
    var email:String!
    var fullName:String!
    var password:String!
    var birthday:String!
    
    private let spinner = JGProgressHUD(style: .dark)
    
    var changeUsernameLabel:UILabel = {
        let label = UILabel()
        label.text = "Change Username"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "Pick a username for your account. You can always change it later."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let usernameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.returnKeyType = .continue
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.clearButtonMode  = .whileEditing
        textField.addTarget(self, action: #selector(textFieldDidChange),
                            for: .editingChanged)
      //  textField.rightView = UIImageView(image:UIImage(systemName: "arrow.clockwise"))
       // textField.rightView?.frame = CGRect(x: 0, y: 20, width: 5, height: 5)
        return textField
    }()
    
    let nextButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        button.alpha = 1
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        return button
    }()
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("WE ARE ON CHANGEUSERNAME VIEWCONTROLLER")
        print("email = \(email ?? "noEmailSaved")")
        print("fullName = \(fullName ?? "fullName nil")")
        print("password = \(password ?? "password nil")")
        print("birthday = \(birthday ?? "birthday nil")")
        view.addSubview(changeUsernameLabel)
        view.addSubview(infoLabel)
        view.addSubview(usernameTextField)
        view.addSubview(nextButton)
        view.backgroundColor = .white
        usernameTextField.delegate = self
    }
    
    init(email:String,fullName:String , password:String, Birthday:String) {
        super.init(nibName: nil, bundle: nil)
        self.email = email
        self.fullName = fullName
        self.password = password
        self.birthday = Birthday
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let sizeHeight = view.height/6
        let sizeWidth = view.width/4
        changeUsernameLabel.frame = CGRect(x:sizeWidth, y:sizeHeight, width: 300, height: 30)
        infoLabel.frame = CGRect(x: 26, y: changeUsernameLabel.bottom + 15, width: view.width - 52, height: 40)
        usernameTextField.frame = CGRect(x:26, y: infoLabel.bottom + 20, width: view.width - 52, height: 40)
        nextButton.frame  = CGRect(x: 26, y: usernameTextField.bottom + 20, width: view.width - 52, height: 40)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
    }
    
    @objc func nextButtonTouched(){
        nextVCMethod()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        usernameTextField.becomeFirstResponder()
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text?.replacingOccurrences(of: " ", with: ""), !text.isEmpty else{
            print("it is not")
            textField.text = ""
            nextButton.alpha = 0.7
            return
        }
        nextButton.alpha = 1
        
        
    }
    
    
    func nextVCMethod(){
        if nextButton.alpha == 1 {
            guard let username = usernameTextField.text,!username.isEmpty,!email.isEmpty,let email = email,let fullName = fullName,!fullName.isEmpty,let password = password,!password.isEmpty,let birthday = birthday,!birthday.isEmpty else{
                print("we return")
                return
            }
            
            let safeEmail = databaseManager.safeEmail(email)
            
            let user = InstagramUser(safeEmail: safeEmail, fullName: fullName, password: password, birthday: birthday, username: username)
            spinner.show(in: view)
            databaseManager.shared.insertUser(with: user) { [weak self] success in
                guard let strongSelf = self else {return}
                strongSelf.spinner.dismiss()
                if success {
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        guard error == nil else {
                            print("we could not create user so we return")
                            print(error?.localizedDescription)
                            return
                        }
                        print("/////////")
                        print(result?.user)
                        print("/////////")
                      
                        let vc = WelcomeViewController(email: email, fullName: fullName, password: password, Birthday: birthday, username: username)
                        vc.modalPresentationStyle = .fullScreen
                        strongSelf.present(vc, animated: true)
                    }
                    
                    
                }else{
                    print("not success")
                }
            }
            
            
            
            
            
        }else{
            print("please fill out the field")
        }
    }
    
    
    
}

       
         
 


extension ChangeUsernameViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nextVCMethod()
        return true
    }
    
}
