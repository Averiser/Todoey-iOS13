//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
  
  var itemArray = [Item]()
  let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
      
      print(dataFilePath)
      
//      if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//        itemArray = items
//      }
      
//      loadItems()
    }
  
  //MARK - TableView Datasource methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
    let item = itemArray[indexPath.row]
    
    cell.textLabel?.text = item.title
    
    //ternary operator condition
    // value = condition ? valueIfTrue : valueIfFalse
    
//    cell.accessoryType = item.done == true ? .checkmark : .none     or even shorter
      cell.accessoryType = item.done ? .checkmark : .none
    
    //  this five line below are exactly the same is one line above.
    
//    if item.done == true {
//      cell.accessoryType = .checkmark
//    } else {
//      cell.accessoryType = .none
//    }
    
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
    saveItems()
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  //MARK - Add New Items

  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
      //what will happen once the user clicks the Add Item button on our UIAlert
      
      let newItem = Item(context: self.context)
      newItem.title = textField.text!
      newItem.done = false
      
      self.itemArray.append(newItem)
      
      self.saveItems()
      
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new item"
      textField = alertTextField
    }
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
// MARK - Model Manipulation Methods
  
  func saveItems() {
    do {
      try context.save()
    } catch {
      print("Error saving context \(error)")
    }
    
    tableView.reloadData()
  }
  
//  func loadItems() {
//
//    if let data = try? Data(contentsOf: dataFilePath!) {
//      let decoder = PropertyListDecoder()
//      do {
//      itemArray = try decoder.decode([Item].self, from: data)
//      } catch {
//        print("Error decoding item array, \(error)")
//      }
//    }
//  }
}

