//
//  teamModel.swift
//  sportProject
//
//  Created by Nasser Mohamed on 16/06/2022.
//

import Foundation
struct Teams:Decodable{
    var idTeam:String
    var strTeam: String?
    var intFormedYear:String
    var idLeague:String
    var strFacebook:String
    var strDescriptionEN: String
    var strCountry:String
    var strTeamBadge:String
    var strYoutube: String
    var strStadium:String
}
struct TeamsModel:Decodable{
    var teams:[Teams]
}
