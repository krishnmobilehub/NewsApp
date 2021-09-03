//
//  NWListTableViewCell.swift
//  NewsApp
//


import UIKit

class NWListTableViewCell: UITableViewCell {
    @IBOutlet weak var tileLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var viewModel: NWListItemViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setCellWith(article: NWListItemViewModel) {
        self.viewModel = article
        self.descriptionLabel.text = article.description
        self.dateLabel.text = article.publishedAt
        self.tileLabel.text = article.title
        guard let img = article.urlToImage else {
            return
        }
        newsImageView.setImageWith(urlString: img, placeholder: UIImage(named: "Placeholder"), imageIndicator: .gray) { (image, error) in
            if error != nil {
                self.newsImageView.image = UIImage(named: "Placeholder")
            }
        }
    }

}
