//
//  DetailsLeagueViewController.swift
//  sportProject
//
//  Created by Nasser Mohamed on 14/06/2022.
//

import UIKit
import CoreData

class DetailsLeagueViewController: UIViewController{
    
   

    
    
    @IBAction func addFavoriteButton(_ sender: UIButton) {
        /********************add to favorit***********************/
        let appDelegate=UIApplication.shared.delegate as!AppDelegate
        let viewContext=appDelegate.persistentContainer.viewContext
       guard let entity=NSEntityDescription.entity(forEntityName: "Favorits", in: viewContext)else{return}
        let favorit=NSManagedObject(entity: entity, insertInto: viewContext)
        favorit.setValue(DetailsLeagueViewController.leagueimage, forKey: "leagueImage")
        favorit.setValue(DetailsLeagueViewController.eventid, forKey: "leagueID")
        favorit.setValue(DetailsLeagueViewController.leagueName, forKey: "leagueName")
        appDelegate.saveContext()
        
    }
    @IBOutlet weak var teamCollectionView: UICollectionView!
    @IBOutlet weak var event1CollectionView: UICollectionView!
    static var eventid:String=""
    static var leagueName:String=""
    static var leagueimage:String=""
    @IBOutlet weak var event2CollectionViewModel: UICollectionView!
    var eventViewModel:EventViewModel!
    var teamsViewModel:TeamsViewModel!
    var event2ViewModel:Event2ViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /***********************teams view model *******************************/
        
                teamsViewModel=TeamsViewModel()
                teamsViewModel.bindResultToHomeView={[weak self]in
                    DispatchQueue.main.async {
                        self?.teamCollectionView.reloadData()
                    }
                }
        teamsViewModel.getItems(leaguesName: DetailsLeagueViewController.leagueName)
                
        
        event2ViewModel=Event2ViewModel()
        event2ViewModel.bindResultToHomeView={[weak self]in
            DispatchQueue.main.async {
                self?.event2CollectionViewModel.reloadData()
            }
        }
        event2ViewModel.getItems(leaguesName: DetailsLeagueViewController.eventid)
        

        eventViewModel=EventViewModel()
        eventViewModel.bindResultToHomeView={[weak self]in
            DispatchQueue.main.async {
                self?.event1CollectionView.reloadData()
            }
        }
        eventViewModel.getItems(leaguesName: DetailsLeagueViewController.eventid)
        
       
    }
    

   

}

extension DetailsLeagueViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    /********************event finshed*******************************************/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView==event1CollectionView{
            return eventViewModel.result?.count ?? 1

        }
        if collectionView==event2CollectionViewModel{
            
            return event2ViewModel.result?.count ?? 1
        }
       
            return teamsViewModel.result?.count ?? 0
      
        
        }
    
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == event1CollectionView{
                guard let cell = event1CollectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventCollectionViewCell else {return UICollectionViewCell()}
                let name=eventViewModel.result?[indexPath.row].strEvent
                let image=eventViewModel.result?[indexPath.row].strThumb
                let date=eventViewModel.result?[indexPath.row].dateEvent
                let homeScore=eventViewModel.result?[indexPath.row].intHomeScore
                let awayScore=eventViewModel.result?[indexPath.row].intAwayScore 
                cell.setupCellEvent(image: image, name: name, date: date, scoreHome: homeScore, scoreAway: awayScore)
                    return cell
    
                }
        /********************************************************/
        if collectionView == event2CollectionViewModel{
        
                    guard let cell2 = event2CollectionViewModel.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as? Event2CollectionViewCell else {return UICollectionViewCell()}
                    let name=event2ViewModel.result?[indexPath.row].strEvent
                    let image=event2ViewModel.result?[indexPath.row].strThumb
                    let date=event2ViewModel.result?[indexPath.row].dateEvent
            
                    cell2.setupCell(name: name, date: date, image: image)
                    return cell2
                }
        //******************************************************
        guard let cell3 = teamCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as? TeamsCollectionViewCell else {return UICollectionViewCell()}
                        let image=teamsViewModel.result?[indexPath.row].strTeamBadge
                        cell3.setupteam(image: image)
                        return cell3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView==event1CollectionView || collectionView==event2CollectionViewModel{
            return CGSize(width: self.view.frame.width*0.499, height:self.view.frame.width*0.5 )

        }
        
             return CGSize(width: self.view.frame.width*0.5, height:self.view.frame.width*0.8 )
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView==teamCollectionView{
            
            let secondvc=self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
            let Country=teamsViewModel.result?[indexPath.row].strCountry ?? ""
             let Team=teamsViewModel.result?[indexPath.row].strTeam ?? ""
            let FormedYear=teamsViewModel.result?[indexPath.row].intFormedYear ?? ""
            let descriptionEN=teamsViewModel.result?[indexPath.row].strDescriptionEN ?? ""
            let stadium1=teamsViewModel.result?[indexPath.row].strStadium ?? ""
            secondvc.getdata(name: Team, stadium:stadium1, year: FormedYear, DescriptionLabl: descriptionEN, country: Country)
            self.navigationController?.pushViewController(secondvc, animated: true)
        }
    }
}
