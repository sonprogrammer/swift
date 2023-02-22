//
//  ViewController.swift
//  QRcodeTutorial_Swift
//
//  Created by youngjin son on 2/22/23.
//

import UIKit
import WebKit
import AVFoundation
import QRCodeReader

class MainViewController: UIViewController, QRCodeReaderViewControllerDelegate {
    
    //MainViewController는 UIViewController를 상속을 하고 있는것이다. 그런 뜻임
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var qrcodeBtn: UIButton!
    
    //QR코드 리더 뷰컨트롤러를 만든다
    // Good practice: create the reader lazily to avoid cpu overload during the
    // initialization and each time we need to scan a QRCode
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
            
            // Configure the view controller (optional)
            $0.showTorchButton        = false
            $0.showSwitchCameraButton = false
            $0.showCancelButton       = false
            $0.showOverlayView        = true
            $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    
    //MARK: - 오버라이드 메소드
    //위처럼하면 코드를 편하게 찾기 쉽다
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = URL (string: "https://www.naver.com")
                let requestObj = URLRequest(url: url!)
        webView.load(requestObj)
        
        qrcodeBtn.layer.borderWidth = 3
        qrcodeBtn.layer.borderColor = UIColor.blue.cgColor
        qrcodeBtn.layer.cornerRadius = 10
        qrcodeBtn.addTarget(self, action: #selector(qrcodeLaunch), for: .touchUpInside)
        //touchUpInside는 버튼을 눌렀을 때 발동이되게 하는 것
    }
    //MARK: - fileprivate 메소드
   @objc fileprivate func qrcodeLaunch(){
        print("MainViewController - qrcodeLaunch() called")
       // Retrieve the QRCode content
         // By using the delegate pattern
         readerVC.delegate = self

         // Or by using the closure pattern
         readerVC.completionBlock = { (result: QRCodeReaderResult?) in
           print(result)
             
             //guard let으로 옵셔널을 풀수 있다. 옵셔널이란 위에 값이 있을 지 없을지 모른다는 뜻으로 '?'를 쓴다
             guard let scannedUrlString = result?.value else { return } //값이 있으면 넣어주고 없으면(else) return을 해줘라 이뜻이다.
             
             print("scannedUrlString: \(scannedUrlString)")
             let scannedUrl = URL(string: scannedUrlString)
             self.webView.load(URLRequest(url: scannedUrl!))  //뒤에 느낌표(!)는 반드시 값이 있다는 뜻이다.
             
         }

         // Presents the readerVC as modal form sheet
         readerVC.modalPresentationStyle = .formSheet
        
         //설정된 qr코드 뷰 컨트롤러를 화면에 보여준다.
         present(readerVC, animated: true, completion: nil)
    }

    //MARK: - QR코드 리더 델리겟 메소드
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()

        dismiss(animated: true, completion: nil)
    }
}

