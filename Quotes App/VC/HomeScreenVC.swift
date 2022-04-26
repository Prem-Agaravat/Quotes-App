//
//  HomeScreenVC.swift
//  Quotes App
//
//  Created by R & W on 26/04/22.
//

import UIKit

class HomeScreenVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Hi, \(UserDefaults.standard.value(forKey: "name") as! String)"
    }
}
