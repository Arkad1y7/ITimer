
import Foundation
import UIKit

class BoardMainViewController : UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = "Hi"
        return cell
    }
    @IBAction func LogOutPressed(_ sender: Any) {
        
    }
}
