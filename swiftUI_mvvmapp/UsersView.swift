//
//  ContentView.swift
//  swiftUI_mvvmapp
//
//  Created by Alperen Kavuk on 9.10.2022.
//

import SwiftUI

struct UsersView: View {
    @StateObject var viewModel = ViewModel()
    
    init(viewModel:ViewModel = .init()){
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        List(viewModel.users){ user in
            Text(user.name)
        }.onAppear(perform: viewModel.getUsers)
    }
}
extension UsersView{
    class ViewModel : ObservableObject{
        @Published var users = [User]()
        let dataService : DataService
        init(dataService : DataService = appDataservice() as! DataService){
            self.dataService = dataService
        }
        func getUsers(){
            dataService.getUsers{[weak self]
                users in self?.users = users
            }
        }
        
    }
}
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: 0, name: "Dumym")
        let viewModel = UsersView.ViewModel()
        viewModel.users = [user]
        
       return  UsersView(viewModel: viewModel)
    }
}
