//
//  IOweVC.swift
//  Lendor
//
//  Created by Misra Ngonga on 2020/06/16.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class IOweVC: UITableViewController{
    
    private let namesArray = ["Joleen", "Olga", "Melchior"]
    
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
}
