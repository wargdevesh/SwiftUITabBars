//
//  ApiCaller.swift
//  TabBar&ChartsSwiftUi
//
//  Created by Devesh Pandey on 26/04/24.
//

import Foundation
enum ApiErrors : Error{
    case UrlError
    case NetworkError
    case ServerError
    case ConversionError
}
class ApiCaller : NSObject{
    
    public static func getData(_ completionHandler: @escaping(_ result : Result<APIResponse,ApiErrors>) -> Void){
        
        let urlString = "https://api.inopenapp.com/api/v1/dashboardNew"
        
        guard let url = URL(string: urlString) else{
            debugPrint("URl Error is there")
            completionHandler(.failure(.UrlError))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")
        
        urlRequest.httpMethod = "get"
        URLSession.shared.dataTask(with: urlRequest) { data, networkResponse, error in
            if error == nil , let data = data{
                
                do{
                    let resultData = try JSONDecoder().decode(APIResponse.self, from: data)
                    completionHandler(.success(resultData))
                    print("Result is \(resultData)")
                }catch{
                    completionHandler(.failure(.ConversionError))
                    
                    debugPrint("Error in the decoding is \(error)")
                }
            }
            else{
                debugPrint("Error came in calling api with status code \(String(describing: networkResponse))")
                completionHandler(.failure(.ServerError))
            }
        }.resume()
       
        
    }
}
