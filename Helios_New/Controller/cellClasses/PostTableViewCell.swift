//
//  PostTableViewCell.swift
//  Helios_New
//
//  Created by user201943 on 8/1/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var lblbody: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewBg: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
      

    }
    func prepareLayout(objDashboard:PostModel?) {
        lblTitle.text = objDashboard?.title?.capitalized
        lblbody.text = objDashboard?.body
        
    }
    func setUpUI(){
        viewBg.layer.cornerRadius = 20.0
        viewBg.layer.shadowColor = UIColor.gray.cgColor
        viewBg.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        viewBg.layer.shadowRadius = 12.0
        viewBg.layer.shadowOpacity = 0.7
        viewBg.backgroundColor = UIColor.white
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
