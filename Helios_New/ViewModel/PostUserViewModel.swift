//
//  pios.swift
//  Helios_New
//
//  Created by user201943 on 8/1/21.
//


import Foundation
import UIKit

//MARK: - Protocol Defining here
protocol PostUserViewModelProtocol {
    
    var postuserDidChanges: ((Bool, Bool) -> Void)? { get set }
    func fetchpostUserListData()
}
class PostUserViewModel: PostUserViewModelProtocol {
    
    //MARK: - Internal Properties
    var postuserDidChanges: ((Bool, Bool) -> Void)?
    var requestUserData: [UserModel]? {
        didSet {
            self.postuserDidChanges!(true, false)
        }
    }
    func fetchpostUserListData() {
        PostAPIService.instance.fetchUserPostList { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! NSArray
                    let arrMenu = json
                    var arrDashboard = [UserModel]()
                    for obj in arrMenu {
                        let objDashboard = UserModel(dictInfo: obj as! [String : Any])
                        arrDashboard.append(objDashboard)
                    }
                    self.requestUserData = arrDashboard
                  
                } catch {
                    print("JSON Serialization error")
                }
                
                break
            case .failure(let error):
                
                print(error.description)
            }
        }
    }
    
}
