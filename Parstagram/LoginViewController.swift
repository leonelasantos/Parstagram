//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Leonel Santos on 10/15/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
     @IBAction func onSignup(_ sender: Any) {
         let user = PFUser()
         user.username = usernameField.text
         user.password = passwordField.text

         user.signUpInBackground { (Success,Error) in
             if Success {
                 self.performSegue(withIdentifier: "loginSegue", sender: nil)
             } else {
                 print("Error: \(Error?.localizedDescription)")
             }
         }

     }


     @IBAction func onSignin(_ sender: Any) {
         let username = usernameField.text!
         let password = passwordField.text!
         PFUser.logInWithUsername(inBackground: username, password:password) {
           (user: PFUser?, error: Error?) -> Void in
           if user != nil {
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
             // Do stuff after successful login.
           } else {
               print("Error: \(error?.localizedDescription)")
             // The login failed. Check error to see why.
           }
         }
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
