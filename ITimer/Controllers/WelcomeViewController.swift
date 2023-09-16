
import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var ITimerLabel: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ITimerLabel.text = ""
        var charIndex = 0.0
        let titleText = "ITimer"
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.15 * charIndex, repeats: false) { (timer) in
                self.ITimerLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
}

extension String {
   var containsSpecialCharacter: Bool {
      let regex = ".*[^A-Za-z0-9].*"
      let testString = NSPredicate(format:"SELF MATCHES %@", regex)
      return !testString.evaluate(with: self)
   }
}
