//
//  CommentsModel.swift
//  Helios_New
//
//  Created by user201943 on 8/2/21.
//
import UIKit

class CommentsModel: NSObject {

    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
    
   
        init(dictInfo:[String:Any]) {
        
        postId = dictInfo["postId"] as? Int
        id = dictInfo["id"] as? Int
        name = dictInfo["name"] as? String
        email = dictInfo["email"] as? String
        body = dictInfo["body"] as? String
      
    }
    
}
