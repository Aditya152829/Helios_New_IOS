//
//  AppUrl.swift
//  Demo
//
//  Created by mac on 8/1/21.
//

import Foundation

struct Domain {
    static let dev = "https://jsonplaceholder.typicode.com/"

}
extension Domain {
    static func baseUrl() -> String {
        return Domain.dev
    }
}
struct APIEndpoint {
    static let postGet = "posts"
    static let userGet = "users"
    static let userComments = "comments"

}

