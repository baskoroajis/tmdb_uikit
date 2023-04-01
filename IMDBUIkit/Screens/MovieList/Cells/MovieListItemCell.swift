//
//  MovieListItemCell.swift
//  IMDBUIkit
//
//  Created by Baskoro on 17/03/23.
//

import UIKit

class MovieListItemCell: UITableViewCell {
    
    @IBOutlet weak var textDescription:UILabel!
    @IBOutlet weak var imageThumbnail:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(data:Movie){
//        textDescription.text = data.overview
        let imageFullUrl = ImageUrl.getPosterImageUrl(posterPath: data.posterPath)
//        print("image Full url ", imageFullUrl)
        imageThumbnail.loadFrom(URLAddress: imageFullUrl)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

