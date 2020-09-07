//
//  FullNameViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/26/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class FullNameViewController: UIViewController {
    var email:String!


    
    private let addNameLabel:UILabel = {
        let label = UILabel()
        label.text = "Add Your Name"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "Add your name so friends can find you"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     private let fullNameTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Full name"
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.returnKeyType = .continue
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textFieldDidChange),
                            for: .editingChanged)
        textField.clearButtonMode  = .whileEditing
        
        return textField
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("email = \(email ?? "noEmailSaved")")

        view.addSubview(addNameLabel)
        view.addSubview(infoLabel)
        view.addSubview(fullNameTextField)
        view.addSubview(nextButton)
        view.addSubview(containerView)
        view.addSubview(primaryStackView)
        view.addSubview(SignInButton)
        view.addSubview(alreadyAccountLabel)
        view.addSubview(containerView)
        containerView.addSubview(primaryStackView)
        primaryStackView.addArrangedSubview(alreadyAccountLabel)
        primaryStackView.addArrangedSubview(SignInButton)
        fullNameTextField.delegate = self
        view.backgroundColor = .white

    }
    init(email:String) {
        super.init(nibName: nil, bundle: nil)
        self.email = email

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fullNameTextField.becomeFirstResponder()
    }
    
 
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let sizeHeight = view.height/6
        let sizeWidth = view.width/4
        
        
        addNameLabel.frame = CGRect(x:sizeWidth, y:sizeHeight, width: 300, height: 30)
        infoLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor, constant: 0).isActive = true
        infoLabel.frame.origin.y = addNameLabel.bottom+15
        
        fullNameTextField.frame = CGRect(x:26, y: infoLabel.bottom + 20, width: view.width - 52, height: 40)
        
        nextButton.frame  = CGRect(x: 26, y: fullNameTextField.bottom + 20, width: view.width - 52, height: 40)
        
        containerView.frame = CGRect(x: 0, y: sizeHeight*5.5, width: view.width, height:view.height-(sizeHeight*5.5))
        
        
        primaryStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        primaryStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        fullNameTextField.resignFirstResponder()
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
            guard let fullName = fullNameTextField.text,!fullName.isEmpty else{
                return
            }
            
            let vc = PasswordViewController(email:email,fullName: fullName)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true) {
               
            }
            
        }else{
            print("please fill out the field")
        }
    }
    
    
    
}

extension FullNameViewController:UITextFieldDelegate {
    
    
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
        nextButton.alpha = 1
        
        
    }
}



