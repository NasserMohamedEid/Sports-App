//
//  LeaguesViewController.swift
//  sportProject
//
//  Created by Nasser Mohamed on 13/06/2022.
//

import UIKit
import CoreMedia

class LeaguesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var leaguesTableView: UITableView!

    static var leaguesName:String=""
    var leaguesviewModel : LeaguesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        leaguesTableView.dataSource=self
        leaguesTableView.delegate=self

        leaguesviewModel=LeaguesViewModel()
        leaguesviewModel.bindResultToHomeView={[weak self]in
            DispatchQueue.main.async {
                self?.leaguesTableView.reloadData()
            }

        }
//        LeaguesViewController.leaguesName
        leaguesviewModel.getItems(leaguesName: LeaguesViewController.leaguesName)
        // Do any additional setup after loading the view.
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesviewModel.result?.count ?? 0
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell=tableView.dequeueReusableCell(withIdentifier: "LeaguesCell", for: indexPath)as!LeaguesTableViewCell
           let name=leaguesviewModel.result?[indexPath.row].strLeague
           ?? ""
           let picture=leaguesviewModel.result?[indexPath.row].strBadge
           ?? ""
           let youtube=leaguesviewModel.result?[indexPath.row].strYoutube
           ?? ""
           cell.setupCell(leaguesName: name, leaguesPicture: picture,stryoutube: youtube)
           cell.leaguesImage.layer.borderWidth=0.5
           cell.leaguesImage.layer.masksToBounds=false
           cell.leaguesImage.layer.cornerRadius=cell.leaguesImage.layer.frame.size.width/2
           cell.leaguesImage.clipsToBounds=true
       return cell

       }





    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         DetailsLeagueViewController.eventid=leaguesviewModel.result?[indexPath.row].idLeague ?? ""
        
        DetailsLeagueViewController.leagueName=leaguesviewModel.result?[indexPath.row].strLeague ?? ""
        DetailsLeagueViewController.leagueimage=leaguesviewModel.result?[indexPath.row].strBadge ?? ""

        let secondvc=self.storyboard?.instantiateViewController(withIdentifier: "DetailsLeagueViewController") as! DetailsLeagueViewController

        self.navigationController?.pushViewController(secondvc, animated: true)
    }
    
   
}
