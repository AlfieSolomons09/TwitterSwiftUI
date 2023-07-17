//
//  ExploreViewModel.swift
//  TwitterApplication
//
//  Created by Chetan Choudhary on 14/07/23.
//

import Foundation

class ExoloreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User]{
        if searchText.isEmpty{
            return users
        }
        else{
            let lowercasedQuety = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuety) ||
                $0.fullname.lowercased().contains(lowercasedQuety)
            })
        }
    }
    
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
        }
    }
}
