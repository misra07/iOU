//
//  IOwe.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/26.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import Foundation
import RealmSwift


class IOwe: Object {
    @objc dynamic var name: String = ""
    let details = List<IOweItem>()
}

