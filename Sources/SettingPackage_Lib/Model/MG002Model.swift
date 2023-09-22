//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation


public struct SetMnuList: Decodable {
        //let c_mnu_child             : []
        var c_available_service     : Bool = false
        var c_mnu_url               : String = ""
        var c_available_act         : String = ""
        var c_mnu_ic_url            : String = ""
        var c_mnu_id                : String = ""
        var c_mnu_type_cd           : String = ""
        var c_mnu_nm                : String = ""
    
    public init(c_available_service: Bool, c_mnu_url: String, c_available_act: String, c_mnu_ic_url: String, c_mnu_id: String, c_mnu_type_cd: String, c_mnu_nm: String) {
        self.c_available_service = c_available_service
        self.c_mnu_url = c_mnu_url
        self.c_available_act = c_available_act
        self.c_mnu_ic_url = c_mnu_ic_url
        self.c_mnu_id = c_mnu_id
        self.c_mnu_type_cd = c_mnu_type_cd
        self.c_mnu_nm = c_mnu_nm
    }
}


