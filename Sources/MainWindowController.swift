//
//  MainWindowController.swift
//  Journal
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

	@IBSegueAction func makeSplitViewController(_ coder: NSCoder) -> SplitViewController? {

		return SplitViewController(coder: coder, managedObjectContext: moc)
	}
}
