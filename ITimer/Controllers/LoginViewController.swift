
import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    var constant = Constants()
    var isLogginIn: Bool{
        get{
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isLogginIn{
            self.performSegue(withIdentifier: self.constant.loginIsDoneSegue, sender: self)
            print(self.isLogginIn)
        }
    }
    
    @IBAction func LoginButtonPressed(_ sender: Any) {
        if let email = Email.text, let password = Password.text {
            
            let correctEmail =  email.contains("@") && email.contains(".")
            var correctPassword: Bool {
                if (password.count >= 8 && password.count <= 20){
                    return password.containsSpecialCharacter
                }else {
                    return false
                }
            }
            
            if  correctEmail && correctPassword {
    
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    guard let result = authResult, error == nil else {
                        print("Error login user")
                        return
                    }
                    let user = result.user
                    print("User login: \(user)")
                    self.performSegue(withIdentifier: self.constant.loginIsDoneSegue, sender: self )
                    self.isLogginIn = true
                    
                }
            }else {
                if correctEmail == false {
                    ErrorMessage.text = "Invalid email address, please check the entered data"
                }else if correctPassword == false {
                    ErrorMessage.text = "Invalid password"
                }else{
                    ErrorMessage.text = "Invaild data, please check if you entered everything correctly"
                }
                ErrorMessage.isHidden = false
            }
        }
    }
}


