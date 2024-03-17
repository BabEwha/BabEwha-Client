//
//  User.swift
//  BabEwha
//
//  Created by sole on 3/16/24.
//

import Foundation

struct User {
    var userid: Int
    var email: String
    var name: String
    var nickname:String
    var createdAt: Date
    var role: String
    var phone: Int
    
    static let defaultModel: User = .init(userid: 0,
                                          email: "ew@ewhain.net",
                                          name: "김이화",
                                          nickname: "감자",
                                          createdAt: .now,
                                          role: "방장",
                                          phone: 123456)
}
