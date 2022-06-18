//
//  ViewController.swift
//  sportProject
//
//  Created by Nasser Mohamed on 10/06/2022.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {
    var viewModel : HomeViewModel!
    // Modle for View
    
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeCollectionView.dataSource=self
        homeCollectionView.delegate=self
    viewModel=HomeViewModel()
       
        viewModel.bindResultToHomeView={[weak self]in
            DispatchQueue.main.async {
                self?.homeCollectionView.reloadData()
                
            }
            
        }
        viewModel.getItems()

    }


}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    /************************* CollectionView ****************************/
    //func -> numberOfItems
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.result?.count ?? 0
        
    }
    
    //func -> content
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        
        let nameSport=viewModel?.result?[indexPath.row].strSport
        let imageSport=viewModel?.result?[indexPath.row].strSportThumb
       cell.setupCell(image: imageSport ?? "", name: nameSport ?? "")
        
        return cell
    }
    // select item -> send to
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        LeaguesViewController.leaguesName=viewModel.result?[indexPath.row].strSport ?? ""
        let secondvc=self.storyboard?.instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        self.navigationController?.pushViewController(secondvc, animated: true)
//        self.pushViewController(<#T##UIViewController#>, animated: <#T##Bool#>)
//        let secondvc=storyboard?.instantiateViewController(withIdentifier:"LeagueViewController") as! LeagueViewController
//        secondvc.modalPresentationStyle = .fullScreen
//
//        present(secondvc, animated: true, completion: nil)
        
    }
    /************************ Desine CollectionView *********************/
    
    //calculate width and height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width*0.499, height:self.view.frame.width*0.5 )
    }
    
    //space between lines
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
   //minimum space between item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    /******************************************************************/
    
    
    
}

