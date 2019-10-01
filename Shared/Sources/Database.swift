//
//  Database.swift
//  Journal
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

import Foundation
import CoreData

class Database {
	static let shared = Database()

	func save() throws {
		let context = persistentContainer.viewContext

		#if os(macOS)
		if !context.commitEditing() {
			NSLog("\(NSStringFromClass(type(of: self))) unable to commit editing before saving")
		}
		#endif
		if context.hasChanges {
			try context.save()
		}
	}

	// MARK: - Properties

	lazy var persistentContainer: NSPersistentContainer = {
		/*
		The persistent container for the application. This implementation
		creates and returns a container, having loaded the store for the
		application to it. This property is optional since there are legitimate
		error conditions that could cause the creation of the store to fail.
		*/
		let container = NSPersistentContainer(name: "Journal")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

				/*
				Typical reasons for an error here include:
				* The parent directory does not exist, cannot be created, or disallows writing.
				* The persistent store is not accessible, due to permissions or data protection when the device is locked.
				* The device is out of space.
				* The store could not be migrated to the current model version.
				Check the error message to determine what the actual problem was.
				*/
				fatalError("Unresolved error \(error)")
			}
		})
		return container
	}()

	var mainContext: NSManagedObjectContext { persistentContainer.viewContext }
}
