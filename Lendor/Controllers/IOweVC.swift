//
//  IOweVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/16.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit
import RealmSwift

class IOweVC: UITableViewController{
    
    let realm = try! Realm()
    
    var iOweArray: Results<IOwe>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadIOwes()
    }
    
    //MARK: - TableView Datasource Method
    //creating number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iOweArray?.count ?? 1
    }
    
    //creating cells' content
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IOweCell", for: indexPath)
        cell.textLabel?.text = iOweArray?[indexPath.row].name ?? ""
        return cell
    }

    //MARK: - TableView delegate Method
    //- animation of selected rows
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
//MARK: - Add button pressed
    @IBAction func addBTNPressed(_ sender: UIBarButtonItem) {
        
        var alertText = UITextField ()
         
        let alert = UIAlertController(title: "Add Person" , message: "Enter a person's name", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (alert) in
            //what will happen once a the Add  button is clicked on our UI Alert
            if (alertText.text != nil) {
                let newOwee = IOwe()
                newOwee.name = alertText.text!
                
                self.save(record: newOwee)
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

    func save (record: IOwe) {
        do {
            try realm.write {
                realm.add(record)
            }
        } catch {
            
        }
        tableView.reloadData()
    }
    
     //MARK: - Read from realm
    func loadIOwes(){
        iOweArray = realm.objects(IOwe.self)
        tableView.reloadData()
    }
    
    
    //MARK: -
}
