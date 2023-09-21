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
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
}
