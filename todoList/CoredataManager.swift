//
//  CoredataManager.swift
//  todoList
//
//  Created by Rujin Devkota on 01/12/2022.
//

import Foundation
import CoreData

class CoreDataManager{

    let persistentContainer:NSPersistentContainer

    static let shared:CoreDataManager=CoreDataManager()

    private init() {
       persistentContainer = NSPersistentContainer(name:"todoList")
        persistentContainer.loadPersistentStores{discription,error in
            if let error = error{fatalError("enable to load data\(error)")}
        }

      let  persistentContainer = NSPersistentContainer(name:"Projects")
         persistentContainer.loadPersistentStores{discription,error in
             if let error = error{fatalError("enable to load data\(error)")}
         }
    }
}
