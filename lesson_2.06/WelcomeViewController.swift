//
//  WelcomeViewController.swift
//  lesson_2.06
//
//  Created by Артём on 07.10.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    var name = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Hello \(name)"
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
    }
}
