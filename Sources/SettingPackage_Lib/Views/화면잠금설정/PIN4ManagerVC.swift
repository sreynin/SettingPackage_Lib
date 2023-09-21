//
//  PIN4ManagerVC.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import UIKit

public class PIN4ManagerVC: UIViewController, Instantiable {
    public static var storyboardName: StringConvertible { StoryboardName.SettingSB }
    
    @IBOutlet weak var pin4MgrTableView: UITableView!
    let dataSource = ["화면잠금사용", "비밀번호 변경", "비밀번호 재설정"]
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
