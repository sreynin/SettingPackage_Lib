//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation

public struct UserDefaultDB {
    
    public  struct Account {
        @UserDefault("MEMBER_CD", defaultValue: "")
        static var MEMBER_CD: String
        
        @UserDefault("LOCK_YN", defaultValue: "N")
        static var LOCK_YN: String
        
        @UserDefault("domainTouchID", defaultValue: nil)
        static var domainTouchID: Data?
        
        @UserDefault("IS_FRIST_RUN_APP", defaultValue: true)
        static var IS_FRIST_RUN_APP: Bool
        
        @UserDefault("IsFirstOpenNubigo", defaultValue: true)
        static var IsFirstOpenNubigo: Bool

    }
    
}
