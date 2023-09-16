
import Foundation
import UIKit

class CongratsViewController: UIViewController {
    let constant = Constants()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func StartButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: constant.doneToMainSegue, sender: self)
    }
}
