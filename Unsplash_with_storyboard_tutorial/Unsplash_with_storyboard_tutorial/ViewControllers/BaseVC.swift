//
//  BaseVC.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by youngjin son on 3/2/23.
//

import UIKit

class BaseVC: UIViewController{
    var vcTitle: String = ""{   //빈값으로 설정함
        didSet {
            print("UserListVC - vcTitle didSet() called / vcTitle: \(vcTitle)")
            self.title = vcTitle
        }
        
    }
    
}
