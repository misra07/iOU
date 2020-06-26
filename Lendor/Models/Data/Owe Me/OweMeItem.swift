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
    @objc dynamic var details: String = ""
    var parent = LinkingObjects(fromType: OweMe.self, property: "details")
}
