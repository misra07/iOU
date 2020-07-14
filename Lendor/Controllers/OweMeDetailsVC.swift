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
    let realm = try! Realm()
    
    var detAmount: Double = 0.0
    var detLastPaid : Double = 0.0
    var detLastPaidDate: String = ""
    var detNextPay: Double = 0.0
    var detNextPayDate: String = ""
    var detCellNum: Int = 0
    
    @IBOutlet weak var amountOwed: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        detAmount = selectedName![0].amount
        detLastPaid = selectedName![0].lastPaid
        detLastPaidDate = selectedName![0].lastPaidDate
        detNextPay = selectedName![0].nextPay
        detNextPayDate = selectedName![0].nextPayDate
        detCellNum = selectedName![0].cellNum
        
        
        amountOwed.text = String(detAmount)
        //print(selectedName![0].nextPayDate)
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        detAmount = detAmount + 1
        amountOwed.text = String(detAmount)
    }
    @IBAction func subButtonClicked(_ sender: UIButton) {
        
        detAmount = detAmount - 1
        amountOwed.text = String(detAmount)
    }

    
//    func save (record: OweMe) {
//        do {
//            try realm.write {
//                realm.add(record)
//            }
//        } catch {
//           print("failed to write to realm \(error)")
//        }
//
//    }

}
