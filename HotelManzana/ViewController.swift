//
//  ViewController.swift
//  HotelManzana
//
//  Created by ALI MOOSA on 05/12/2022.
//

import UIKit

class ViewController: UIViewController {


    struct RoomType : Equatable{
        var id : Int
        var name : String
        var shortName : String
        var price : Int
        
        // equatable protocol
        
        static func ==(lhs: RoomType, rhs: RoomType) -> Bool{
            
            return lhs.id == rhs.id
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

