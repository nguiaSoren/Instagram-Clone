//
//  BirthdayViewController.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/26/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {
    var email:String!
    var fullName:String!
    var password:String!

    
    private let addBirthdayLabel:UILabel = {
        let label = UILabel()
        label.text = "Add Your Birthday"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica Neue", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     private let infoLabel:UILabel = {
        let label = UILabel()
        label.text = "This won't be part of your public profile"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()
     private let infoLabel2:UILabel = {
        let label = UILabel()
        label.text = "Use your own Birthday, even if this account is for business, a pet or something else"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
     private let birthdayTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = ""
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.returnKeyType = .continue
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.backgroundColor = .tertiarySystemGroupedBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.font = UIFont(name:"helvetica neue", size: 14)
        return textField
    }()

    let birthdayCake:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named:"birthday-cake")
        imageView.layer.masksToBounds = true
        return imageView
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
    
     private var birthdayDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = .current
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(birthdayDatePickerChanged), for: .valueChanged)

        return datePicker
    }()
    let dateFormatter = DateFormatter()
    let now = Date()
    let calendar = Calendar.current
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Is on the birthday viewController")
        print("email = \(email ?? "noEmailSaved")")
        print("fullName = \(fullName ?? "fullName nil")")
        print("password = \(password ?? "password nil")")
        view.addSubview(birthdayCake)
        view.addSubview(addBirthdayLabel)
        view.addSubview(infoLabel)
        view.addSubview(birthdayTextField)
        view.addSubview(birthdayDatePicker)
        view.addSubview(nextButton)
        view.addSubview(infoLabel2)
        birthdayTextField.delegate = self
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let selectedDate = dateFormatter.string(from: birthdayDatePicker.date)
        birthdayTextField.text = selectedDate
       
        view.backgroundColor = .white
        
    }
    init(email:String,fullName:String,password:String) {
        super.init(nibName: nil, bundle: nil)
        self.email = email
        self.fullName = fullName
        self.password = password

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let sizeHeight = view.height/6
        let sizeWidth = view.width/4
        birthdayCake.frame = CGRect(x: sizeWidth*1.5, y: sizeHeight*0.5, width: 100, height: 100)
        addBirthdayLabel.frame = CGRect(x:sizeWidth, y:sizeHeight*1.5, width: 300, height: 30)
        infoLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor, constant: 0).isActive = true
        infoLabel.frame.origin.y = addBirthdayLabel.bottom+20
        birthdayTextField.frame = CGRect(x:26, y: infoLabel.bottom + 30, width: view.width - 52, height: 50)
        //nextButton.frame  = CGRect(x: 13, y: birthdayDatePicker.top + 20, width: view.width - 26, height: 40)
        birthdayDatePicker.frame = CGRect(x: 0, y: sizeHeight*4, width: view.width, height: view.height/4)
        nextButton.frame = CGRect(x: 26, y:sizeHeight*3.75 , width: view.width - 52, height: 50)
        infoLabel2.frame = CGRect(x: 13, y:sizeHeight*3.35, width: view.width - 26, height: 40)
      
               

        
    /*
        BirthdayTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,constant: 20).isActive = true
        BirthdayTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        BirthdayTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        BirthdayTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        infoLabel2.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: 10).isActive = true
        infoLabel2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        infoLabel2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        
        birthdayDatePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        birthdayDatePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        birthdayDatePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        birthdayDatePicker.heightAnchor.constraint(equalToConstant: view.height/3).isActive = true
        */
      //  containerView.frame = CGRect(x: 0, y: sizeHeight/2, width: view.width, height: sizeHeight)
       // containerView.frame =  CGRect(x:13, y: emailTextField.bottom + 14, width: view.width - 26, height: 50)
       // containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        //containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
       // containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
       // containerView.heightAnchor.constraint(equalToConstant: view.height/12).isActive = true
       // primaryStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
      //  primaryStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -5).isActive = true
    }
    
    
    @objc func birthdayDatePickerChanged(_ sender: UIDatePicker){
         let selectedDate = dateFormatter.string(from: birthdayDatePicker.date)
        nextButton.alpha = 1
        birthdayTextField.text = selectedDate
        
        let birthday = birthdayDatePicker.date
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
               print("age is \(age)")
    }
  
    
    @objc func nextButtonTouched(){
        nextVCMethod()
    }
    
    @objc func signInButtonTouched(){
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    func  nextVCMethod(){
        if nextButton.alpha == 1 {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            let birthday = formatter.string(from: birthdayDatePicker.date)
            
            let vc = ChangeUsernameViewController(email: email, fullName: fullName, password: password, Birthday: birthday)
         
          //  let vc = WelcomeViewController(email: email, fullName: fullName, password: password, Birthday:birthday)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true) {
                
            }
            
        }else{
            print("please fill out the field")
        }
    }
    
    
    
}

extension BirthdayViewController:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == birthdayTextField {
            return false; //do not show keyboard nor cursor
        }
        return true
    }
    
    
    
}






