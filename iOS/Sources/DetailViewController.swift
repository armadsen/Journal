//
//  DetailViewController.swift
//  Journal-iOS
//
//  Created by Andrew R Madsen on 10/1/19.
//  Copyright © 2019 Open Reel Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		updateViews()
    }
    
	@IBAction func done(_ sender: Any) {
		entry?.title = titleTextField.text ?? ""
		entry?.body = bodyTextView.text ?? ""
		try! entry?.managedObjectContext?.save()
		navigationController?.popViewController(animated: true)
	}

	private func updateViews() {
		guard isViewLoaded else { return }
		titleTextField.text = entry?.title
		bodyTextView.text = entry?.body
	}

	var entry: Entry? {
		didSet {
			updateViews()
		}
	}

	@IBOutlet weak var titleTextField: UITextField!
	@IBOutlet weak var bodyTextView: UITextView!

}
