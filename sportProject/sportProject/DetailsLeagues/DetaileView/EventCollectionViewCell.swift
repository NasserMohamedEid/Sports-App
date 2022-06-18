//
//  EventCollectionViewCell.swift
//  sportProject
//
//  Created by Nasser Mohamed on 14/06/2022.
//

import Foundation
import Kingfisher
class EventCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var scoreAwayLable: UILabel!
    @IBOutlet weak var scoreHomeLable: UILabel!
    @IBOutlet weak var dateEvent: UILabel!
    @IBOutlet weak var nameEvent: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    func setupCellEvent(image:String? , name:String?,date:String?,scoreHome:String?,scoreAway:String?){
        let expiryDate = date ?? ""// Jan 10 2020

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if Date() > dateFormatter.date(from: expiryDate) ?? Date() {
            nameEvent.text=name
            dateEvent.text=date
            scoreAwayLable.text=scoreAway
            scoreHomeLable.text=scoreHome
            let url = URL(string:image ?? "")
            if (url != nil ){
                eventImage.kf.setImage(with:url)
            }else{
               eventImage.image=UIImage(named: "sportImageIcon")
            }}
               
    }
}
