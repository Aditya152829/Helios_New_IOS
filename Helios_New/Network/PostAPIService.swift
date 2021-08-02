
//
//  SongSearchAPiService.swift
//  Demo
//
//  Created by mac on 8/1/21.
//

import Foundation

class PostAPIService: NSObject, Requestable {
    
    static let instance = PostAPIService()



func fetchPostList(callback: @escaping Handler) {
    
    request(method: .get, url: Domain.baseUrl() + APIEndpoint.postGet) { (result) in
        
       callback(result)
    }
    
}
    
    func fetchUserPostList(callback: @escaping Handler) {
        
        request(method: .get, url: Domain.baseUrl() + APIEndpoint.userGet) { (result) in
            
           callback(result)
        }
        
    }
    func fetchCommentPostList(callback: @escaping Handler) {
        
        request(method: .get, url: Domain.baseUrl() + APIEndpoint.userComments) { (result) in
            
           callback(result)
        }
        
    }
}
