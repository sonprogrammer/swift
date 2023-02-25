//
//  ViewController.swift
//  Photo
//
//  Created by youngjin son on 2/25/23.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileChangeBtn: UIButton!
    
    
    
    override func viewDidLoad() {   //메모리가 다올라감
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height / 2 //이럼 원이 생성됨 그니깐 원래 imageview가 네모난데 위처럼 해주면 동그랗게 된다.
        self.profileChangeBtn.layer.cornerRadius = 10
        
        //버튼 클릭 액션 설정
        self.profileChangeBtn.addTarget(self, action: #selector(onProfileChangeBtnClicked), for: .touchUpInside) //.touchUpInside는 버튼이 클릭됬을 때를 행한다를 의미
    }
    
    //프사 변경 버튼이 클릭되었을 때 이미지피커를 띄우게 할것이다
    @objc fileprivate func onProfileChangeBtnClicked(){
        print("ViewController - onProfileChangeBtnClicked() clicked")
        
        //카메라 라이브러리 세팅
        var config = YPImagePickerConfiguration()
        config.screens = [.library, .photo, .video]
        
        let picker = YPImagePicker(configuration: config)
        
        //사진이 선택되었을 때
        picker.didFinishPicking { [unowned picker] items, _ in
            
            
            if let photo = items.singlePhoto {
                print(photo.fromCamera) // Image source (camera or library)
                print(photo.image) // Final image selected by the user
                print(photo.originalImage) // original image selected by the user, unfiltered
                print(photo.modifiedImage) // Transformed image, can be nil
                print(photo.exifMeta) // Print exif meta data of original image.
                //프사이미지를 변경한다.
                self.profileImage.image = photo.image   //profileImage의 이미지는 photo.image로 하겠다는 뜻이다
            }
            
            //사진 선택창 닫기
            picker.dismiss(animated: true, completion: nil)
        }
        //사진 선택창 보여주기
        present(picker, animated: true, completion: nil)
        
        
    }


}

