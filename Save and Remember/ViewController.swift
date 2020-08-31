//
//  ViewController.swift
//  Save and Remember
//
//  Created by Islam Hemida on 27.08.20.
//  Copyright © 2020 Islam Hemida. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var username = ""
    var password = ""
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
        
        ref.child("accounts").observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot)
        }
    }

    
    @IBOutlet weak var Username: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBAction func didTapButton(_ sender: Any){
        username = Username.text!
        password = Password.text!
        print(username)
        print(password)
        
        self.ref.child("users").child("useruid").setValue(["username": username])
        self.ref.child("users").child("useruid").setValue(["password": password])


     }
    @IBOutlet weak var Submit: UIButton!
    
    
}

