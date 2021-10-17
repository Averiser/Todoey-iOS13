//
//  CategoryViewController.swift
//  Todoey
//
//  Created by MyMacBook on 17.10.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
  
  let itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  //MARK: - TableView Datasource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
    
    let item = itemArray[indexPath.row]
    cell.textLabel?.text = item.title
    
    return cell
  }
  
  //MARK: - Data Manipulation Methods
  
  func saveItem() {
    
  }
  
  func loadItem() {
    
  }
  
  //MARK: - Add New Categories

  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
  }
  

  
  //MARK: - TableView Delegate Methods
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }

}
