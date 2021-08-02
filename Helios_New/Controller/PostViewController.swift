//
//  PostViewController.swift
//  Helios_New
//
//  Created by user201943 on 8/1/21.
//
import UIKit

class PostViewController: UIViewController {
    // MARK: - OutLet and Variable
    @IBOutlet weak var  tblview:UITableView!
    @IBOutlet weak var  viewSearch:UIView!
    var postVMObj = PostViewModel()
    var postUserVMObj = PostUserViewModel()
    
    // MARK: - view life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSearch.layer.cornerRadius =  16
        viewSearch.clipsToBounds = true
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        prepareViewModelObserver()
        postVMObj.requestPostData = []
        postUserVMObj.requestUserData = []
        fetchPostList()
        DispatchQueue.background(background: {
            self.fetchUserList()
            // do something in background
        }, completion:{
            // when background job finished, do something in main thread
        })
    }
}
// MARK: Extension
extension PostViewController : UITableViewDelegate,UITableViewDataSource {
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postVMObj.requestPostData?.count ?? 0
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PostTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell?)!
        
        
        if postVMObj.requestPostData?.count ?? 0>0{
            cell.prepareLayout(objDashboard: postVMObj.requestPostData?[indexPath.row])
            
        }
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if postUserVMObj.requestUserData?.count ?? 0>0{
            var requestUserDataFilter: [UserModel]
            requestUserDataFilter =   (postUserVMObj.requestUserData?.filter({ $0.id == postVMObj.requestPostData?[indexPath.row].userId}))!
            print(requestUserDataFilter[0].name)
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "PostDetailsViewController") as! PostDetailsViewController
            obj.modalPresentationStyle = .fullScreen
            obj.titleGet = postVMObj.requestPostData?[indexPath.row].title
            obj.bodyGet = postVMObj.requestPostData?[indexPath.row].body
            obj.postID = postVMObj.requestPostData?[indexPath.row].id //Post Id
            obj.postName = requestUserDataFilter[0].name
            self.present(obj, animated: true, completion: nil)
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}

extension PostViewController {
    
    func fetchPostList() {
        postVMObj.fetchpostListData()
    }
    
    func prepareViewModelObserver() {
        self.postVMObj.postDidChanges = { (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
        self.postUserVMObj.postuserDidChanges = { (finished, error) in
            if !error {
                print("Any Action there")            }
        }
    }
    
    func reloadTableView() {
        self.tblview.reloadData()
        tblview.showLoader()
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(PostViewController.removeLoader), userInfo: nil, repeats: false)
        
        
    }
    @objc func removeLoader(){
        tblview.hideLoader()
    }
    // API Call for User list
    func fetchUserList(){
        postUserVMObj.fetchpostUserListData()
        
        
    }
}
extension DispatchQueue {
    
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }
}
