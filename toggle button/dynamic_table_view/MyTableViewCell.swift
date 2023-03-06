//
//  MyTableViewCell.swift
//  dynamic_table_view
//
//  Created by Jeff Jeong on 2020/09/01.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit
import SwipeCellKit

class MyTableViewCell: SwipeTableViewCell {
 
    
    @IBOutlet weak var userProfileImg: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    // 하트 버튼
    @IBOutlet var heartBtn: MyHeartBtn!
    
    // 따봉 버튼
    @IBOutlet var thumbsUpBtn: UIButton!
    
    
    @IBOutlet weak var shareBtn: UIButton!
    
    
    @IBOutlet var btns:[UIButton]!
    
    
    var heartBtnAction : ((Bool)-> Void)?//옵셔널처리 안될수도 있다라는 뜻
    
    
    override func awakeFromNib() {
        print("MyTableViewCell - awakeFromNib() called")
        super.awakeFromNib()
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.height / 2
        btns.forEach{ $0.addTarget(self, action: #selector(onBtnClicked(_:)), for: .touchUpInside)}
        
        
    }
    
    func updateUI(with data: Feed){
        print("MyTableViewCell - updateUI() called")
        heartBtn.setState(data.isFavorite)
        thumbsUpBtn.tintColor = data.isThumbsUp ? #colorLiteral(red: 0.1887893739, green: 0.3306484833, blue: 1, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentLabel.text = data.content
    }
    
    @objc fileprivate func onBtnClicked(_ sender: UIButton){
        switch sender {
        case heartBtn:
            print("하트 버튼이 클릭되었다")
//            heaertBtnAction?(heartBtn.isActivated)
        case thumbsUpBtn:
            print("따봉 버튼이 클릭되었다")
        case shareBtn:
            print("쉐어 버튼이 클릭되었다")
        default:
            break
        }
    }
}
