//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation

public struct MG002Model {
    
    public   struct Request: Encodable {}
    
    public   struct Response: Decodable {
        let _tran_res_data: [TranResData]
    }
    
    public struct TranResData: Decodable {
        public  let c_common_head       : CCommonHead
        public var c_menu_info         : CMenuInfo
        public var small_biz_svc       : SmallBizSvc? = nil
        public var seoul_support_svc   : SeoulSupportSvc? = nil
        public var biz_point_svc       : BizPointSvc? = nil
        public init(c_common_head: CCommonHead, c_menu_info: CMenuInfo, small_biz_svc: SmallBizSvc? = nil, seoul_support_svc: SeoulSupportSvc? = nil, biz_point_svc: BizPointSvc? = nil) {
            self.c_common_head = c_common_head
            self.c_menu_info = c_menu_info
            self.small_biz_svc = small_biz_svc
            self.seoul_support_svc = seoul_support_svc
            self.biz_point_svc = biz_point_svc
        }
    }
    
    public struct SmallBizSvc: Decodable {
        var c_available_service     : Bool = false
        var is_visible              : Bool = false
        var c_available_act         : String = ""
        var svc_type_cd             : String = ""
        var svc_url                 : String = ""
    }
    
    public  struct SeoulSupportSvc: Decodable {
        var c_available_service     : Bool = false
        var is_visible              : Bool = false
        var c_available_act         : String = ""
        var svc_type_cd             : String = ""
        var svc_url                 : String = ""
    }
    
    public  struct BizPointSvc: Decodable {
        var c_available_service     : Bool = false
        var is_visible              : Bool = false
        var c_available_act         : String = ""
        var svc_type_cd             : String = ""
        var svc_url                 : String = ""
    }
    
    public  struct CMenuInfo: Decodable {
        public  var SET_MNU_LIST       : [SetMnuList] = [] //설정
        public  var PAY_MNU_LIST       : [PayMnuList] = []
        public  var MAIN_TAB_MNU_LIST  : [MainTabMnuList] = []
        public var SVC_INFO_MNU_LIST  : [SvnInfoMnuList] = [] //이용 안내
        public var FRANCHISEE_MAIN_MNU_LIST    : [FranchiseeMainMnuList] = [] //main
        public var MY_MNU_LIST        : [MyMnuList] = [] //마이 페이지
        
    }
    
    public  struct MyMnuList: Decodable {
        //let c_mnu_child             : []
        var c_available_service     : Bool = false
        var c_mnu_url               : String = ""
        var c_available_act         : String = ""
        var c_mnu_ic_url            : String = ""
        var c_mnu_id                : String = ""
        var c_mnu_type_cd           : String = ""
        var c_mnu_nm                : String = ""
    }
    
    public struct FranchiseeMainMnuList: Decodable {
        //let c_mnu_child             : []
        var c_available_service     : Bool = false
        var c_mnu_url               : String = ""
        var c_available_act         : String = ""
        var c_mnu_ic_url            : String = ""
        var c_mnu_id                : String = ""
        var c_mnu_type_cd           : String = ""
        var c_mnu_nm                : String = ""
    }
    
    public struct SvnInfoMnuList: Decodable {
        //let c_mnu_child             : []
        var c_available_service     : Bool = false
        var c_mnu_url               : String = ""
        var c_available_act         : String = ""
        var c_mnu_ic_url            : String = ""
        var c_mnu_id                : String = ""
        var c_mnu_type_cd           : String = ""
        var c_mnu_nm                : String = ""
    }
    
    public struct SeoulSupportTerms: Decodable {
        var is_required     : Bool = false
        var title           : String = ""
        var url             : String = ""
    }
    
    public struct SetMnuList: Decodable {
        //let c_mnu_child             : []
        var c_available_service     : Bool = false
        var c_mnu_url               : String = ""
        var c_available_act         : String = ""
        var c_mnu_ic_url            : String = ""
        var c_mnu_id                : String = ""
        var c_mnu_type_cd           : String = ""
        var c_mnu_nm                : String = ""
    }
    
    public struct PayMnuList: Decodable {
        //let c_mnu_child             : []
        var c_available_service     : Bool = false
        var c_mnu_url               : String = ""
        var c_available_act         : String = ""
        var c_mnu_ic_url            : String = ""
        var c_mnu_id                : String = ""
        var c_mnu_type_cd           : String = ""
        var c_mnu_nm                : String = ""
    }
    
    public  struct MainTabMnuList: Decodable {
        //let c_mnu_child             : []
        var c_available_service     : Bool = false
        var c_mnu_url               : String = ""
        var c_available_act         : String = ""
        var c_mnu_ic_url            : String = ""
        var c_mnu_id                : String = ""
        var c_mnu_type_cd           : String = ""
        var c_mnu_nm                : String = ""
    }
    
}
public struct CCommonHead: Decodable {
    var c_available_service :Bool   = false
    var c_update_act        :String = ""
    var c_available_act     :String = ""
    var c_appstore_url      :String = ""
    var c_program_ver       :String = ""
    var c_minimum_ver       :String = ""
    var c_master_id         :String = ""
    var c_update_close      :Bool   = false
    var c_update_date       :String = ""
    var c_register_yn       :Bool?  = false
}
