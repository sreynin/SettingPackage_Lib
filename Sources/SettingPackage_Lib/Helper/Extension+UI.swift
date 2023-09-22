//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation
import UIKit

enum Font {
    case NanumSquareLight
    case NanumSquareRegular
    case NanumSquareBold
    case NanumSquareExBold
}
extension UIFont {
    
    static func font(_ style: Font, _ size: CGFloat) -> UIFont {
        
        var name = ""
        switch style {
        case .NanumSquareLight:
            name = "NanumSquareOTF_acL"
        case .NanumSquareRegular:
            name = "NanumSquareOTF_acR"
        case .NanumSquareBold:
            name = "NanumSquareOTF_acB"
        case .NanumSquareExBold:
            name = "NanumSquareOTF_acEB"
        }
        
        return UIFont(name: name, size: size)!
    }
}
extension UIViewController {
    func isSettingGroup() -> Bool {
        
        if self is SettingVC { return true }
        if self is PIN4ManagerVC { return true }
        //if self is PIN6ManagerVC { return true }
        //if self is PushAlarmTableViewController { return true }
        //if self is PushScheduleTableViewController { return true }
        //if self is UsedViewController { return true }
        
        return false
    }
    func setNavigationBarWhite() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.barStyle = .default

        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance.shadowColor = .clear
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = .white
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setupMenuView(withTarget target : UIViewController ,actionData: [String:String], leftAction: Selector?, rightAction: Selector?, manualTitle: String? = nil) {

        var menuTitle = actionData["menu_title"] ?? ""
        if let mTitle = manualTitle {
            menuTitle = mTitle
        }
        menuTitle = menuTitle.replacingOccurrences(of: "\n", with: " ")
        
        let frame = navigationController?.navigationBar.frame ?? CGRect.zero

        if target.isSettingGroup() || G.App.isChangwon() {
            let label = UILabel(frame: frame)
            label.frame = frame
            label.font(.NanumSquareBold, 16)
            label.textColor = UIColor(r: 34, g: 34, b: 34)
            label.text = menuTitle
            label.textAlignment = .left
            self.navigationItem.titleView = label
        }
        else {
            self.navigationItem.title = menuTitle
        }
        
        let menuType = actionData["menu_type"] ?? ""
        switch menuType {
        case "2":
            
            let leftBtn = UIButton(type: .custom)
            leftBtn.frame = CGRect(x: 0, y: 0, width: 35, height: frame.height)
            leftBtn.contentHorizontalAlignment = .left
            leftBtn.setImage(UIImage(named: "btn_back"), for: .normal)
            leftBtn.setImage(UIImage(named: "btn_back"), for: .highlighted)
                  
            if leftAction != nil {
                leftBtn.addTarget(target, action: leftAction!, for: .touchUpInside)
            }
            
            let leftBarButton = UIBarButtonItem(customView: leftBtn)
            self.navigationItem.leftBarButtonItem = leftBarButton
            
        default:
            break
        }
    }
  public func alertMessage(title: String? = "안내", message: String?, action: ((UIAlertAction) -> Void)?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default, handler: action)
            alert.addAction(confirmAction)
            
            /* replace info
             if let currentAlert = self.presentedViewController as? UIAlertController {
             currentAlert.title = title
             currentAlert.message = message
             return
             } */
            
            if self.presentedViewController != nil {
                self.presentedViewController?.dismiss(animated: true, completion: {
                    self.present(alert, animated: true)
                })
            } else {
                self.present(alert, animated: true)
            }
        }
    }
}
extension UIColor {
    
    //Convert to RGB without Alpha
    public convenience init?(r:CGFloat,g:CGFloat,b:CGFloat){
        self.init(red:r/255.0,green: g/255.0,blue: b/255.0,alpha: 1.0)
        return
    }
    
    //Convert to RGB with alpha
    public convenience init?(r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat) {
        self.init(red:r/255.0,green: g/255.0,blue: b/255.0,alpha: alpha)
        return
    }
    
}

extension UILabel {
    func font(_ style: Font) {
        font(style, self.font.pointSize)
    }
    
    func font(_ style: Font, _ size: CGFloat) {
        self.font = UIFont.font(style, size)
    }
}
