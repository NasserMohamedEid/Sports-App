//
//  DetailsModel.swift
//  sportProject
//
//  Created by Nasser Mohamed on 14/06/2022.
//

import Foundation
struct Events:Decodable{
    var idEvent:String?
    var idSoccerXML:String?
    var strEvent:String?
    var strLeague:String?
    var strSeason:String?
    var strHomeTeam:String?
    var strAwayTeam:String?
    var strStatus:String?
    var strThumb:String?
    var strTime:String?
    var intHomeScore:String?
    var intAwayScore:String?
    var dateEvent:String?
}
struct EventModel:Decodable{
    var events:[Events]?
}

