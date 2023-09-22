
import Foundation
import UIKit

class CongratsViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    //MARK: - StartButton Pressed
    @IBAction func StartButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: SegueConstants.shared.doneToMainSegue, sender: self)
    }
}
