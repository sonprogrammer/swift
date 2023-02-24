//
//  ViewController.swift
//  CustomPopupTutorial
//
//  Created by youngjin son on 2/23/23.
//

import UIKit
import WebKit

let notificationName = "btnClickedNotification"     //btnClickedNotification이 방송 주파수라 생각하면된다.

class ViewController: UIViewController, PopUpDelegate { //PopUpDelegate는 프로토콜로 약간 안테나 같은 설정을 해놓은 것이다, 선으로 연결해야한다 PopUpDelegate은 수신기 역할을 함. 선으로 연결을 해줘야한다(클로저로 연결하는것 마냥 CustomPopUpViewController의 명령을 타게 되는 것이다.

    

    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var createPopUpBtn: UIButton!
    
    
    deinit{
        NotificationCenter.default.removeObserver(self) //메모리해제가 됨 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //노티피케이션이라는 방송수신기를 장착한다., +NotificationCenter는 항상 이벤트를 수신한다. 등록을 햇으면 해제도 해줘야한다.
        NotificationCenter.default.addObserver(self, selector: #selector(loadWebView), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    @objc fileprivate func loadWebView(){
        print("ViewController - loadWebView() called")
        let myBlogaddress = URL(string: "https://sonprogrammer.github.io/")
        self.myWebView.load(URLRequest(url: myBlogaddress!))
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
        
        customPopUpVC.myPopUpDelegate = self //여기서 self는 뷰컨트롤러가 아니라 뷰컨트롤러에서 받은 myPopUpDelegate을 가리키는 것이다.
        
        self.present(customPopUpVC, animated: true, completion: nil)
    }
    //MARK: - PopUpDelegate 메소드
    func onOpenChatBtnClicked() {
        print("ViewController - onOpenChatBtnClicked() called")     //이벤트를 받게 된다.
        let myChannelUrl = URL(string: "https://open.kakao.com/o/s1L90m6e")
        self.myWebView.load(URLRequest(url: myChannelUrl!))
    }
    
}

