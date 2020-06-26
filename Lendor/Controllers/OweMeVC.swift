//
//  OweMeVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/14.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit
import RealmSwift

class OweMeVC: UITableViewController {
    
    let realm = try! Realm()
    
    var oweMeArray: Results<OweMe>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadOweMes()
    }
    
//MARK: - TableView Datasource Method
    //creating number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oweMeArray?.count ?? 1
    }
    
    //creating cells' content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IAmOwedCell", for: indexPath)
        cell.textLabel?.text = oweMeArray?[indexPath.row].name ?? ""
        return cell
    }

//MARK: - TableView delegate Method
    //- animation of selected rows
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(oweMeArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//MARK: - Add button pressed
     @IBAction private func addBTNPressed(_ sender: UIBarButtonItem) {
        
        var alertText = UITextField ()
         
        let alert = UIAlertController(title: "Add Person" , message: "Enter a person's name", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (alert) in
            //what will happen once a the Add  button is clicked on our UI Alert
            if (alertText.text != nil) {
                let newOwer = OweMe()
                newOwer.name = alertText.text!
                
                self.save(record: newOwer)
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "John Appleseed"
            alertText = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - "save() Add new person

    func save (record: OweMe) {
        do {
            try realm.write {
                realm.add(record)
            }
        } catch {
            
        }
        tableView.reloadData()
    }
    
     //MARK: - read from Realm
    func loadOweMes(){
        oweMeArray = realm.objects(OweMe.self)
        tableView.reloadData()
    }
    
    //MARK: -

    
}


