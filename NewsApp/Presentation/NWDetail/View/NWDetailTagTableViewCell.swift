//
//  NWDetailTagTableViewCell.swift
//  NewsApp
//


import UIKit

class NWDetailTagTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var technicalButton: UIButton!
    @IBOutlet weak var regionalButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        regionalButton.layer.cornerRadius = regionalButton.frame.size.height/2
        technicalButton.layer.cornerRadius = regionalButton.frame.size.height/2
    }

}
