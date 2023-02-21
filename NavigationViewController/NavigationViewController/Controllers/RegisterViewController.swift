//
//  RegisterViewController.swift
//  NavigationViewController
//
//  Created by youngjin son on 2/21/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var buttonforLoginViewController: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
    }


    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("RegisterViewController - onLoginViewControllerBtnClicked() called / 로그인 버튼 클릭!!")
    //이 함수가 발동 될때 네비게이션 뷰 컨트롤러를 팝한다
        self.navigationController?.popViewController(animated: true)
    
    }
}
