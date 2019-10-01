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

    override func viewDidLoad() {
        super.viewDidLoad()

		handArrayControllerToChidren()
    }

	private func handArrayControllerToChidren() {
		for vc in children {
			if let sourceListVC = vc as? SourceListViewController {
				sourceListVC.entriesController = entriesController
			}

			if let detailVC = vc as? DetailViewController {
				detailVC.entriesController = entriesController
			}
		}
	}

	// MARK: - Properties

	@objc dynamic var managedObjectContext: NSManagedObjectContext!
	@IBOutlet var entriesController: NSArrayController!
}
