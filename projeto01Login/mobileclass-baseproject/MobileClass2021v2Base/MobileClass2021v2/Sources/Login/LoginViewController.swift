import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    	    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if (UserDefaults.standard.bool(forKey: "Logado") == true) {
            performSegue( withIdentifier: "LoginTabBarSegue", sender: nil )
        }
    }
    
    
    @IBAction func touchEntrar(_ sender: Any) {
        if self.emailTextField.validarEmail() && self.senhaTextField.validarSenha() {
            UserDefaults.standard.set( true, forKey: "Logado" )
            UserDefaults.standard.synchronize()
            
            performSegue( withIdentifier: "LoginTabBarSegue", sender: nil )
            
        } else {
            self.exibirAlert( titulo: "Email e/ou senha inválidos!" )
        }
            
    }
    
    func exibirAlert( titulo: String ) {
        let alertController = UIAlertController( title: titulo, message: nil, preferredStyle: .alert )
        let okButton = UIAlertAction( title: "OK", style: .default, handler: nil )
        alertController.addAction( okButton )
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension UITextField {
    
    func validarEmail() -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate( format:"SELF MATCHES %@", emailRegex )
        
        return emailPred.evaluate( with: self.text )
    }
    
    func validarSenha() -> Bool {
        
        let senhaRegex = ".{4,}"
        let senhaPred = NSPredicate( format:"SELF MATCHES %@", senhaRegex )
        
        return senhaPred.evaluate( with: self.text )
    }
    
    
    
}
