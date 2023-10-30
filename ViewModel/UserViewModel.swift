//
//  UserViewModel.swift
//  ProtocolOrientedProje
//
//  Created by BerkH on 30.10.2023.
//

import Foundation


class UserViewModel{
    
    //Dependency injection
    private let userService: UserService
    
    //Delegate pattern
    var output: UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers(){
        userService.fetchUser { result in
            switch result{
            case.success(let user):
                self.output?.updateView(name: user.name, username: user.username, email: user.email)
            case.failure(_):
                self.output?.updateView(name: "No user", username: "", email: "")
            }
        }
    }
    
}
