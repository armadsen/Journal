//
//  SourceListViewController.swift
//  Journal
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

import Cocoa
import CoreData

class SourceListViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		NSLog("vdl")
    }

	@IBAction func add(_ sender: Any) {
		entriesController.add(sender)
	}

	// MARK: - Properties

	@objc dynamic var managedObjectContext: NSManagedObjectContext!

	@objc dynamic var entriesController: NSArrayController!
}
