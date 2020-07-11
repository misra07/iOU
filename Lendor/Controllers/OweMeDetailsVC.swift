//
//  OweMeDetailsVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/07/10.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit
import RealmSwift

class OweMeDetailsVC: UIViewController {
    
    var selectedName: List<OweMeItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(selectedName![0].nextPayDate)
    }
    

}
