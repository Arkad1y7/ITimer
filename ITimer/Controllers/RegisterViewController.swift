
import Foundation
import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var Nickname: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    var constant = Constants()
    
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        if let nickname = Nickname.text, let email = Email.text, let password = Password.text {
            
            let correctEmail =  email.contains("@") && email.contains(".")
            var correctPassword: Bool {
                if (password.count >= 8 && password.count <= 20){
                    return password.containsSpecialCharacter
                }else {
                    return false
                }
            }
            
            if  correctEmail && correctPassword, nickname != "" {
                
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    guard let result = authResult, error == nil else {
                        print("Error creating user")
                        return
                    }
                    let user = result.user
                    print("Created User: \(user)")
                    self.performSegue(withIdentifier: self.constant.registrationIsDoneSegue, sender: self )
                }
            }else {
                if correctEmail == false {
                    ErrorMessage.text = "Invalid email address, please check the entered data"
                }else if correctPassword == false {
                    ErrorMessage.text = "Invalid password, please check the entered data for the number (~8) and do not use characters (';','!','@' etc.)"
                }else if nickname == ""{
                    ErrorMessage.text = "Please enter a nickname"
                }else{
                    ErrorMessage.text = "Invaild data, please check if you entered everything correctly"
                }
                ErrorMessage.isHidden = false
            }
        }
    }
}
