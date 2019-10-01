//
//  DebugArrayController.swift
//  Journal
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

import Cocoa

class DebugArrayController: NSArrayController {

	override func add(_ sender: Any?) {
		NSLog("add")
		super.add(sender)
	}

}
