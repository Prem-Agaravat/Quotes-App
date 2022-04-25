//
//  WelcomeScreenVC.swift
//  Quotes App
//
//  Created by R&W on 25/04/22.
// https://type.fit/api/quotes

import UIKit

class WelcomeScreenVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var welcomeScreenImageView: UIImageView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpForButtons(buttons: [signUpButton,signInButton])
        setUpForImageView()
    }
    //MARK: - IBAction
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        signInButton.backgroundColor = UIColor(cgColor: CGColor(red: 220, green: 224, blue: 227, alpha: 1))
    }
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        signUpButton.backgroundColor = UIColor(cgColor: CGColor(red: 223, green: 229, blue: 246, alpha: 1))
    }
    //MARK: - Initial SetUp For Buttons
    private func setUpForButtons(buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
        }
    }
    private func setUpForImageView() {
        welcomeScreenImageView.layer.cornerRadius = 20
        welcomeScreenImageView.layer.masksToBounds = true
    }
}
