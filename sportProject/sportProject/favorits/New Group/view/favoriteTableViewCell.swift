//
//  favoriteTableViewCell.swift
//  sportProject
//
//  Created by Nasser Mohamed on 17/06/2022.
//

import UIKit
import Kingfisher
class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLable: UIImageView!
    @IBOutlet weak var nameLeagueLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupcell1(name:String?,image:String?){
        nameLeagueLable.text=name
        let url = URL(string:image ?? "")
        if (url != nil ){
            imageLable.kf.setImage(with:url)
        }else{
            imageLable.image=UIImage(named: "sportImageIcon")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
