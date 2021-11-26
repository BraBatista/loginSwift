import UIKit

final class SettingsViewController: UIViewController {
    private let settingsDetailsSegue = "SettingsDetailsSegue"
    fileprivate lazy var mainView: SettingsView = SettingsView()

    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.didTapSettings = { [weak self] in
            guard let self = self else { return }
            self.performSegue(
                withIdentifier: self.settingsDetailsSegue, sender:  nil
            )
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == settingsDetailsSegue {
            let vc = segue.destination
            vc.view.backgroundColor = .red
        }
    }
}
