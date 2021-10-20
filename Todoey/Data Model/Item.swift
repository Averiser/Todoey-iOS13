//
//  Item.swift
//  Todoey
//
//  Created by MyMacBook on 20.10.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
  @objc dynamic var title: String = ""
  @objc dynamic var done: Bool = false
  var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
