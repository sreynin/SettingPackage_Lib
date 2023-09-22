//
//  File.swift
//  
//
//  Created by SREININ on 22/9/23.
//

import Foundation
import UIKit
import CoreTelephony

public class DeviceInfo {
    
    enum ScreenSizeType {
        case Mini
        case Meduim
        case Plus
        case XSerial
        case XSerialPlus
    }
    
    //single config
    private init() {}
    static let info = DeviceInfo()
    
    var model: String { return UIDevice.current.model }
    var systemName: String { return UIDevice.current.systemName }
    var systemVersion: String { return UIDevice.current.systemVersion }
    
  public  func deviceId() -> Int {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 960: return 0 //iPhone 4/4s
            case 1136:  return 1 //iPhone 5 or 5S or 5C
            case 1334: return 2 //iPhone 6/6S/7/8
            case 1920, 2208: return 3 //iPhone 6+/6S+/7+/8+
            case 2436: return 4 //iPhone X, XS
            case 2688: return 5 //iPhone XS Max, 11Pro Max
            case 1792: return 6 //iPhone XR
            default: return 999 //otherwise
            }
        }
        return 0
    }
    
    public func deviceSize() -> CGSize { return UIScreen.main.bounds.size }
    
      func groupDeviceScreenType() -> ScreenSizeType {
        let _deviceId = deviceId()
        if _deviceId == 0 || _deviceId == 1 { return .Mini}
        else if _deviceId == 2 { return .Meduim }
        else if _deviceId == 3 { return .Plus }
        else if _deviceId == 4 { return .XSerial }
        else if _deviceId == 5 || _deviceId == 6 { return .XSerialPlus }
        else { return .Meduim }
    }
    
    public func getAppVersion() -> String {
        let mainBundleDictionary = Bundle.main.infoDictionary! as NSDictionary
        return mainBundleDictionary.object(forKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    public func getUUID() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    public func getCarrierName() -> String {
        let networkInfo = CTTelephonyNetworkInfo()
        return networkInfo.subscriberCellularProvider?.carrierName ?? ""
    }
    
}

public struct ScreenSize {
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

public struct DeviceType {
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5_5s_SE          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6_6s_7_8          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_7P_8P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X_11PRO          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812
    static let IS_IPHONE_XSMAX_PROMAX      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 2688
    static let IS_IPHONE_XR_11         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 1792
}

