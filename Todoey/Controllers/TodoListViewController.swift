//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
  
  var itemArray = [Item]()
//    ["Find Mike", "Do Shadow Boxing", "Do Chin-ups", "Do push-ups", "Do warm-up", "Find Mike2", "Do Shadow Boxing 2", "Do Chin-ups2", "Do push-ups2", "Do warm-up2", "Find Mike3", "Do Shadow Boxing3", "Do Chin-ups3", "Do push-ups3", "Do warm-up3", "Find Mike4", "Do Shadow Boxing 4", "Do Chin-ups4", "Do push-ups4", "Do warm-up4"]
  
  let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let newItem = Item()
      newItem.title = "Find Mike"
      newItem.done = true
      itemArray.append(newItem)
      
      let newItem2 = Item()
      newItem2.title = "Do Shadow Boxing"
      itemArray.append(newItem2)
      
      let newItem3 = Item()
      newItem3.title = "Do Chin-ups"
      itemArray.append(newItem3)
    }
  
  //MARK - TableView Datasource methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
    let item = itemArray[indexPath.row]
    
    cell.textLabel?.text = item.title
    
    if item.done == true {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    
    return cell
  }
  
  //MARK - TableView Delegate Methods
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print(itemArray[indexPath.row])
    
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
    //this single line above is the same/replaces the five line below.
    
//    if itemArray[indexPath.row].done == false {
//      itemArray[indexPath.row].done = true
//    } else {
//      itemArray[indexPath.row].done = false
//    }
    
    tableView.reloadData()
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  //MARK - Add New Items

  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
      //what will happen once the user clicks the Add Item button on our UIAlert
      
      let newItem = Item()
      newItem.title = textField.text!
      
      self.itemArray.append(newItem)
      
      self.defaults.set(self.itemArray, forKey: "TodoListArray")
      
      self.tableView.reloadData()
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new item"
      textField = alertTextField
    }
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  

}

