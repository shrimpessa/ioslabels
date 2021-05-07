//
//  ViewController.swift
//  ioslabels
//
//  Created by Ксюся on 07.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchButton.setTitle("Search", for: UIControl.State.normal)
        resultLabel.text = "Место для результата поиска"
    }
    
    @IBAction func onSearchButtonPress(_ sender: Any) {
        let container = Container()
        var key: String? = nil
        var language: String? = nil
        
        if keyTextField.text == "" {key = nil} else { key = keyTextField.text }
        if languageTextField.text == "" {language = nil} else { language = languageTextField.text }
        
        resultLabel.text = container.search.search(key: key, language: language)
    }
    
}

