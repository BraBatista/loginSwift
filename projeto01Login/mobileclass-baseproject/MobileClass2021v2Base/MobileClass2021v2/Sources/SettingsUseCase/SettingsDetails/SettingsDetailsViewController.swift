import UIKit

final class SettingsDetailsViewController: UIViewController {
    static let cornerRadius: CGFloat = 25

    fileprivate lazy var mainView: SettingsView = SettingsView()

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingsViewController: UIViewControllerTransitioningDelegate {

}
