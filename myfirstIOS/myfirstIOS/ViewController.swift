//
//  ViewController.swift
//  myfirstIOS
//
//  Created by youngjin son on 2/10/23.
//

import UIKit

class ViewController: UIViewController {

    
    //제목
    var titleLabel : UILabel = {
       
        let label = UILabel()
        label.text = "hello world!!!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .purple
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}

