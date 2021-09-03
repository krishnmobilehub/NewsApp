//
//  NWDetailmageTableViewCell.swift
//  NewsApp
//


import UIKit

class NWDetailmageTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureData(url: String) {
        newsImageView.setImageWith(urlString: url, placeholder: UIImage(named: "Placeholder"), imageIndicator: .gray) { (image, error) in
            if error != nil {
                self.newsImageView.image = UIImage(named: "Placeholder")
            }
        }
    }

}
