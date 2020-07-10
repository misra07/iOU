//
//  OweMeDetailsVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/07/10.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class OweMeDetailsVC: UIViewController {
    
    var selectedName: OweMeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedName?.amount = 20.00
        selectedName?.cellNum = 072803
        selectedName?.lastPaid = 10.00
        selectedName?.lastPaidDate = "last night"
        
        print("test")
    }
}
