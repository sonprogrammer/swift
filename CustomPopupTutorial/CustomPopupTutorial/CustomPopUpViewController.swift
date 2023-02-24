//
//  CustomPopUpViewController.swift
//  CustomPopupTutorial
//
//  Created by youngjin son on 2/23/23.
//

import UIKit

class CustomPopUpViewController: UIViewController{
   
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var subscribeBtn: UIButton!
    @IBOutlet weak var openChatBtn: UIButton!
    
    @IBOutlet weak var blogBtn: UIButton!
    
    
    var subscribeBtnCompletionClosure: (() -> Void)? //{() -> Void}?이뜻은 아무행동도 안한다는 뜻
    
    var myPopUpDelegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")

        ContentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        openChatBtn.layer.cornerRadius = 10
        blogBtn.layer.cornerRadius = 10
        
    }
    //MARK: - IBactions
    
    @IBAction func blogBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - blogBtnClicked() called")    //이 말은 CustomPopUpViewController에 blogBtnClicked가 발동되었다라는 뜻
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName), object: nil)   //post는 이벤트를 알린다는 메소드
        dismiss(animated: true, completion: nil)    //버튼을 클릭했을 때 디스미스를 하겠다는 것, completion은 이벤트를 전달할것이냐라는 뜻 여기서 nil로 햇으니깐 아니요가 됨
    }
    
    
    
    
    @IBAction func bgBtnclicked(_ sender: UIButton) {
        print("CustomPopUpViewController - bgBtnclicked() called")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onSubscribeBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onSubscribeBtnClicked() called")
        
        self.dismiss(animated: true, completion: nil)
        
        //컴플레션 블럭 호출
        if let subscribeBtnCompletionClosure = subscribeBtnCompletionClosure{
            
            //메인에 알린다
            subscribeBtnCompletionClosure()
        }
        
        
    }

    @IBAction func onOpenChatBtnClicked(_ sender: UIButton) {
        print("CustomPopUpViewController - onOpenChatBtnClicked() called")
        
        myPopUpDelegate?.onOpenChatBtnClicked() //openChatBtn이 클릭이 되었을 때 onOpenChatBtnClicked이 클릭이 되었다고 설정해준것이다. -> 이게 리모콘 누른것과 같다 티비라고 치면 채널 onOpenChatBtnClicked채널로 가라 라는 명령과 같다. 그 수신은 ViewController가 되는 것이다.
        self.dismiss(animated: true, completion: nil)
    }
    
}
