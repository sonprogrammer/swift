//
//  ViewController.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by youngjin son on 2/27/23.
//

import UIKit
import Toast_Swift

class HomeVC: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchFileterSegment: UISegmentedControl!
    
    
   
    @IBOutlet weak var UISearchBar: UISearchBar!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!


    
    //MARK: - override 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("HomeVC - viewDidLoad() called")
        
        //ui설정
        self.searchBtn.layer.cornerRadius = 10
        
        self.UISearchBar.searchBarStyle = .minimal
        
        self.UISearchBar.delegate = self
    }

    
    //MAKR: - IBAction 메소드
    
    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        print("HomeVC - onSearchButtonClicked() called / selectedindex: \(searchFileterSegment.selectedSegmentIndex)")
        
        var segueId : String = ""
        
        switch searchFileterSegment.selectedSegmentIndex {
        case 0:
            print("사진 화면으로 이동")
            segueId = "goToPhotoCollectionVC"
        case 1:
            print("사용자 화면으로 이동")
            segueId = "goToUserListVC"
        default:
            print("default")
            segueId = "goToPhotoCollectionVC"
        }
        
        //화면이동
        self.performSegue(withIdentifier: segueId, sender: self)
    }
    
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        print("HomeVC - searchFilterValueChanged() called / index: \(sender.selectedSegmentIndex)")
        
        var searchBarTitle = ""
        
        switch sender.selectedSegmentIndex {
        case 0:
            searchBarTitle = "사진 키워드"
        case 1:
            searchBarTitle = "사용자 이름"
        default:
            searchBarTitle = "사진 키워드"
        }
        self.UISearchBar.placeholder = searchBarTitle + " 입력"
        
        self.UISearchBar.becomeFirstResponder() //포커싱 주기
        self.UISearchBar.resignFirstResponder() //포커싱 해제
    }
    
    //MARK: - UISearchBar 델리겟 메소드
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText : \(searchText)")
        
        
        //사용자가 입력한 값이 없을 때
        if (searchText.isEmpty){
            self.searchBtn.isHidden = true
            //포커싱 해제
            searchBar.resignFirstResponder()
        }else{
            self.searchBtn.isHidden = false
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let inputTextCount = searchBar.text?.appending(text).count ?? 0
        
        print("shouldChangeTextIn : \(inputTextCount)")
        
        if(inputTextCount >= 12){
            self.view.makeToast("📢12자까지만 입력가능합니다", duration: 1.0, position: .center)
            
        }
        
//        if inputTextCount <= 12 {
//            return true
//        }else{
//            return false
//            }
        return inputTextCount <= 12
        }
    }
        
        


