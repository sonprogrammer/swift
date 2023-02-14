//
//  ViewController.swift
//  NiceApp
//
//  Created by youngjin son on 2/10/23.
//

import UIKit
import Lottie


class MainViewController: UIViewController {

    let titleLabel: UILabel = {
       
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "main"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        
        return label
    }()
    
    let animationView: AnnimationView = {
        let animView = AnimationView(name: "9648-apple-logo-annimation")
        animView.frame = CGRect(x:0, y:0, width: 400, height:400)
        animView.contentMode = .scaleAspectFill
        //contentMode는 이미지를 확대할거냐 축소할건지 정해주는것
        return animView
    }()
    
    //뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        view.addSubview(animationView)
        animationView.center = view.center
        
    
        //애니메이션 실행
        animationView.play{(finish) in
            print("애니메이션이 끝남")
            
            self.view.backgroundColor = .white
            
            self.animationView.removeFromSuperview()
            
            self.view.addSubview(self.titleLabel)
     
            self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            self.titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
        view.addSubview(animationView)
        animationView.center = view.center
    }


}

