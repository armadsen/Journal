//
//  Entry+CoreDataClass.swift
//  Journal
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Entry)
public class Entry: NSManagedObject {
	public override func awakeFromInsert() {
		super.awakeFromInsert()
		NSLog("awake")
	}
}
