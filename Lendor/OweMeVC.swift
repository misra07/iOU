//
//  OweMeVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/14.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class OweMeVC: UITableViewController {
    
    private let namesArray = ["Misra", "Jephte", "Keren"]
    
    
    
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
    
    
     @IBAction private func addBTNPressed(_ sender: Any) {
        print("add button pressedw")
    }
    
    
    
}


//MARK: - Add new person

