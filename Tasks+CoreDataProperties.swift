//
//  Tasks+CoreDataProperties.swift
//  todoList
//
//  Created by Rujin Devkota on 05/12/2022.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var date: Date?
    @NSManaged public var discription: String?
    @NSManaged public var priority: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?

}

extension Tasks : Identifiable {

}
