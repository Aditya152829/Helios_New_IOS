//
//  PostDetailsViewController.swift
//  Helios_New
//
//  Created by user201943 on 8/2/21.
//

import UIKit

class PostDetailsViewController: UIViewController {
    // MARK: - OutLet and Variable
    @IBOutlet weak var lblbodyDetials: UILabel!
    @IBOutlet weak var lblTitleDetials: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var  tblviewDetails:UITableView!
    var titleGet:String?
    var bodyGet:String?
    var postName:String?
    var postCommentVMObj = CommentViewModel()
    var postID:Int?
    // MARK: - view life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        tblviewDetails.showLoader()
        setUpUIData()
        prepareViewModelObserver()
        postCommentVMObj.requestCommentData = []
        fetchCommentPostList()
    }
    // MARK: - User Defined function
    func setUpUIData(){
        lblName.text = postName
        lblTitleDetials.text = titleGet
        lblbodyDetials.text = bodyGet
    }
    // MARK: - Button Action
    @IBAction func bckAction(sender: UIButton!) {

        self.dismiss(animated: true, completion: nil)
    }


}
// MARK: Extension
// MARK: - TableView Defination

extension PostDetailsViewController : UITableViewDelegate,UITableViewDataSource {

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postCommentVMObj
            .requestCommentData?.count ?? 0

    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:PostDetailsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PostDetailsTableViewCell") as! PostDetailsTableViewCell?)!

        if postCommentVMObj.requestCommentData?.count ?? 0>0{
            cell.prepareLayout(objDashboard: postCommentVMObj.requestCommentData?[indexPath.row])
            
        }
     

        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}

extension PostDetailsViewController {
    
    func fetchCommentPostList() {
        postCommentVMObj.fetchCommentListData(getPostId: postID!)
    }
    
    func prepareViewModelObserver() {
        self.postCommentVMObj.commentDidChanges = { (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
       
    }
    
    func reloadTableView() {
        self.tblviewDetails.reloadData()
        tblviewDetails.showLoader()
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(PostViewController.removeLoader), userInfo: nil, repeats: false)

    }
    @objc func removeLoader(){
        tblviewDetails.hideLoader()
    }
    
}
