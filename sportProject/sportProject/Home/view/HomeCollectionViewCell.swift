//
//  HomeCollectionViewCell.swift
//  sportProject
//
//  Created by Nasser Mohamed on 11/06/2022.
//

import UIKit
import Kingfisher
class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportNameLable: UILabel!
    func setupCell(image:String? , name:String?){
        sportNameLable.text=name
        let url = URL(string:image ?? "")
        if (url != nil ){
            sportImage.kf.setImage(with:url)
        }else{
            sportImage.image=UIImage(named: "sportImageIcon")
        }
        
        }
    
}
