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
    
    
    @IBAction func nextPayBTNClicked(_ sender: UIButton) {
        
    
        var textfield = UITextField()
        let alert = UIAlertController(title: "", message: "enter the amount \(String(selectedName![0].parent[0].name)) will pay next time" , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let dubtextfiled = Double(textfield.text!)
            
            do {
                try self.realm.write {
                    self.selectedName![0].lastPaid = Double(self.nextPayLBL.text!)!
                    self.selectedName![0].nextPay = dubtextfiled!
                }
            }
            catch {
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
    @IBAction func nextPayDateBTNClicked(_ sender: UIButton) {
        
        
        var textfield = UITextField()
        let alert = UIAlertController(title: "", message: "when will they Pay?" , preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            
            
            do {
                try self.realm.write {
                    self.selectedName![0].lastPaidDate = self.nextPayDateLBL.text!
                    self.selectedName![0].nextPayDate = textfield.text!
                }
            }
            catch {
                print ("error \(error)")
            }
            
            self.loadRealm()
        }
        
        alert.addTextField { (alertTextField) in
            textfield = alertTextField
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil )
        
    }
    @IBAction func lastPayBTNCLicked(_ sender: UIButton) {
    }
    @IBAction func lastPayDateBTNClicked(_ sender: UIButton) {
    }
    @IBAction func contactCellBTNClicked(_ sender: UIButton) {
        
        var textfield = UITextField()
        let alert = UIAlertController(title: "", message: "\(String(selectedName![0].parent[0].name))'s cell number" , preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            
            var intTextField = Int(textfield.text!)
            
            do {
                try self.realm.write {
                    self.selectedName![0].cellNum = intTextField!
                }
            }
            catch {
                print ("error \(error)")
            }
            
            self.loadRealm()
        }
        
        alert.addTextField { (alertTextField) in
            textfield = alertTextField
        }
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil )
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
                            self.selectedName![0].lastPaid = dubtextfiled!
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
