//
//  SettingCustomCell.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import UIKit

public class SettingLibCustomCell: UITableViewCell {

    @IBOutlet weak var settingNameLb: DynamicLabelSizeClass!
    @IBOutlet weak var moreSignImg: UIImageView!
    
//    func renderCell(item: MGModel.SET_MNU_LIST) {
//        settingNameLb.text = item.MNU_NM
//    }
    
}

public class VersionSettingLibCustomCell: UITableViewCell {
    
    @IBOutlet weak var settingNameLb: DynamicLabelSizeClass!
    @IBOutlet weak var versionLb: DynamicLabelSizeClass!
    
    func renderInfo(titleSt: String) {
        settingNameLb.text = titleSt
        versionLb.text = "V" + UIDevice.getAppVersion()
    }
    
}
