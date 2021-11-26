import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func voltarInicioLogin(_ sender: Any) {
        UserDefaults.standard.set( false, forKey: "Logado" )
        UserDefaults.standard.synchronize()
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
