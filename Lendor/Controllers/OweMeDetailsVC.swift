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
    
//    var detAmount: Double = 0.0
//    var detLastPaid : Double = 0.0
//    var detLastPaidDate: String = ""
//    var detNextPay: Double = 0.0
//    var detNextPayDate: String = ""
//    var detCellNum: Int = 0
    
    @IBOutlet weak var amountOwed: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        detAmount = selectedName![0].amount
//        detLastPaid = selectedName![0].lastPaid
//        detLastPaidDate = selectedName![0].lastPaidDate
//        detNextPay = selectedName![0].nextPay
//        detNextPayDate = selectedName![0].nextPayDate
//        detCellNum = selectedName![0].cellNum
        
        
        loadRealm()
        //print(selectedName![0].nextPayDate)
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "", message: "How much would you like to lend", preferredStyle: .alert)
        let action = UIAlertAction(title: "Lend", style: .default) { (action) in
            
        let dubtextfiled = Double(textfield.text!)
            
            //update user's entered amount to realm
            do {
                try self.realm.write {
                    self.selectedName![0].amount = self.selectedName![0].amount + dubtextfiled!
                }
            } catch {
                print ("error \(error)")
            }
            self.loadRealm()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "$ 7.00"
            textfield = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil )
        
        
    }
    
    
    @IBAction func subButtonClicked(_ sender: UIButton) {

                var textfield = UITextField()
                
                let alert = UIAlertController(title: "", message: "How much would you like to substract", preferredStyle: .alert)
                let action = UIAlertAction(title: "Substract", style: .default) { (action) in
                    
                let dubtextfiled = Double(textfield.text!)
                    
        //update user's entered amount to realm
                    do {
                        try self.realm.write {
                            self.selectedName![0].amount = self.selectedName![0].amount - dubtextfiled!
                        }
                    } catch {
                        print ("error \(error)")
                    }
                    self.loadRealm()
                    
                }
                
                alert.addTextField { (alertTextField) in
                    alertTextField.placeholder = "$ 7.00"
                    textfield = alertTextField
                }
                
                alert.addAction(action)
                present(alert, animated: true, completion: nil )
       
    }

    

    func loadRealm(){
        amountOwed.text = String(selectedName![0].amount)
    }

}
