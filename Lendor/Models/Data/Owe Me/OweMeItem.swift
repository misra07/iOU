//
//  OweMeItem.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/26.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import Foundation
import RealmSwift

class OweMeItem: Object {
    var parent = LinkingObjects(fromType: OweMe.self, property: "details")
    @objc dynamic var amount: Double = 1.00
    @objc dynamic var lastPaid: Double = 2.00
    @objc dynamic var lastPaidDate: String = "07-07-2020"
    @objc dynamic var nextPayDate: String = "09-09-2020"
    @objc dynamic var cellNum: Int = 072-803-4411
    
    
    
}
