//
//  Database.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import Foundation
import RealmSwift

extension UserDefaults {
  
  static func setFirstTimeLoaded() {
    UserDefaults.standard.set(true, forKey: "isFirstTimePassed")
  }
  
  static var isFirstTimePassed: Bool {
    return UserDefaults.standard.bool(forKey: "isFirstTimePassed")
  }
 
}

class RealmManager {
  private(set) var realm: Realm?
  
  init() {
      openRealm()
  }
  
  func openRealm() {
      do {
          let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
              if oldSchemaVersion > 1 {
                migration.enumerateObjects(ofType: Coffee.className()) { _, newObject in
                    newObject!["coffees"] = List<Coffee>()
                }
              }
          })

          Realm.Configuration.defaultConfiguration = config

          realm = try Realm()
      } catch {
          print("Error opening Realm", error)
      }
  }
}
