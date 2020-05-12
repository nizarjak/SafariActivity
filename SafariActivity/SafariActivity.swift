import UIKit

public class SafariActivity: UIActivity {
    public var url: URL?

    public override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: "SafariActivity")
    }

    public override var activityTitle: String? {
        // load value from main bundle to enable overwriting title
        let frameworkBundle = Bundle(for: type(of: self))
        let mainBundle = Bundle.main
        let defaultString = frameworkBundle.localizedString(forKey: "open-in-safari", value: "open-in-safari", table: nil)
        return mainBundle.localizedString(forKey: "open-in-safari", value: defaultString, table: nil)
    }

    public override var activityImage: UIImage? {
        let frameworkBundle = Bundle(for: type(of: self))
        var image: UIImage?

        if let path = frameworkBundle.path(forResource: "safari", ofType: "png") {
            image = UIImage(contentsOfFile: path)
        }

        return image
    }

    public override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        for activityItem in activityItems {
            if let url = activityItem as? URL {
                if UIApplication.shared.canOpenURL(url) {
                    return true
                }
            }
        }

        return false
    }

    public override func prepare(withActivityItems activityItems: [Any]) {
        for activityItem in activityItems {
            if let url = activityItem as? URL {
                self.url = url
                break
            }
        }
    }

    public override func perform() {
        var completed = false
        
        if let url = url {
            completed = UIApplication.shared.openURL(url)
        }
        
        activityDidFinish(completed)
    }
}
