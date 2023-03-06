//
//  MyHeartBtn.swift
//  dynamic_table_view
//
//  Created by youngjin son on 3/6/23.
//  Copyright © 2023 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit

class MyHeartBtn: UIButton{
    
    var isActivated : Bool = false
    
    let activatedImage = UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)).withRenderingMode(.alwaysOriginal)
    let normalImage = UIImage(systemName: "heart")?.withTintColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).withRenderingMode(.alwaysOriginal)
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("MyHeartBtn - awakeFromNib() called")
    }
    
    func setState(_ newValue:Bool){
        print("MyHeartBtn - setState() called / newValue: \(newValue)")
        
        //1. 현재 버튼의 상태 변경
        self.isActivated = newValue
        
        //2. 변경된 상태에 따른 이미지 변경
        self.setImage(self.isActivated ? activatedImage : normalImage, for: .normal)
    }
    
    fileprivate func configureAction(){
        print("MyHeartBtn - configureAction() called")
        self.addTarget(self, action: #selector(onBtnClicked(_:)), for: .touchUpInside)
    }
    
    @objc fileprivate func onBtnClicked(_ sender: UIButton){
        print("MyHeartBtn - onBtnClicked() called")
        self.isActivated.toggle()
        //애니메이션 처리하기
        animate()
        
    }
    
    fileprivate func animate(){
        print("MyHeartBtn - animate() called")
        
        
        UIView.animate(withDuration: 0.1, animations: {[weak self] in
            guard let self = self else{return}
            let newImage = self.isActivated ? self.activatedImage : self.normalImage //내가 만약에 isActivated라하면 activateImage로 넣어주고 (그게아니라면이 ':'까지) 그게 아니라면 normalImage를 넣어준다
            //1. 좋아요(하트) 클릭 되었을 때 쪼글아 들기 - scale이 즉 크기가 변경 50%정도로 크기 변경
            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)//x는 좌우크기, y는 위아래 크기
            self.setImage(newImage, for: .normal)
        },completion:  { _ in
            //2.원래 크기로 돌리기 1초동안
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity //원래 있던 상태로 돌아간다는 것
            })
        })
        
        
            
    }
    
}
