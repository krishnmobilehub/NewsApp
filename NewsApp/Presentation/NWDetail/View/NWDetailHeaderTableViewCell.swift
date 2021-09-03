//
//  NWDetailDescriptionTableViewCell.swift
//  NewsApp
//


import UIKit

class NWDetailHeaderTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureData(title: String) {
        textView.text = title
    }
}
