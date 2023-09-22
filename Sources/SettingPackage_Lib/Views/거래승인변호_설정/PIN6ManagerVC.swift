//
//  PIN6ManagerVC.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import UIKit

public class PIN6ManagerVC: UIViewController, Instantiable {
    public static var storyboardName: StringConvertible { StoryboardName.SettingSB }
    // ------- connection outlet ----------
    @IBOutlet weak var authManagerTableView: UITableView!
    
    let dataSource = ["거래승인번호 변경", "거래승인번호 재설정", "생체인증 사용"]
    var BIO_LOCK_YN = "N"
    //Compltion data
    var auth6Completion :(()->Void)?
    var requestAlramBioCom :((_ stsYn:String)->Void)?
    var change6PinCom : (()->Void)?
    var reset6PinCom  : (()->Void)?
    
    private var isBioMatricWorked: Bool {
        let isBioMatricEnable = UIDevice.checkSecurityType()
        return (isBioMatricEnable == .faceID || isBioMatricEnable == .touchID)
    }
    private var bioCustomCell: BiometricCustomCell? {
        authManagerTableView.cellForRow(at: IndexPath(row: (dataSource.count - 1), section: 0)) as? BiometricCustomCell
    }
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc private func bioAuthToggleAction(sender: UIButton) {
        //check if phone no BioMatric or not register BioMatric
        if isBioMatricWorked {
            sender.isSelected.toggle()
            if sender.isSelected {
              if let auth6completion = self.auth6Completion {auth6completion()}
            } else {
                if let requestAlramBioCom = self.requestAlramBioCom {requestAlramBioCom("N")}
            }
        } else {
            alertMessage(title: "생체 정보가 등록되어 있지 않습니다.", message: "기기에서 생체정보 등록 후 다시 시도하세요.\n(설정앱> Touch ID/Face ID 및 암호에서 등록 가능)", action: nil)
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension PIN6ManagerVC: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // last cell is for BioMatric
        if indexPath.row == (dataSource.count - 1) {
            let biometricCell = tableView.dequeueReusableCell(withIdentifier: "BIOMETRIC_CELLID", for: indexPath) as! BiometricCustomCell
            
            //add event to bio status button
            biometricCell.bioStsBtn.addTarget(self, action: #selector(bioAuthToggleAction(sender:)), for: .touchUpInside)
            
            // Bio toggle STATUS
            if isBioMatricWorked {
                biometricCell.bioStsBtn.isSelected = (BIO_LOCK_YN == "Y")
            } else {
                biometricCell.bioStsBtn.isSelected = false
            }
            
            return biometricCell
        } else {
            let pin6CustomCell = tableView.dequeueReusableCell(withIdentifier: "PIN6MGR_CELLID", for: indexPath) as! PIN6ManagerCustomCell
            pin6CustomCell.titleLb.text = dataSource[indexPath.row]
            return pin6CustomCell
        }
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // smaller a little bit in small iPhone device
        let stableHeight: CGFloat = (DeviceInfo.info.groupDeviceScreenType() == .Mini) ? 52.0 : 62.0
        return stableHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //change PIN6
        if indexPath.row == 0 {
            if let change6PinCom = self.change6PinCom {change6PinCom()}
            //auth6(type: .AUTH_CONFORM_CHANGE_PIN)
        }
        
        //reset PIN6
        if indexPath.row == 1 {
//            let urlSt = APIInstance().PHONE_CERT_URL
//            pushWebKit(urlSt: urlSt, isReset4PIN: false)
            if let reset6PinCom = self.reset6PinCom {reset6PinCom()}
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
