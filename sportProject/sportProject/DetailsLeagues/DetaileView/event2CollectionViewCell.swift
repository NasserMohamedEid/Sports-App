//
//  event2CollectionViewCell.swift
//  sportProject
//
//  Created by Nasser Mohamed on 17/06/2022.
//

import UIKit
import Kingfisher
class Event2CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var eventimage: UIImageView!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    func setupCell(name:String?,date:String?,image:String?){
        let expiryDate = date ?? ""// Jan 10 2020

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if Date() < dateFormatter.date(from: expiryDate) ?? Date() {
            nameLable.text=name
                   dateLable.text=date
                   let url = URL(string:image ?? "")
                   if (url != nil ){
                       eventimage.kf.setImage(with:url)
                   }else{
                       eventimage.image=UIImage(named: "sportImageIcon")
                   }

        }else {
            dateLable.text="NO Football match COMING UP"
        }
        
    }
}
