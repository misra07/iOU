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
    
    @IBOutlet weak var searchBar: UISearchBar!
    var oweMeArray: Results<OweMe>?
    let realm = try! Realm()
    var selectedOweMe: OweMe? {
        didSet {
            sortItems()
        }
    }
    
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
    
    //MARK: -  Add new person to ralm

    func save (record: OweMe) {
        do {
            try realm.write {
                realm.add(record)
            }
        } catch {
           print("failed to write to realm \(error)")
        }
        tableView.reloadData()
    }
    
     //MARK: - read from Realm
    func loadOweMes(){
        oweMeArray = realm.objects(OweMe.self)
        sortItems()
        tableView.reloadData()
    }
    
     //MARK: - sorts loadOweMes() sorted.
    func sortItems(){
        oweMeArray = oweMeArray?.sorted(byKeyPath: "name", ascending: true)
    }
    
}

//MARK: - Searchbar delegate methods

//searchbar filtering followed by sorting of returned results
extension OweMeVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        oweMeArray = oweMeArray?.filter("name CONTAINS [cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
        tableView.reloadData()
    }
    
//when text in searchbar is cleared
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            //print("XXXXXXXXX")
            loadOweMes()
            
            //removes keyboard
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
        }
        
    }
    
}
