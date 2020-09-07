//
//  LoginViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/25/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FirebaseAuth



class LoginViewController: UIViewController{
    
    let InstagramLogo:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"instagram-text-logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let emailTextField:UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = "Phone number, username or email"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 20, weight: .light)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width:20 , height: 0))
        textField.backgroundColor = .secondarySystemBackground
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .continue
        textField.addTarget(self, action: #selector(textFieldDidChange),
                            for: .editingChanged)
        
        return textField
    }()
    
    let passwordTextField:UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 20, weight: .light)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width:20 , height: 0))
        textField.backgroundColor = .secondarySystemBackground
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(textFieldDidChange),
                            for: .editingChanged)
        
        return textField
    }()
    
    let forgotPasswordButton:UIButton = {
        let button = UIButton()
        button.setTitle("Forgot password?", for:.normal)
        button.setTitleColor(UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1), for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 14, weight: .medium)
        return button
    }()
    
    let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)
        button.alpha = 0.7
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginButtonTouched), for: .touchUpInside)
        return button
    }()
    
    let orLabel:UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.backgroundColor = .white
        return label
    }()
    
    let loginWithFacebookButton:FBLoginButton = {
        let button = FBLoginButton()
        button.layer.cornerRadius = 20
        button.permissions = ["public_profile", "email"]
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let containerView:UIView = {
        let view1 = UIView()
        view1.layer.borderWidth = 0.25
        view1.layer.borderColor = UIColor.gray.cgColor
        return view1
    }()
    
    let primaryStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let SignUpButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for:.normal)
        button.setTitleColor(UIColor(red:0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1), for: .normal)
        button.titleLabel?.font =  .systemFont(ofSize: 14, weight: .semibold)
        return button
    }()
    
    let noAccountLabel:UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize:14,weight:.medium)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(InstagramLogo)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(orLabel)
        view.addSubview(loginWithFacebookButton)
        view.addSubview(containerView)
        containerView.addSubview(primaryStackView)
        primaryStackView.addArrangedSubview(noAccountLabel)
        primaryStackView.addArrangedSubview(SignUpButton)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginWithFacebookButton.delegate = self
        
        view.backgroundColor = .white // when you create viewController Programatically they won't have bacground color, they will be black so you have to set their bacgroundColor
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let sizeHeight = view.height/6
        // let sizeWidth = view.width/4
        let viewCenterX = view.center.x
        //let viewCenterY = view.center.y
        InstagramLogo.frame = CGRect(x: viewCenterX-40, y: view.height/5, width: 80, height: 80)
        emailTextField.frame = CGRect(x:26, y: InstagramLogo.bottom + 28, width: view.width - 52, height: 50)
        passwordTextField.frame = CGRect(x:26, y: emailTextField.bottom + 14, width: view.width - 52, height: 50)
        forgotPasswordButton.frame = CGRect(x:passwordTextField.right-120, y: passwordTextField.bottom + 16, width: 120, height: 20)
        loginButton.frame = CGRect(x: 26, y: forgotPasswordButton.bottom + 32, width:  view.width - 52, height: 50)
        orLabel.frame = CGRect(x:( view.width - 26 )/2, y: loginButton.bottom + 15, width: 30, height:30)
        loginWithFacebookButton.frame = CGRect(x:26, y: orLabel.bottom + 14, width: view.width - 52, height: 50)
        containerView.frame = CGRect(x: 0, y: sizeHeight*5.5, width: view.width, height:view.height-(sizeHeight*5.5))
        primaryStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        primaryStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -5).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
    
    @objc func loginButtonTouched(){
        guard let email = emailTextField.text,let password = passwordTextField.text,!email.isEmpty,!password.isEmpty else{
            print("please fill out all the forms")
            presentAlert(title: "Email error", message:"please fill out all the fields" )
            return
        }
        
        guard email.contains("@") && email.contains("."),email.count >= 5 else{
            presentAlert(title: "Email error", message: "the email is badly formatted, please provide a valid e-mail")
            return
        }
        
        guard password.count >= 6 else{
            presentAlert(title: "Password error", message: "Your password must contains at least 6 characters")
            return
        }
        let safeEmail = databaseManager.safeEmail(email)
        databaseManager.shared.checkUserExists(with: safeEmail) { exists in
            if exists {
                print("it exixsts")
            }else{
                print("it doesn't exists")
            }
        }
        //  emailTextField.text = ""
        // passwordTextField.text = ""
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            guard error == nil ,let result = authResult else{
                return
            }
            print(result)
            
            strongSelf.presentNextVC(with: email)
           
        }
    }
    
    func presentAlert(title:String,message:String){
        let emailAlertController = UIAlertController(title: title, message:message, preferredStyle: .alert)
        emailAlertController.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            emailAlertController.dismiss(animated: true, completion: nil)
        }))
        present(emailAlertController, animated: true, completion: nil)
        
    }
    
 
}




// MARK: - UITextFieldDelegate

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField{
            passwordTextField.becomeFirstResponder()
            return true
        }else{
            passwordTextField.resignFirstResponder()
            emailTextField.resignFirstResponder()
            return true
        }
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailTextField.becomeFirstResponder()
        }else{
            passwordTextField.becomeFirstResponder()
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text?.replacingOccurrences(of: " ", with: ""), !text.isEmpty else{
            print("it is not")
            textField.text = ""
            loginButton.alpha = 0.7
            return
        }
        loginButton.alpha = 1
    }
}


// MARK: - LoginButtonDelegate

extension LoginViewController:LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        do {
            try? Auth.auth().signOut()
        }
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        guard error == nil, let result = result,  let token = result.token?.tokenString else {
            print("error is \(error?.localizedDescription ?? "error first level")")
            return
        }
        
        let graphRequest = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields":"email,name,picture"], tokenString: token, version: nil, httpMethod: .get)
        
        graphRequest.start { (_, result, Error) in
            guard let result1 = result as? [String:Any] else{
                return
            }
            guard let name = result1["name"] as? String,let email = result1["email"] as? String ,let picture = result1["picture"] as? [String:Any],let data = picture["data"] as? [String:Any], let url = data["url"] as? String else{
                return
            }
            let safeEmail = databaseManager.safeEmail(email)
            databaseManager.shared.checkUserExists(with: safeEmail) { exists in
                if exists {
                    print("it exixsts")
                }else{
                    print("it doesn't exists")
                }
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken:token)
            
            Auth.auth().signIn(with: credential) { [weak self]  _, error in
                
                guard let strongSelf = self else{
                    return
                }
                guard error == nil else {
                    print(error!)
                    return
                }
                
                print("authentification with facebook 2")
                
                //  strongSelf.presentNextVC(with:email)
                
            }
            
            
            
            
            
            // LoginManager().logOut()
        }
    }
    
    
    /*  // Swift
     
     override func viewDidLoad() {
     super.viewDidLoad()
     
     if let token = AccessToken.current,
     !token.isExpired {
     // User is logged in, do work such as go to next view controller.
     }
     }
     
     */
    
    func presentNextVC(with email:String){
        let safeEmail = databaseManager.safeEmail(email)
         // UserDefaults.standard.set(safe, forKey: "safeEmail")
        let vc = EmailViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    func majin(){
        
        if Auth.auth().currentUser != nil {
            print("/////////////////////////////")
            print("user is signed in")
            // User is signed in.
            // ...
        } else {
            print("/////////////////////////////")
            print("user is not signed in")
            // No user is signed in.
            // ...
        }
    }
    
    
}
