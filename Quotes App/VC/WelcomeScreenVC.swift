//
//  WelcomeScreenVC.swift
//  Quotes App
//
//  Created by R&W on 25/04/22.
// https://type.fit/api/quotes

import UIKit
//import IQKeyboardManagerSwift

class WelcomeScreenVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var welcomeScreenImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var letsReadButton: UIButton!
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForImageView()
        setUpForButton()
    }
    //MARK: - IBActions
    @IBAction func letsReadButtonTapped(_ sender: UIButton) {
         validateTextField()
    }
    //MARK: - Initial SetUp For Image View
    private func setUpForImageView() {
        welcomeScreenImageView.layer.cornerRadius = 20
        welcomeScreenImageView.layer.masksToBounds = true
    }
    //MARK: - Initial SetUp For Button
    private func setUpForButton() {
        letsReadButton.layer.cornerRadius = 10
        letsReadButton.clipsToBounds = true
        letsReadButton.layer.masksToBounds = false
        letsReadButton.layer.shadowRadius = 3
        letsReadButton.layer.shadowOpacity = 0.5
        letsReadButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        letsReadButton.layer.shadowColor = UIColor.darkGray.cgColor
    }
    //MARK: - Show Blank TextField Alert
    private func showAlert() {
        let alert = UIAlertController(title: "Oops!", message: "You Missed To Enter Your Name", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    //MARK: - Validate Text Field
    private func validateTextField() {
        if nameTextField.text == "" {
            showAlert()
        } else {
            UserDefaults.standard.set(nameTextField.text!, forKey: "name")
            self.performSegue(withIdentifier: "Home", sender: self)
        }
    }
}
