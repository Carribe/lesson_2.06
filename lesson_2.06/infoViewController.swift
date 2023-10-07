//
//  infoViewController.swift
//  lesson_2.06
//
//  Created by Артём on 10.10.2023.
//

import UIKit

final class infoViewController: UIViewController {
    
    var info = "ū"

    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = info
    }
    @IBAction func cancelButtonPush() {
        dismiss(animated: true)
    }
}
