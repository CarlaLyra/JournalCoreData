//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Carla Lyra on 1/18/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: -Landing Pad
    var entry: Entry?
    
    // MARK: -Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    // MARK: -Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, body: body)
        } else {
            EntryController.shared.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    // MARK: -Update Views
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextField.text = entry.body
    }
    
    
    
}
