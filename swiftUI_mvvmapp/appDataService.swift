//
//  appDataService.swift
//  swiftUI_mvvmapp
//
//  Created by Alperen Kavuk on 9.10.2022.
//

import Foundation

protocol DataService{
    func getUsers(completion : @escaping ([User]) -> Void)
}

class appDataservice{
    func getUsers(completion : @escaping ([User]) -> Void){
        DispatchQueue.main.async {
            completion([
                User(id: 1, name: "kyle"),
                User(id:2, name:"jamal"),
                User(id:3, name: "lee")
            ])
        }
    }
    
}
