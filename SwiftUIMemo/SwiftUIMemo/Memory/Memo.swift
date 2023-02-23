//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by youngjin son on 2/23/23.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {  //Identifiable은 데이터를 리스트에 쉽게 바인딩하기 위해 필요, ObservableObject은 메모를 편집할 때 뷰를 자동으로 업데이트하기위해 필요함
    
    let id: UUID
    @Published var content: String  //Published특성을 추가하면 새로운 값을 저장할 때마다 바인딩되어 있는 UI가 자동으로 업데이트 된다
    let insertDate: Date    //날짜 저장
    
    init(content: String, insertDate: Date = Date.now){
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
    
    
}
