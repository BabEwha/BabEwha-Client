//
//  Party.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import Foundation

struct Party: Hashable {
    var id: Int
    var name: String
    var createdDate: Date
    var timeLimit: Date
    var partyImage: String
    var maxNum: Int
    var body: String
    var link: String
    // 장소(공학관 등 넓은 범위)
    var place: String
    // 배부장소
    var handoutPlace: String
    
    static let defaultModel: Party = .init(id: 0,
                                           name: "영천 닭강정",
                                           createdDate: .now,
                                           timeLimit: .now,
                                           partyImage: "",
                                           maxNum: 3,
                                           body: "맛있어요",
                                           link: "",
                                           place: "공학관",
                                           handoutPlace: "공대 입구")
}
