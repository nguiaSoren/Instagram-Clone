//
//  StorageManager.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/26/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import Foundation
import FirebaseStorage
import Firebase


final class storageManager {
    private var storage = Storage.storage().reference()
       
    static let shared = storageManager()
    
    public func uploadProfileImage(with profileImage:UIImage,safeEmail:String, completion: @escaping (Bool) -> Void){
        guard  let imageData = profileImage.pngData() else{
            return
        }
        storage.child("images/profileImages/\(safeEmail)_profile_image").putData(imageData, metadata: nil) { (StorageMetadata, error) in
            guard StorageMetadata != nil else{
                print("oops an error occured while data uploading")
                completion(false)
                return
            }
                 print("we sent the profileImage")
                   completion(true)
       
            }
            
        }
        
    
    
    enum downloadError: Error {
        case noMetadataFound
        case RetrievingUrlError

    }
    

       public func downloadURL(for path: String, completion: @escaping (Result<URL, downloadError>) -> Void) {
           let reference = storage.child(path)

           reference.downloadURL(completion: { url, error in
               guard let url = url, error == nil else {
                completion(.failure(.RetrievingUrlError))
                   return
               }
                    print("we retrieve the url")
               completion(.success(url))
            
           })
       }
    
}
