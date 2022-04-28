//  Created by Prem on 28/04/22.


import UIKit
protocol ShowQuotesScreenProtocole {
    func loadCollectionView()
}

class ShowQuotesScreenVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var displayQuoteLabel: UILabel!
    @IBOutlet weak var displayAuthorNameLabel: UILabel!
    //MARK: - Variable
    var quote = ""
    var authorName = ""
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuoteLabel.text = quote
        displayAuthorNameLabel.text = authorName
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
}
