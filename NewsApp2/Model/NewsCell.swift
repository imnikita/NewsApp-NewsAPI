//
//  NewsCell.swift
//  NewsApp2
//
//  Created by Nikita Popov on 21.02.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let identifier = "NewsCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "NewsCell", bundle: nil)
    }
    
    public func configure(with title: String, autorName: String, postTime: String, imageName: String){
        titleLabel.text = title
        autorLabel.text = autorName
        titleLabel.text = postTime
        previewImage.image = UIImage(systemName: imageName)
    }
    
    @IBOutlet var previewImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var autorLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
//        previewImage.contentMode = .scaleToFit
        previewImage.layer.borderWidth = 1
        previewImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        previewImage.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3030237867)
        self.layer.cornerRadius = 8
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 4
            frame.origin.x += 4
            frame.size.width -= 2 * 6
            frame.size.height -= 2 * 3
            super.frame = frame
        }
      }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
