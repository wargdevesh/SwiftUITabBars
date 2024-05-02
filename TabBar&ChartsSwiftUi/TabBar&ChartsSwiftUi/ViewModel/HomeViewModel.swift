//
//  HomeViewModel.swift
//  TabBar&ChartsSwiftUi
//
//  Created by Devesh Pandey on 28/04/24.
//

import Foundation


final class HomeViewModel : ObservableObject{
    @Published var mainData : APIResponse?
    @Published var isLoading  = false
    
    func getData(){
       self.isLoading = true
        ApiCaller.getData {[self] result in
            self.isLoading = false
            switch result{
            case .success(let data):
                do{
                    DispatchQueue.main.async {
                        self.mainData = data
                     
                    }
                    debugPrint("data from the server is \(data)")
                }
            case .failure(let error):
                do{
                    debugPrint("The error is \(error)")
                }
            }
           // self?.isLoading = false
        }
    }
     
    
}
