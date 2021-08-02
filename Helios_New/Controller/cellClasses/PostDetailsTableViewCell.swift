//
//  PostDetailsTableViewCell.swift
//  Helios_New
//
//  Created by user201943 on 8/2/21.
//

import UIKit

class PostDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblbody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func prepareLayout(objDashboard:CommentsModel?) {
        lblbody.text = objDashboard?.body
        
        
    }
    func setUpUI(){
        viewBg.layer.borderWidth = 1
        viewBg.layer.borderColor = UIColor.black.cgColor
        viewBg.layer.cornerRadius =  8
        viewBg.clipsToBounds = true
        viewBg.backgroundColor = .white
        viewBg.layer.cornerRadius = 10.0
        viewBg.layer.shadowColor = UIColor.gray.cgColor
        lblbody.textColor = .darkGray
        
        
    }
    
}
