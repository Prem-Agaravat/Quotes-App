//  Created by Prem on 26/04/22.

import UIKit
//arrow.clockwise

class HomeScreenVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var quotesCollectionView: UICollectionView!
    @IBOutlet weak var nameLabel: UILabel!
    //MARK: - Variable
    var arrQuotes = [Quotes]()
    var activityIndicator: UIActivityIndicatorView!
    let noOfRows = 2
    var edgeInsert = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesCollectionView.register(UINib(nibName: "QuotesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuotesCollectionViewCell")
        setUpActivityIndicator()
        callApi()
        nameLabel.text =  "Hi, \(UserDefaults.standard.string(forKey: "name") ?? "User")"
    }
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        quotesCollectionView.isHidden = true
        callApi()
        
    }
    //MARK: - Api Call
    private func callApi() {
        activityIndicator.startAnimating()
        let url = URL(string: "https://zenquotes.io/api/quotes")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) { data, respons, error in
            do {
                let jsonData = try JSONDecoder().decode([Quotes].self, from: data!)
                self.arrQuotes = jsonData
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.quotesCollectionView.isHidden = false
                    self.quotesCollectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    //MARK: - Get ActivityIndicator
    private func getActivityIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.color = .black
        indicator.center = view.center
        return indicator
    }
    //MARK: - SetUp For Activity Indicator
    private func setUpActivityIndicator() {
        activityIndicator = getActivityIndicator()
        view.addSubview(activityIndicator)
    }
    //MARK: - Initial SetUp For Cell
    private func setUpCell(cell: QuotesCollectionViewCell) {
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
    }
    //MARK: - Navigation
    private func navigateToNextPage(index: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowQuotesScreenVC") as! ShowQuotesScreenVC
        let quote = arrQuotes[index].quote
        let authorName = arrQuotes[index].authorName
        vc.quote = quote
        vc.authorName = authorName
        navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - Collection View Delegate and Datasource Methods
extension HomeScreenVC: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrQuotes.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let quoteCell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuotesCollectionViewCell", for: indexPath) as! QuotesCollectionViewCell
        let objQuote = arrQuotes[indexPath.row]
        quoteCell.quotesLabel.text = objQuote.quote
        quoteCell.authorNameLabel.text = objQuote.authorName
        setUpCell(cell: quoteCell)
        return quoteCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         navigateToNextPage(index: indexPath.row)
    }
}
//MARK: - Collection View FlowLayOutDe
extension HomeScreenVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableSize = collectionView.frame.width - CGFloat(((noOfRows+1)*16))
        let size = availableSize/CGFloat(noOfRows)
        if indexPath.row%2 == 0 {
            return CGSize(width: size, height: 130)
        }
        return CGSize(width: size, height: size)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return edgeInsert.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return edgeInsert.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return edgeInsert
    }
}
