//
//  LeaguesTableViewCell.swift
//  sportProject
//
//  Created by Nasser Mohamed on 13/06/2022.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    var urlYoutube:String?
    @IBOutlet weak var leaguesImage: UIImageView!
    @IBOutlet weak var leaguesNameLable: UILabel!
 
    @IBAction func YoutubeButton(_ sender: UIButton) {
      
        guard let url1=URL(string:"https://"+(urlYoutube ?? "") ) else {return}
        UIApplication.shared.open(url1)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(leaguesName:String,leaguesPicture:String,stryoutube:String){
        leaguesNameLable.text=leaguesName
        let url = URL(string:leaguesPicture )
        if (url != nil ){
            leaguesImage.kf.setImage(with:url)
        }else{
            leaguesImage.image=UIImage(named: "sportImageIcon")
        }
        urlYoutube=stryoutube
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
