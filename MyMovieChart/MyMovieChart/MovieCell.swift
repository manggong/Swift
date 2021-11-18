//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by 김지환 on 2021/11/18.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var opendate: UILabel!
    @IBOutlet var rating: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var thumbnail: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
