//
//  OweMeVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/14.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class OweMeVC: UITableViewController {
    
    private var namesArray = ["Misra", "Jephte", "Keren"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
//MARK: TableView Datasource Method
    //returns number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IAmOwedCell", for: indexPath)
        cell.textLabel?.text = namesArray[indexPath.row]
        return cell
        
    }

//MARK: TableView delegate Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(namesArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
//MARK: Add button pressed
     @IBAction private func addBTNPressed(_ sender: UIBarButtonItem) {
        
        var alertText = UITextField ()
         
        let alert = UIAlertController(title: "Add Person" , message: "Enter a person's name", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (alert) in
            //what will happen once a the Add  button is clicked on our UI Alert
            if (alertText.text != nil) {
                self.namesArray.append(alertText.text!)
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "John Appleseed"
            alertText = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
}


//MARK: - Add new person

