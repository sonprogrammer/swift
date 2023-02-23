//
//  ViewController.swift
//  CustomPopupTutorial
//
//  Created by youngjin son on 2/23/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        print("ViewController - onCreatePopUpBtnClicked() called")
        
        //스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        
        //스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopUpVC = storyboard.instantiateViewController(withIdentifier: "AlertPopUpVC") as! CustomPopUpViewController
        
        //뷰컨트롤러가 보여지는 스타일
        //팝업 효과 설정(뿅하고 나타나는 효과)
        customPopUpVC.modalPresentationStyle = .overCurrentContext
        
        //뷰컨트롤러가 사라지는 스타일
        customPopUpVC.modalTransitionStyle = .crossDissolve //crossDissolve는 사라지는 효과이름이다(스르르사라지는거 안개처럼)
        
        customPopUpVC.subscribeBtnCompletionClosure = {
            print("컴플레션 블럭이 호출되었다! ")
            let myChannelUrl = URL(string: "https://www.youtube.com/")
            self.myWebView.load(URLRequest(url: myChannelUrl!)) //!는 값이 꼭있을거라는 뜻
        }
        
        
        self.present(customPopUpVC, animated: true, completion: nil)
    }
    
    
}

