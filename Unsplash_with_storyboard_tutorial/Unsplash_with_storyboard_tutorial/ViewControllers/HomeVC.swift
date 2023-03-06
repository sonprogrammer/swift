//
//  ViewController.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by youngjin son on 2/27/23.
//

import UIKit
import Toast_Swift
import Alamofire

class HomeVC: UIViewController, UISearchBarDelegate,UIGestureRecognizerDelegate {

    @IBOutlet weak var searchFileterSegment: UISegmentedControl!
    
    
   
    @IBOutlet weak var UISearchBar: UISearchBar!
    
    @IBOutlet weak var searchBtn: UIButton!
    
    
    @IBOutlet weak var searchIndicator: UIActivityIndicatorView!
    
    var keyboardDismissTabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: nil)


    
    //MARK: - override 메소드
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("HomeVC - viewDidLoad() called")
        
        //ui설정
        self.config()
            }
    
    override func viewDidAppear(_ animated: Bool) {
        print("HomeVC - viewDidAppear() called")
        self.searchBtn.becomeFirstResponder()   //포커싱주기
    }

    //네비게이션에서 다른 쪽으로 넘어갈때 이것이 발동이된다. 즉, 화면이 넘어가기전에 준비한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("HomeVC - prepare() called / segue.identifier: \(segue.identifier)")
        
        switch segue.identifier{
        case SEGUE_ID.USER_LIST_VC:
            //다음 화면의 뷰컨트롤러를 가져온다.
            let nextVC = segue.destination as! UserListVC
        
            guard let userInputValue = self.UISearchBar.text else{
                return
            }
            nextVC.vcTitle = userInputValue + " 😇"
        
        default:
            print("default")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("HomeVc - viewWillAppear() called")
        //키보드 올라가는 이벤트를 받는 처리--> keyboardWillShowNotification(키보드가 올라오게 되면) 셀렉터를 통해 해당하는 keyboardWillShowHandle메소드가 발동된다.
        //키보드 노티등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHandle(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideHandle), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("HomeVC - viewWillDisappear() called")
        
        //removeObserver에서 자기 자신이 지워지는거니깐 self로하고 name은 등록했던 이름을 지우는 거니깐 UIResponder해주고 keyboardWillShowNotification을 removeObserver로 지운다. object는 뭐 보내는 거 없으니깐 nil로 해준다.
        //키보드 노티 해제
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: - fileprivate 메소드
    
    fileprivate func config(){
        //ui설정
        self.searchBtn.layer.cornerRadius = 10
        
        self.UISearchBar.searchBarStyle = .minimal
        
        self.UISearchBar.delegate = self
        
        self.keyboardDismissTabGesture.delegate = self
        
        //제스처 추가하기
        self.view.addGestureRecognizer(keyboardDismissTabGesture)
        
//        self.UISearchBar.becomeFirstResponder()//포커싱 주기

    }
    
    fileprivate func pushVC(){
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
    
    
    @objc func keyboardWillShowHandle(notification: NSNotification){
        print("HomeVc - keyboardWillShowHandle() called")
        //키보드 사이즈 가져오기
        //self에 뷰가 프레임에 접근해서 y축을 변경하겠다는거 즉, keyboardWillHideHandle가 되면 y축을 100으로 하겠다는 뜻
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as?NSValue)?.cgRectValue{
            
            print("keyboardSize.height : \(keyboardSize.height)")
            print("searchBtn.frame.origin.y : \(searchBtn.frame.origin.y)")
            
            if(keyboardSize.height < searchBtn.frame.origin.y){
                print("키보드가 버튼을 덮었다.")
                let distance = keyboardSize.height - searchBtn.frame.origin.y
                print("이만큼 덮었다. distance: \(distance)")
                self.view.frame.origin.y = distance + searchBtn.frame.height
            }
//            let distance = keyboardSize.height - searchBtn.frame.origin.y
        }
        self.view.frame.origin.y = -100 //+로 하면 화면이 아래로 내려감 -로 하면 화면이 위로 내려감
        
    }
    
    @objc func keyboardWillHideHandle(){
        print("HomeVC - keyboardWillHideHandle() called")
        //self에 뷰가 프레임에 접근해서 y축을 변경하겠다는거 즉, keyboardWillHideHandle가 되면 y축을 0으로 하겠다는 뜻
        self.view.frame.origin.y = 0
    }
    
    //MAKR: - IBAction 메소드
    
    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        print("HomeVC - onSearchButtonClicked() called / selectedindex: \(searchFileterSegment.selectedSegmentIndex)")
    
        let url = API.BASE_URL + "search/photos"
        
        guard let userInput = self.UISearchBar.text else{return}
        
        //키, 밸류 형식의 딕셔너리
        let queryParam = ["query" : userInput, "client_id" : API.CLIENT_ID] //query는 키고 뒤에는 값(밸류)임
        
        AF.request(url, method: .get, parameters: queryParam).responseJSON(completionHandler: {response in debugPrint(response)
            
        })
        
        //화면으로 이동
        pushVC()
    }
    
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
//        print("HomeVC - searchFilterValueChanged() called / index: \(sender.selectedSegmentIndex)")
        
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
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("HomeVC - searchBarSearchButtonClicked() ")
        
        guard let userInputString = searchBar.text else{
            return
        }
        if userInputString.isEmpty{
            self.view.makeToast("📣검색 키워드를 입력해주세요", duration: 1.0, position: .center)
        }else{
            pushVC()
            searchBar.resignFirstResponder()
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("HomeVC - searchBar textDidChange() searchText : \(searchText)")
        
        
        //사용자가 입력한 값이 없을 때
        if (searchText.isEmpty){
            self.searchBtn.isHidden = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01, execute: {
                
                //포커싱 해제
                searchBar.resignFirstResponder()
            })
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
    
    
    
    //MARK: - UIGestureRecognizerDelegate
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        print("HomeVC - gestureRecognizer shouldReceive() called")
        
        //터치로 들어온 뷰가 요놈이면
        if(touch.view?.isDescendant(of: searchFileterSegment)==true){
            print("세그먼트가 터치된었다.")
            return false
        }else if(touch.view?.isDescendant(of: UISearchBar) == true){
            print("서치바가 터치되었다.")
            return false
        }
        else{
            view.endEditing(true)
            print("화면이 터치되었다")
            return true

        }
    }
    
    
    
}

        
        


