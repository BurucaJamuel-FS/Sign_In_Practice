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
                
            }
            
        }else{
            
        }
        
    }
}

