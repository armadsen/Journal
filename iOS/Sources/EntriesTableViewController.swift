//
//  EntriesTableViewController.swift
//  Journal-iOS
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationItem.leftBarButtonItem = self.editButtonItem

		try! fetchedResultsController.performFetch()
    }

	@IBAction func addEntry(_ sender: Any) {
		_ = Entry(context: managedObjectContext)
	}

    // MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return fetchedResultsController.fetchedObjects?.count ?? 0
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
		let entry = fetchedResultsController.object(at: indexPath)
		cell.textLabel?.text = entry.title
		return cell
	}

	// MARK: - NSFetchedResultsControllerDelegate

	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
		tableView.reloadData()
	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowDetail" {
			let detailVC = segue.destination as! DetailViewController
			if let indexPath = tableView.indexPathForSelectedRow {
				detailVC.entry = fetchedResultsController.object(at: indexPath)
			}
		}
    }

	// MARK: - Properties

	let managedObjectContext = Database.shared.mainContext

	lazy var fetchedResultsController: NSFetchedResultsController<Entry> = {
		let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
		fetchRequest.sortDescriptors = [NSSortDescriptor(key: "timestamp", ascending: false)]
		let frc = NSFetchedResultsController<Entry>(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
		frc.delegate = self
		return frc
	}()

}
