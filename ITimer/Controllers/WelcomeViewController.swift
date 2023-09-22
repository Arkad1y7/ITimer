
import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var ITimerLabel: UITextField!
    
    //MARK: - HiddenNavBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    //MARK: - StartScreen
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
    //MARK: - StringContains
extension String {
   var containsSpecialCharacter: Bool {
      let regex = ".*[^A-Za-z0-9].*"
      let testString = NSPredicate(format:"SELF MATCHES %@", regex)
      return !testString.evaluate(with: self)
   }
}
