//
//  ItunesAPIHandler.swift
//  MusicList (iOS)
//
//  Created by Dylan Nienberg on 7/8/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class ItunesAPIHandler : NSObject {
    func fetchArtistList(artistName:String, _ completion: @escaping (_ completed: Bool, _ songList:[[String:Any]]?) -> Void){
        
        let url = "https://itunes.apple.com/search?term=\(artistName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.prettyPrinted, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                completion(true, json["results"].arrayObject as? [[String:Any]])
            case .failure(let error):
                completion(false, nil)
            }
        }

    }
}
