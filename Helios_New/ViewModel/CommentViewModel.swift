//
//  CommentViewModel.swift
//  Helios_New
//
//  Created by user201943 on 8/2/21.
//

import UIKit

//MARK: - Protocol Defining here
protocol CommentViewModelProtocol {
    
    var commentDidChanges: ((Bool, Bool) -> Void)? { get set }
    func fetchCommentListData(getPostId:Int)
}
class CommentViewModel: CommentViewModelProtocol {
    
    //MARK: - Internal Properties
    var commentDidChanges: ((Bool, Bool) -> Void)?
    var requestCommentData: [CommentsModel]? {
        didSet {
            self.commentDidChanges!(true, false)
        }
    }
    func fetchCommentListData(getPostId: Int) {
        PostAPIService.instance.fetchCommentPostList { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data) as! NSArray
                    let arrMenu = json
                    var arrDashboard = [CommentsModel]()
                    for obj in arrMenu {
                        let objDashboard = CommentsModel(dictInfo: obj as! [String : Any])
                        arrDashboard.append(objDashboard)
                    }
                    self.requestCommentData = arrDashboard.filter({ $0.postId == getPostId})
                    print(self.requestCommentData?.count ?? 0)
                  
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

