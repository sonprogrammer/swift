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
    
    var subscribeBtnCompletionClosure: (() -> Void)? //{() -> Void}?이뜻은 아무행동도 안한다는 뜻
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomPopUpViewController - viewDidLoad() called")

        ContentView.layer.cornerRadius = 30
        subscribeBtn.layer.cornerRadius = 10
        
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
    
    
    
    
    
}
