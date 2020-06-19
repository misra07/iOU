//
//  IOweVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/16.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class IOweVC: UITableViewController{
    
    private var namesArray = ["Joleen", "Olga", "Melchior"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IOweCell", for: indexPath)
        cell.textLabel?.text = namesArray[indexPath.row]
        return cell
    }
    
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
