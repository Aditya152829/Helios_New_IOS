//
//  PostModel.swift
//  Helios_New
//
//  Created by user201943 on 8/1/21.
//

import Foundation
import UIKit

class PostModel: NSObject {
    
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
    
   
        init(dictInfo:[String:Any]) {
        
        userId = dictInfo["userId"] as? Int
        id = dictInfo["id"] as? Int
        title = dictInfo["title"] as? String
        body = dictInfo["body"] as? String
      
    }
    
   
    
}
