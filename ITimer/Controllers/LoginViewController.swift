
import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ErrorMessage: UILabel!
    
    let validateValue = ValidateClass()

    //MARK: - LogIn Button Pressed
    @IBAction func LoginButtonPressed(_ sender: Any) {
        if let email = Email.text, let password = Password.text {
            
            let validEmail = validateValue.isValidEmail(email)
            let validPassword = validateValue.isValidPassword(password)
            
            if validEmail && validPassword {
                LogInUser(email,password)
            }else{
                if validEmail == false {
                    ErrorMessage.text = "Invalid email address, please check the entered data"
                }else if validPassword == false {
                    ErrorMessage.text = "Invalid password"
                }else{
                    ErrorMessage.text = "Invaild data, please check if you entered everything correctly"
                }
                ErrorMessage.isHidden = false
            }
        }
    }
    
    //MARK: - LogIn User
    func LogInUser(_ email: String, _ password: String ){
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            guard let result = authResult, error == nil else {
                print("Error login user")
                return
            }
            
            let user = result.user
            print("User login: \(user)")
            self.performSegue(withIdentifier: SegueConstants.shared.loginIsDoneSegue, sender: self )
        }
    }
}

