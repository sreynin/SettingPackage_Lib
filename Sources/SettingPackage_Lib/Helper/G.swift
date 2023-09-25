//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation

enum AppType: String {
    case Changwon = "com.bizplay.zeropay.changwon"
    case Chuncheon = "com.bizplay.zeropay.chuncheon"
    case Gyeongnam = "com.bizplay.zeropay.gyeongnam"
    case Jeonnam = "com.bizplay.zeropay.jeonnam"
    case Kangwon = "com.bizplay.zeropay.kangwon"
    case None = ""
}

class G {
    
    static let isDevelopMode = false
        
    static let App = App_()
    static let Url = Url_()
    
    //static var merchantMapVC: MerchantMapVC?
    
}
class App_ {
    
    var type = AppType.None
    
    init() {
        
        if appId.contains(AppType.Changwon.rawValue) { type = .Changwon }
        else if appId.contains(AppType.Chuncheon.rawValue) { type = .Chuncheon }
        else if appId.contains(AppType.Gyeongnam.rawValue) { type = .Gyeongnam }
        else if appId.contains(AppType.Jeonnam.rawValue) { type = .Jeonnam }
        else if appId.contains(AppType.Kangwon.rawValue) { type = .Kangwon }
        
    }
    
    var appId: String {
        return Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    }
    
    var giftName: String {
        switch type {
        case .Changwon: return "창원 누비전"
        case .Chuncheon: return "춘천사랑상품권"
        case .Gyeongnam: return "경남지역상품권"
        case .Jeonnam: return "전남사랑상품권"
        case .Kangwon: return "강원상품권"
        case .None: return ""
        }
    }
    
    func NMClientId() -> String {
        switch type {
        case .Changwon: return "2fel46f9zj"
        case .Chuncheon: return "ayevcvddis"
        case .Gyeongnam: return "bak91nla1o"
        case .Jeonnam: return "glpc82lan2"
        case .Kangwon: return "z61og2f6be"
        case .None: return ""
        }
    }
    
    // Key
    //case .Changwon: return "yqO6ZG6oFWrXnGcj4b436x9SpwVITfdehv2In5JD"
    //case .Chuncheon: return "lHytS7HoZx4tYrWgC3kPyCaFEpAWxvWsBqTTZten"
    //case .Gyeongnam: return "gL6Ca9ui1Gt2Nt2Yb3x5DGLlh6YNR60Z3UN5N9LS"
    //case .Jeonnam: return "DmUQ0Bll12awI9yOkIW7xWOCwfBCTgrTl3hNUfXc"
    //case .Kangwon: return "9OxXSFH4gucTBgaZ3NK2k6UnjnIvyGjM3sfpfvdn"
    
    func isChangwon() -> Bool {
        return type == .Changwon
    }
}

class Url_ {
    
    var server = ServerType.Live
    
    var baseURL : String {
        switch server {
        case .Develop:
            let scstring = SCString(with: NSArray.self)
            let cipher = Data([0xE8, 0x92, 0xB2, 0x2F, 0xC4, 0xD1, 0x6B, 0x05, 0x36, 0x21, 0x3F, 0xD5, 0x93, 0x28, 0x3B, 0x10, 0xEC, 0x3A, 0xAA, 0x7B, 0x99, 0xE9, 0x6C, 0x78, 0xDD, 0xEC, 0xBD, 0xBC, 0xB1, 0x1E, 0xD0, 0xA3, 0xF2])
            return scstring.get(cipher)
        case .Live:
            let scstring = SCString(with: NSArray.self)
            let cipher = Data([0xE8, 0x92, 0xB2, 0x2F, 0x8D, 0xC4, 0x6B, 0x4E, 0x29, 0x32, 0x63, 0xD8, 0xD4, 0x33, 0x66, 0x1A, 0xF9, 0x24, 0xA4, 0x2C, 0xD5, 0xE3, 0x79, 0x26, 0xDA, 0xFF])
            return scstring.get(cipher)
        }
    }
    
    let myGiftList = "/AFLTSRCH0000.act" // 보유상품권목록
    let merchantList = "/AFLTSRCH0010.act" // 가맹점목록
    let merchantDetail = "/AFLTSRCH0030.act" // 가맹점상세
    
    let SRCH_000001 = "/SRCH_000001.jct" //상품권 사용처별 가맹점 검색(지도용)
    let SRCH_000002 = "/SRCH_000002.jct" //가맹점별 결제가능 상품권 정보 조회
    

    func isLive() -> Bool {
        return server == .Live
    }

    func isDevelop() -> Bool {
        return server == .Develop
    }
}
