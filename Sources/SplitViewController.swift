//
//  SplitViewController.swift
//  Journal
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

import Cocoa
import CoreData

class SplitViewController: NSSplitViewController {

	init?(coder: NSCoder, managedObjectContext: NSManagedObjectContext) {
		self.managedObjectContext = managedObjectContext
		super.init(coder: coder)
	}

	required init?(coder: NSCoder) {
		managedObjectContext = NSManagedObjectContext()
		super.init(coder: coder)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }

	@IBSegueAction
	func makeSourceListViewController(coder: NSCoder) -> SourceListViewController? {
		SourceListViewController(coder: coder, managedObjectContext: managedObjectContext)
	}

	@IBSegueAction
	func makeDetailViewController(coder: NSCoder) -> DetailViewController? {
		DetailViewController(coder: coder, managedObjectContext: managedObjectContext)
	}

	private var managedObjectContext: NSManagedObjectContext
    
}
