//
//  TeamsCollectionViewCell.swift
//  sportProject
//
//  Created by Nasser Mohamed on 16/06/2022.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var teamImage: UIImageView!
    func setupteam(image:String?){
      
        let url = URL(string:image ?? "" )
        if (url != nil ){
            teamImage.kf.setImage(with:url)
        }else{
            teamImage.image=UIImage(named: "sportImageIcon")
        }
    }
}
