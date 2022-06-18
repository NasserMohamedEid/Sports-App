//
//  Sports.swift
//  sportProject
//
//  Created by Nasser Mohamed on 12/06/2022.
//

import Foundation
struct Sports:Decodable{
    var idSport:String?
    var strSport:String?
    var strFormat:String?
    var strSportThumb:String?
    var strSportIconGreen:String?
    var strSportDescription:String?
}
struct Result:Decodable{
    var sports:[Sports]?
}
