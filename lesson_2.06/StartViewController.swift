//
//  ViewController.swift
//  lesson_2.06
//
//  Created by Артём on 07.10.2023.
//

import UIKit

final class StartViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    private let userInfo = User()
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard passwordTextField.text == userInfo.password, userNameTextField.text == userInfo.userLoginName else {
            showAllert()
            return false
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
            super.touchesBegan(touches, with: event)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = userInfo.userFirstName
            } else if let navigationVC = viewController as? UINavigationController {
                if let aboutVC = navigationVC.topViewController as? aboutViewController {
                    aboutVC.title = "\(userInfo.userFirstName) \(userInfo.userSecondName)"
                    aboutVC.firstName = userInfo.userFirstName
                    aboutVC.secondName = userInfo.userSecondName
                    aboutVC.age = userInfo.age
                    aboutVC.country = userInfo.country
                    aboutVC.city = userInfo.city
                    aboutVC.info = userInfo.info
                    aboutVC.image = userInfo.imageOne
                }
            }
        }
    }
    
    @IBAction func showNameButton() {
        showIfForgotten(text: "Your User Name is", data: userInfo.userLoginName)
    }
    
    @IBAction func showPasswordButton() {
        showIfForgotten(text: "Your Password is", data: userInfo.password)
    }
    
    @IBAction func registrationButtonTaped() {
    }
    
    @IBAction func unwindMain(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension StartViewController {
    private func showAllert() {
        let alertController = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true) {
            self.passwordTextField.text = ""
        }
    }
    
    private func showIfForgotten(text: String, data: String) {
        let alertController = UIAlertController(title: "\(text) '\(data)'", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

