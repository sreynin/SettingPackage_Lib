//
//  PIN4ManagerCustomCell.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import UIKit

public class PIN4ManagerCustomCell1: UITableViewCell {

    @IBOutlet weak var titleLb: DynamicLabelSizeClass!
    @IBOutlet weak var toggleBtn: UIButton!
    
    public func renderCell(titleSt: String) {
        titleLb.text = titleSt
        toggleBtn.isSelected = UserDefaultDB.Account.LOCK_YN == "Y"
    }
    
}

public class PIN4ManagerCustomCell2: UITableViewCell {

    @IBOutlet weak var titleLb: DynamicLabelSizeClass!
    @IBOutlet weak var forwardImg: UIImageView!
    
    public func renderCell(titleSt: String) {
        titleLb.text = titleSt
        if UserDefaultDB.Account.LOCK_YN == "Y" {
            titleLb.textColor = UIColor(r: 62, g: 68, b: 73, alpha: 1)
            self.isUserInteractionEnabled = true
            self.forwardImg.alpha = 1.0
        } else {
            titleLb.textColor = UIColor(r: 164, g: 164, b: 164, alpha: 1)
            self.isUserInteractionEnabled = false
            self.forwardImg.alpha = 0.5
        }
    }
    
}
