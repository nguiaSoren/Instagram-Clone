//
//  EmailViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/25/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit
import JGProgressHUD
import Firebase

class EmailViewController: UIViewController {
    
   private let addEmailLabel:UILabel = {
        let label = UILabel()
        label.text = "Write Your Email"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "Add your email to Sign Up"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.returnKeyType = .continue
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textContentType = .emailAddress
        textField.clearButtonMode  = .whileEditing
        
        textField.addTarget(self, action: #selector(textFieldDidChange),
                            for: .editingChanged)
        
        return textField
    }()
    
     private let nextButton:UIButton = {
        let button = UIButton()
        button.backgroundColor =  UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        button.alpha = 0.7
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
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
    private let spinner = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(addEmailLabel)
        view.addSubview(infoLabel)
        view.addSubview(emailTextField)
        view.addSubview(nextButton)
        view.addSubview(containerView)
        view.addSubview(primaryStackView)
        view.addSubview(SignInButton)
        view.addSubview(alreadyAccountLabel)
        view.addSubview(containerView)
       containerView.addSubview(primaryStackView)
       primaryStackView.addArrangedSubview(alreadyAccountLabel)
       primaryStackView.addArrangedSubview(SignInButton)
        emailTextField.delegate = self
        view.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        emailTextField.becomeFirstResponder()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         let sizeHeight = view.height/6
         let sizeWidth = view.width/4
    
        addEmailLabel.frame = CGRect(x:sizeWidth, y:sizeHeight, width: 300, height: 30)
        infoLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor, constant: 0).isActive = true
        infoLabel.frame.origin.y = addEmailLabel.bottom+15
   
        emailTextField.frame = CGRect(x:26, y: infoLabel.bottom + 20, width: view.width - 52, height: 40)
              
        nextButton.frame  = CGRect(x: 26, y: emailTextField.bottom + 20, width: view.width - 52, height: 40)
  
        containerView.frame = CGRect(x: 0, y: sizeHeight*5.5, width:  view.width, height: view.height/12)

        primaryStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        primaryStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
    
    
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
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
        if nextButton.alpha == 1 {
            guard let email = emailTextField.text,!email.isEmpty else{
                return
            }
            
            guard email.contains("@") && email.contains("."),email.count >= 5 else{
                presentEmailAlert()
                return
            }
            if Auth.auth().currentUser != nil {
                print("User is signed in.")
                do {
                    try? Auth.auth().signOut()
                }
                
              print("I just log out the user.")
            } else {
              print("No user is signed in.")
         
            }
          
          //  let safeEmail = databaseManager.safeEmail(email)
            spinner.show(in: view)
            databaseManager.shared.checkUserExists(with: email) {[weak self] exists in
                guard let strongSelf = self else{
                    return
                }
                  strongSelf.spinner.dismiss()
                if !exists {      // if !exists == true
                    let vc = FullNameViewController(email: email)
                    vc.modalPresentationStyle = .fullScreen
                    strongSelf.present(vc, animated: false) {
                        print("Is on FullNameViewController")
                    }
                    
                }else{
                    print("sorry this User already exists")
                }
            }
        }else{
            print("please fill out the field")
        }
    }
    
    func presentEmailAlert(){
       let emailAlertController = UIAlertController(title: "email error", message: "the email is badly formatted, please provide a valid e-mail", preferredStyle: .alert)
           emailAlertController.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
               emailAlertController.dismiss(animated: true, completion: nil)
           }))
           present(emailAlertController, animated: true, completion: nil)
           
       }
       
    
    
    
}

extension EmailViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text ,!text.isEmpty else{
            print("textField return false")
            return false
        }
        print("textField return true")
        textField.resignFirstResponder()
        nextVCMethod()
        return true
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text?.replacingOccurrences(of: " ", with: ""), !text.isEmpty else{
            print("it is not")
            textField.text = ""
            nextButton.alpha = 0.7
            return
        }
        print("it is not empty")
        nextButton.alpha = 1
        
        
    }
}

