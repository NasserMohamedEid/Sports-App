//
//  favoriteViewController.swift
//  sportProject
//
//  Created by Nasser Mohamed on 17/06/2022.
//

import UIKit
import CoreData
class favoriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let appDelegate=UIApplication.shared.delegate as!AppDelegate
    var viewContext:NSManagedObjectContext?
    var array = [NSManagedObject]()
    var favoritTableViewcell:FavoriteTableViewCell!
    @IBOutlet weak var favorittableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewContext=appDelegate.persistentContainer.viewContext
        favorittableView.dataSource=self
        favorittableView.delegate=self
       
        getdata()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getdata()
        self.favorittableView.reloadData()
    }
   
    
    func getdata(){
        viewContext=appDelegate.persistentContainer.viewContext
      
        guard let viewContext=viewContext else{return}
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "Favorits")
        do{
            array = try viewContext.fetch(fetchRequest)
            
        }catch let error as NSError{
            print(error.localizedDescription)
            }
        self.favorittableView.reloadData()
//        print(array.last?.value(forKey: "leagueName") ?? "no");
       
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell=tableView.dequeueReusableCell(withIdentifier: "favoritCell", for: indexPath)as! FavoriteTableViewCell
            
            let name=array[indexPath.row].value(forKey:"leagueName") as! String
          
            let image=array[indexPath.row].value(forKey:"leagueImage") as? String
            
            
          
            cell.setupcell1(name: name, image: image)
            cell.imageLable.layer.borderWidth=0.5
            cell.imageLable.layer.masksToBounds=false
            cell.imageLable.layer.cornerRadius=cell.imageLable.layer.frame.size.width/2
            cell.imageLable.clipsToBounds=true
            return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            var height:CGFloat = CGFloat()
        height=70
            return height
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        DetailsLeagueViewController.eventid=array[indexPath.row].value(forKey: "leagueID") as! String
        
        DetailsLeagueViewController.leagueName=array[indexPath.row].value(forKey: "leagueName") as! String
       

        let secondvc=self.storyboard?.instantiateViewController(withIdentifier: "DetailsLeagueViewController") as! DetailsLeagueViewController

        self.navigationController?.pushViewController(secondvc, animated: true)
    }
}
