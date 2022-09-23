//
//  ViewController.swift
//  Sign_In_App
//
//  Created by jamuel buruca on 9/21/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //this is an array for the users info
    var users: [String: UserInfo] = [:]
    
    //this will be the true false statement for the signin and signup button so the submit button knows which is which
    var signingIN = false
    
    //here i will have the outlets for the textFields
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var passwordReenter: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
   
    //these are the buttons outlets
    @IBOutlet weak var signInOut: UIButton!
    @IBOutlet weak var signUpOut: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        password1.isSecureTextEntry = true
        passwordReenter.isSecureTextEntry = true
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

//this will be the action for the sign up and sign in feature
    //i will use a tag to seprate the buttons
    @IBAction func SignINSignUp(_ sender: UIButton) {
        switch(sender.tag){
        case 0:
            //this changes the buttons selected
            signInOut.isSelected = true
            signUpOut.isSelected = false
            
            passwordReenter.isHidden = true
            firstName.isHidden = true
            lastName.isHidden = true
            //this will change the is signing in to true
            signingIN = true
            
            break
        case 1:
            //this changes the buttons selected
            signInOut.isSelected = false
            signUpOut.isSelected = true
            
            passwordReenter.isHidden = false
            firstName.isHidden = false
            lastName.isHidden = false
            
            signingIN = false
            
            
            break
        default:
            print("there was an error somewhere")
        }
    }
    
    
    //this will be where i will have the compete sign in or sign up
    @IBAction func Submit(_ sender: UIButton) {
        
        //this will check and see if the user is signin in or signing up
        if(signingIN){
            
            if let name = userName.text{
                if (users[name] != nil){
                    if let pass = password1.text{
                        if(users[name]?.checkUserInfo(name: name, pass: pass) != nil){
                            //this checks the users for thier password and signs them in
                            show(alertMessage(message: "Welcome Back \(name)"), sender: nil)
                            userName.text = ""
                            password1.text = ""
                        }else{
                            //this will the the user that they put in the wrong password
                            show(alertMessage(message: "Wrong password"), sender: nil)
                            password1.text = ""
                        }
                    }
                }else{
                    show(alertMessage(message: "There are no users by the username \(name) please create an account"), sender: nil)
                    print("There is noone here")
                    userName.text = ""
                    password1.text = ""
                }
            }
            
        }else{
            //here is where i will create the user
           
            if let name = userName.text, let pass = password1.text, let passcheck = passwordReenter.text, let fName = firstName.text, let lName = lastName.text{
                if (pass == passcheck){
                    users[name] = UserInfo(username: name, password: pass, firstName: fName, lastName: lName)
                }else{
                    show(alertMessage(message: "the passwords dont match please reenter passwords"), sender: nil)
                    password1.text = ""
                    passwordReenter.text = ""
                    print("passwords dont match")
                    
                }
                print("succses there is now \(users.count) users ")
                
                userName.text = ""
                password1.text = ""
                passwordReenter.text = ""
                firstName.text = ""
                lastName.text = ""
                
                //here i will give the user feedback on the fact that they created a user
                show(alertMessage(message: "Welcom \(name) to the sign in app"), sender: nil)
                
            }else{
                print("please dont leave any field blank")
            }
            
        }
        
    }
    
    
    func alertMessage (message: String) -> UIAlertController{
        
        //this will be a basic
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default)
        alert.addAction(okay)
        
        return alert
        
    }
}

