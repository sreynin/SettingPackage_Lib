//
//  SettingVC.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import UIKit

public class SettingVC: UIViewController, Instantiable {
    public static var storyboardName           : StringConvertible { StoryboardName.SettingSB }

    //MARK: --- connection outlet ---------------------------
    @IBOutlet weak var settingTableView : UITableView!
    
    //--- private
    var dataSoure  = ShareConstant.shared.mg002Data.c_menu_info.SET_MNU_LIST
    
    var itemData    : MG002Model.MainTabMnuList?
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBarWhite()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        settingTableView.reloadData()
    }
    
    //MARK: --- custom function ----------------------------
    private func setupNavigationBar() {
        let menuDic = ["menu_title" : "설정", "menu_type" : "2"]
        self.setupMenuView(withTarget: self, actionData: menuDic, leftAction: #selector(backDidClicked), rightAction: nil)
    }
    
    @objc func backDidClicked() {
        //self.tabBarController?.selectTab(0)
     }
    
    private func bindingSettingListItemFromJsonFile() -> [SettingListItemModel] {
        if let path = Bundle.main.path(forResource: "SettingListItem", ofType: "json") {
            do {
                let data    = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let model   = try decoder.decode([SettingListItemModel].self, from: data)
                return model
            } catch (let error) {
                   print("parse error: \(error.localizedDescription)")
            }
        }
        return []
    }
    
    private func gotoPIN4Manager() {
        let pin4MgrVc = PIN4ManagerVC.instantiateFromStoryboard()
        self.navigationController?.pushViewController(pin4MgrVc, animated: true)
    }
    
    private func gotoPIN6Manager() {
        let pin6MgrVc = PIN6ManagerVC.instantiateFromStoryboard()
        self.navigationController?.pushViewController(pin6MgrVc, animated: true)
    }
    
//    private func gotoAlarmSetting() {
//        let alarmVc = PushAlarmTableViewController.instantiateFromStoryboard()
//        self.navigationController?.pushViewController(alarmVc, animated: true)
//    }
//
//    private func gotoUsed() {
//        let useVc = UsedViewController.instantiateFromStoryboard()
//        self.navigationController?.pushViewController(useVc, animated: true)
//    }

}

extension SettingVC: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSoure.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataSoure[indexPath.row]
        if item.c_mnu_nm == "버전정보" {
            let versionSettingCell = tableView.dequeueReusableCell(withIdentifier: "SETTING_VERSION_CELLID", for: indexPath) as! VersionSettingCustomCell
            versionSettingCell.renderInfo(titleSt: item.c_mnu_nm)
            versionSettingCell.isUserInteractionEnabled = false
            return versionSettingCell
        } else {
            let settingCell = tableView.dequeueReusableCell(withIdentifier: "SETTING_CELLID", for: indexPath) as! SettingCustomCell
//            settingCell.renderCell(item: item)
            settingCell.settingNameLb.text  = item.c_mnu_nm
            return settingCell
        }
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // smaller a little bit in small iPhone device
        return 52
    }
    
//    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let item = dataSoure[indexPath.row]
//        
//
//        if item.c_available_service {
//            // open new webview with url
//            if item.c_mnu_type_cd == "WEB" {
//                var fullURLSt = ""
//                if item.c_mnu_url.contains("http://") || item.c_mnu_url.contains("https://") {
//                    fullURLSt = item.c_mnu_url
//                } else {
//                    fullURLSt = G.Url.baseURL + item.c_mnu_url
//                }
//                self.pushWebKit(urlSt: fullURLSt)
//            }
//            
//            //open browser with url
//            else if item.c_mnu_type_cd == "HYBRID" {
//                var fullURLSt = ""
//                if item.c_mnu_url.contains("http://") || item.c_mnu_url.contains("https://") {
//                    fullURLSt = item.c_mnu_url
//                } else {
//                    fullURLSt = G.Url.baseURL + item.c_mnu_url
//                }
//                openBrowser(urlSt: fullURLSt)
//            }
//            
//            // push to each native view controller
//            else {
//                
//                //maybe 화면잠금설장
//                if item.c_mnu_id == "SET_TAB_1" {
//                    gotoPIN4Manager()
//                }
//                
//                //maybe 거래승인번호 설정
//                else if item.c_mnu_id == "SET_TAB_2" {
//                    if ShareConstant.shared.TRX_PWD_REG_YN == "Y" {
//                        gotoPIN6Manager()
//                    } else {
//                        alertMessageConfirm(title: "안내",
//                                            message: "거래승인번호를 설정하지 않았습니다. 지금 바로 설정하시겠습니까?",
//                                            confirmButtonTitle: "설정하기",
//                                            confirmHandler: { (confirmAction) in
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                                self.auth6(type: .SETUP_PIN_1ST_TIME)
//                            }
//                        }, cancelHandler: nil)
//                    }
//                }
//                
//                //maybe 알림설정
//                else if item.c_mnu_id == "SET_TAB_3" {
//                    gotoAlarmSetting()
//                }
//                
//                //maybe 이용해지
//                else if item.c_mnu_id == "SET_TAB_7" {
//                    gotoUsed()
//                }
//            }
//        } else {
//            alertMessageNoAction(content: item.c_available_act)
//        }
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
}
