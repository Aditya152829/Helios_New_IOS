//
//  UserModel.swift
//  Helios_New
//
//  Created by user201943 on 8/2/21.
//

import Foundation

// MARK: - UserModelElement
class UserModel: NSObject {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    //let company: Company

    init(dictInfo:[String:Any]) {
        id = dictInfo["id"] as? Int ?? 0
        name = dictInfo["name"] as? String ?? ""
        username = dictInfo["username"] as? String ?? ""
        email = dictInfo["email"] as? String ?? ""
        phone = dictInfo["phone"] as? String ?? ""
        website = dictInfo["website"] as? String ?? ""
        address = Address(dictInfoAddress: dictInfo["address"] as! [String:Any])

    }
}

// MARK: - Address
class Address: NSObject {
    let street, suite, city, zipcode: String
//let geo: Geo

    init(dictInfoAddress:[String:Any]) {
        street = dictInfoAddress["street"] as? String ?? ""
        suite = dictInfoAddress["suite"] as? String ?? ""
        city = dictInfoAddress["city"] as? String ?? ""
        zipcode = dictInfoAddress["zipcode"] as? String ?? ""

        
    }

}

// MARK: - Geo
/*class Geo: Codable {
    let lat, lng: String

    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
}

// MARK: - Company
class Company: Codable {
    let name, catchPhrase, bs: String

    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}*/

