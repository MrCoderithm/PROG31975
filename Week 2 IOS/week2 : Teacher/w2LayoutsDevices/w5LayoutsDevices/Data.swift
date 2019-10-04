//
//  Data.swift
//  w5LayoutsDevices
//
//  Created by Jawaad Sheikh on 2017-06-07.
//  Copyright © 2017 Jawaad Sheikh. All rights reserved.
//

import UIKit

// Step 7c - declare the Data object as follows
class Data: NSObject {

    var savedName : String?
    var savedEmail : String?
    
    
    func initWithStuff(theName : String, theEmail : String)
    {
        savedName = theName
        savedEmail = theEmail
    }
}
