//
//  aboutViewController.swift
//  lesson_2.06
//
//  Created by Артём on 10.10.2023.
//

import UIKit

final class aboutViewController: UIViewController {
    var firstName = ""
    var secondName = ""
    var age = 0
    var country = ""
    var city = ""
    var info = ""
    var image = ""
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.image = UIImage(named: image)
        userImage.layer.cornerRadius = userImage.frame.width / 2
        firstNameLabel.text = firstName
        secondNameLabel.text = secondName
        ageLabel.text = "\(age.formatted()) years"
        countryLabel.text = country
        cityLabel.text = city
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoController = segue.destination as? infoViewController else { return }
        infoController.info = info
    }
}
