//
//  ApiNetwork.swift
//  UrlSessionApp
//
//  Created by Chetu on 21/01/22.
//  Copyright © 2022 Chetu. All rights reserved.
//

import Foundation


 class ApiNetwork
  {
  
   static  var  sharedInstance = ApiNetwork()
  func dataFormDerver(urlString: String , complicationHandlar : @escaping (_ resultData : Array<Any>) ->  Void )
  {
    let url_conversion  = URL( string : urlString)
    URLSession.shared.dataTask(with : url_conversion! )
    {
      (result, response, error) in
      
      let  dataresponse = [[String : Any]] ()
      
      do{
        let json = try JSONSerialization.jsonObject(with: result!, options: [])
        let conversion_data = json as! [String : Any]
        print("shashikant \(conversion_data)")
        complicationHandlar(dataresponse)
      }
        
      catch{
        print(error.localizedDescription)
        
      }
      
    }.resume()
    
  }
  
  
}
  

