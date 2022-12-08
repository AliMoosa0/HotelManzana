//
//  roomType.swift
//  HotelManzana
//
//  Created by ALI MOOSA on 08/12/2022.
//

import Foundation
struct RoomType: Equatable {
    var id: Int
    var name :String
    var shortName: String
    var price: Int
    // equatavle proptocol
    
    static func == (lhs:RoomType , rhs: RoomType ) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    
    static var all: [RoomType] {
        return [RoomType(id: 0, name: "two queens", shortName: "2Q", price: 179),
        RoomType(id: 1, name: "one King", shortName: "1K", price: 209),
        RoomType(id: 2, name: "penthouse suite", shortName: "PHS", price: 309)]
        
        
    }
}
