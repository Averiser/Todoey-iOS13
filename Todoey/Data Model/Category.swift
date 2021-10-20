//
//  Category.swift
//  Todoey
//
//  Created by MyMacBook on 20.10.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
  
  @objc dynamic var name: String = ""
  let items = List<Item>()  
}
