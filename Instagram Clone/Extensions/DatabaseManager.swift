//
//  DatabaseManager.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/25/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import Foundation
import FirebaseDatabase



final class databaseManager {
    
    private var database = Database.database().reference()
    
    static let shared = databaseManager()
    
    static func safeEmail(_ email:String) -> String{
        var safeEmail = email.replacingOccurrences(of: "@", with:"-")
        safeEmail = safeEmail.replacingOccurrences(of: ".", with: "-")
    return safeEmail
    }
    
    func checkUserExists(with email:String,completion: @escaping (Bool) -> Void){
        let safeEmail = databaseManager.safeEmail(email)
        database.child("\(safeEmail)").observeSingleEvent(of: .value) { (DataSnapshot) in
            guard DataSnapshot.value as? [String:Any] != nil else{
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func insertUser(with user:InstagramUser,completion: @escaping (Bool) -> Void){
        guard let safeEmail = user.safeEmail ,let username = user.username,let fullName = user.fullName,let birthday = user.birthday else{
            print("we return in in insert user databseManager")
            return
        }
        database.child(safeEmail).setValue([
            "username":username,
            "fullName":fullName,
            "birthday":birthday,
        ]) {(error:Error?, ref:DatabaseReference) in
            guard error == nil else{
                let error = error
                print("Data could not be saved: \(error?.localizedDescription ?? "could not insert User").")
                completion(false)
                return
            }
            print("Data saved successfully!")
       
            
        }
             completion(true)
    }
   
    
}
    
    




