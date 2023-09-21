//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation

public struct SettingListItemModel: Codable {
    var MNU_URL             : String
    var MNU_NM              : String
    var MNU_AVAILABLE_YN    : String
    var MNU_TYPE_CODE       : String
    var MNU_AVAILABLE_MSG   : String
    var MNU_ID              : String
    public init(MNU_URL: String, MNU_NM: String, MNU_AVAILABLE_YN: String, MNU_TYPE_CODE: String, MNU_AVAILABLE_MSG: String, MNU_ID: String) {
        self.MNU_URL = MNU_URL
        self.MNU_NM = MNU_NM
        self.MNU_AVAILABLE_YN = MNU_AVAILABLE_YN
        self.MNU_TYPE_CODE = MNU_TYPE_CODE
        self.MNU_AVAILABLE_MSG = MNU_AVAILABLE_MSG
        self.MNU_ID = MNU_ID
    }
}
