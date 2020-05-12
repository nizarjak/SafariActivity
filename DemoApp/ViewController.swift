import UIKit
import SafariActivity

class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .action, target: self, action: #selector(sharePressed))
    }

    @objc private func sharePressed() {
        if let url = URL(string: "https://www.google.com") {
            let activity = SafariActivity()
            let viewController = UIActivityViewController(activityItems: [url], applicationActivities: [activity])
            present(viewController, animated: true, completion: nil)
        }
    }
}
