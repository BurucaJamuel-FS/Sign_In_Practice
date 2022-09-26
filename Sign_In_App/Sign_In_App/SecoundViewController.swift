//
//  SecoundViewController.swift
//  Sign_In_App
//
//  Created by jamuel buruca on 9/25/22.
//

import UIKit

class SecoundViewController: UIViewController {
    
    //this is going to be the passed on user
    var signedInUser: UserInfo?

    @IBOutlet weak var fullNamelabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //this is going to make sure their is a user to fill the info 
        if let user = signedInUser {
            print(user.getFullName())
            
            fullNamelabel.text = user.getFullName()
            userNameLabel.text = user.username
        }
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
