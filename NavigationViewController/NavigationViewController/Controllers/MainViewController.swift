//
//  MainViewController.swift
//  NavigationViewController
//
//  Created by youngjin son on 2/23/23.
//

import UIKit

class MainViewController: UIViewController{
    
    //제목
    var titleLabel: UILabel = { //선언과 동시에 정의 하는 것
        let label = UILabel()
        label.text = "메인화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.white
        return label  //반환한 값을 titleLable로해서 들어간다는 뜻
    }()
    
    
    //뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

