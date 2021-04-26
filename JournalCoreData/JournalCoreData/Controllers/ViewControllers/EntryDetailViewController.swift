//
//  DetailViewController.swift
//  JournalCoreData
//
//  Created by Daniel Dickey on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    
    // MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    // MARK: - Properties
    
    var entry: Entry?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - Actions
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let newTitle = titleTextField.text, !newTitle.isEmpty,
              let newBody = bodyTextField.text, !newBody.isEmpty else {return}
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: newTitle, body: newBody)
        } else {
            EntryController.shared.createEntry(title: newTitle, body: newBody)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    // MARK: - Functions
    
    func updateViews() {
        guard let entry = entry else {return}
        
        titleTextField.text = entry.title
        bodyTextField.text = entry.body
    }

}//End of class
