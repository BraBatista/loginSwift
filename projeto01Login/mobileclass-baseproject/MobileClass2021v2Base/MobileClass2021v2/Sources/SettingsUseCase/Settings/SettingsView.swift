import UIKit

final class SettingsView: UIView {
    var didTapSettings: (() -> Void)?

    private lazy var settingsDetailsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Settings Details", for: .normal)
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(
            UIColor.white.withAlphaComponent(0.3), for: .highlighted
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action: #selector(didTapSettingsButton),
            for: UIControl.Event.touchUpInside
        )
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .systemTeal
        configureLayout()
        createConstraints()
    }

    private func configureLayout() {
        addSubview(settingsDetailsButton)
    }

    private func createConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            settingsDetailsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            settingsDetailsButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            settingsDetailsButton.heightAnchor.constraint(equalToConstant: 50),
            settingsDetailsButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc private func didTapSettingsButton() {
        didTapSettings?()
    }
}
