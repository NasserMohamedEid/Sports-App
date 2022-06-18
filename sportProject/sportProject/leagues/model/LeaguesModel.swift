//
//  LeaguesModel.swift
//  sportProject
//
//  Created by Nasser Mohamed on 13/06/2022.
//

import Foundation
struct Countrie : Decodable{
    var idLeague: String?
    var idSoccerXML:String?
    var idAPIfootball:String?
    var strSport:String?
    var strLeague:String?
    var strLeagueAlternate:String?
    var strYoutube:String
    var strWebsite:String
    var strBadge:String?
    
}
struct Leagues:Decodable{
    var countries:[Countrie]?
    
}
