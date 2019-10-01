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

        let splitVC = contentViewController as! SplitViewController
		splitVC.managedObjectContext = Database.shared.mainContext
    }
}
