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
    
    @IBOutlet weak var searchBar: UISearchBar!
    var iOweArray: Results<IOwe>?
    let realm = try! Realm()
    var selectedIOwe: IOwe? {
        didSet{
            sortItems()
        }
    }
    
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
            print("failed to write to realm \(error)")
        }
        tableView.reloadData()
    }
    
     //MARK: - Read from realm
    func loadIOwes(){
        iOweArray = realm.objects(IOwe.self)
        tableView.reloadData()
    }
    
    
  //MARK: - sorts loadOweMes() sorted.
 func sortItems(){
     iOweArray = iOweArray?.sorted(byKeyPath: "name", ascending: true)
    }
    
}

//MARK: - Searchbar delegate methods

//searchbar filtering followed by sorting of returned results
extension IOweVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        iOweArray = iOweArray?.filter("name CONTAINS [cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
        tableView.reloadData()
    }
//when text in searchbar is cleared
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            //
            //print("XXXXXXXXX")
            loadIOwes()
            
            
            //removes keyboard
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
        }
        
    }
    
}
