//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by youngjin son on 2/23/23.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]     //배열을 업뎃할때마다 바인딩되어있는 뷰도 자동으로 업데이트 된다.
    
    init(){
        list = [
            Memo(content: "Hello", insertDate: Date.now),
            Memo(content: "Aweseom", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "swiftUI", insertDate: Date.now.addingTimeInterval(3600 * -48))
            ]
    }
    
    func insert(memo: String){
        list.insert(Memo(content: memo), at: 0) //새로운 메모가 가장 먼저 표시된다.
    }
    func update(memo: Memo?, content: String){  //새로운 메모와 편집된 메모를 받는다
        guard let memo = memo else{
            return
        }
        
        memo.content = content
    }
    
    func delete(memo: Memo){
        list.removeAll { $0.id == memo.id}
    }
    
    func delete(set: IndexSet){
        for index in set{
            list.remove(at: index)
        }
    }
}
