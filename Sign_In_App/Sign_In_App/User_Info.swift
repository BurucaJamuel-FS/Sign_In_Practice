//
//  User_Info.swift
//  Sign_In_App
//
//  Created by jamuel buruca on 9/21/22.
//

import Foundation

class UserInfo{
    public  var username: String
    private  var password: String
    public var firstName: String
    public var lastName: String
    
    init(username: String, password: String, firstName: String, lastName: String){
        self.username = username
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func checkUserInfo (name: String, pass: String) -> Bool{
        
        //this will be the check and see if the user is an actual user and if their password is wrong
        if ( name == username){
            if (pass == password){
                return true
            }else{
                return false
            }
        }else{
            return false
        }
        
        
    }
    
}
