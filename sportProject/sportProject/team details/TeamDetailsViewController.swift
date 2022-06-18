//
//  TeamDetailsViewController.swift
//  sportProject
//
//  Created by Nasser Mohamed on 16/06/2022.
//

import UIKit

class TeamDetailsViewController: UIViewController,DataProtocol {
    var name:String!
    var stadium:String!
    var year:String!
    var Description:String!
    var country:String!
    func getdata(name:String,stadium:String, year:String, DescriptionLabl:String,country:String) {
        
        self.name=name
        self.year=year
        self.Description=DescriptionLabl
        self.country=country
        self.stadium=stadium

    }
    

    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var countryLable: UILabel!
    @IBOutlet weak var stadiumLable: UILabel!
    @IBOutlet weak var yearLable: UILabel!
    @IBOutlet weak var DescriptionLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLable.text = name
        countryLable.text=country
        stadiumLable.text=stadium
        DescriptionLable.text=Description
        yearLable.text=year

        // Do any additional setup after loading the view.

    }
    

  

    
}

