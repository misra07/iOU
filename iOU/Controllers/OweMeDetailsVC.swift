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
    
    @IBOutlet weak var amountOwed: UILabel!
    @IBOutlet weak var nextPayLBL: UILabel!
    @IBOutlet weak var nextPayDateLBL: UILabel!
    @IBOutlet weak var lastPayLBL: UILabel!
    @IBOutlet weak var lastPayDateLBL: UILabel!
    @IBOutlet weak var avatarLBL: UILabel!
    @IBOutlet weak var contactCellLBL: UILabel!
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(selectedName![0].parent[0].name)

        loadRealm()
        //print(selectedName![0].nextPayDate)
        
    }
    
    @IBAction func nextPayBTN(_ sender: UIButton) {
        print("clicked!")
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
        nextPayLBL.text = String(selectedName![0].nextPay)
        nextPayDateLBL.text = String(selectedName![0].nextPayDate)
        lastPayLBL.text = String(selectedName![0].lastPaid)
        lastPayDateLBL.text = String(selectedName![0].lastPaidDate)
        contactCellLBL.text = String(selectedName![0].cellNum)
    }

}
