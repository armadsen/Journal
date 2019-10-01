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

	init?(coder: NSCoder, managedObjectContext: NSManagedObjectContext) {
		self.managedObjectContext = managedObjectContext
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		fatalError()
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

	// MARK: - Properties

	dynamic private var managedObjectContext: NSManagedObjectContext

}
