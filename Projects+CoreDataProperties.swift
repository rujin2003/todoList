//
//  Projects+CoreDataProperties.swift
//  todoList
//
//  Created by Rujin Devkota on 05/12/2022.
//
//

import Foundation
import CoreData


extension Projects {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Projects> {
        return NSFetchRequest<Projects>(entityName: "Projects")
    }

    @NSManaged public var date: Date?
    @NSManaged public var discription: String?
    @NSManaged public var language: String?
    @NSManaged public var title: String?

}

extension Projects : Identifiable {

}
