//
//  ViewController.swift
//  pagerView
//
//  Created by youngjin son on 2/25/23.
//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {

    
    fileprivate let imageNames = ["1.png", "2.png","3.png", "4.png"]

    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    
    
    
    
    @IBOutlet weak var myPagerView: FSPagerView!{
        didSet{
            //페이져뷰에 쎌을 등록한다.
            self.myPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            //아이템 크기 설정
            self.myPagerView.itemSize = FSPagerView.automaticSize
            //무한 스크롤설정
            self.myPagerView.isInfinite = true
            // 자동 스크롤 설정
            self.myPagerView.automaticSlidingInterval = 3.0
        }
    }
    
    @IBOutlet weak var myPageControl: FSPageControl!{
        didSet{
            self.myPageControl.numberOfPages = self.imageNames.count//numberOfPages는 총 점을 몇번을 할꺼냐를 말함 self.imageNames.count 이 뜻은 내가 가지고 있는 사진의 갯수만큼을 말한다.
            self.myPageControl.contentHorizontalAlignment = .right //슬라이드가 오른쪽으로감
            self.myPageControl.itemSpacing = 16 //점과 점사이의 간격을 말함
            self.myPageControl.interitemSpacing = 16
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myPagerView.dataSource = self  //여기서 self는 FSPagerViewDataSource를 말함, 연결하는거임
        self.myPagerView.delegate = self    //여기서 self는 FSPagerViewDelegate를 말함, 연결하는거임
        
        self.rightBtn.layer.cornerRadius = self.rightBtn.frame.height / 2
        self.leftBtn.layer.cornerRadius = self.leftBtn.frame.height / 2
        
        
    }
    
    
    //MARK: - IBAction
    @IBAction func onleftBtnClicked(_ sender: UIButton) {
        print("ViewController - onleftBtnClicked() called")
        self.myPageControl.currentPage = self.myPageControl.currentPage - 1 //현재페이지의 -1함으로써 뒤 페이지로 간다.
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }
    
    
    @IBAction func onrightBtnClicked(_ sender: UIButton) {
        print("ViewController - onrightBtnClicked() called")
        
        if(self.myPageControl.currentPage == self.imageNames.count - 1){
            self.myPageControl.currentPage = 0
        }else
        {
            self.myPageControl.currentPage = self.myPageControl.currentPage - 1
        }
        
        self.myPageControl.currentPage = self.myPageControl.currentPage + 1 //현재페이지의 -1함으로써 뒤 페이지로 간다.
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }


    //MARK: - FSPagerView 데이터 소스
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    //각 셀에 대한 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)

        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFit
        // cell.textLabel?.text =
        return cell

    }
    
    
    //MARK: - FSPagerView delegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.myPageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.myPageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
}

