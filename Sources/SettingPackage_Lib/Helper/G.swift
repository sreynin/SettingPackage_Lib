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
    //static let Url = Url_()
    
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
