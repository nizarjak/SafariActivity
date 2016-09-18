import UIKit

public class SafariActivity: UIActivity {
    public var URL: URL?

    public override var activityType: UIActivityType? {
        return UIActivityType(rawValue: "SafariActivity")
    }

    public override var activityTitle: String? {
        // load value from main bundle to enable overwriting title
        let frameworkBundle = Bundle(for: type(of: self))
        let mainBundle = Bundle.main
        let defaultString = frameworkBundle.localizedString(forKey: "Open in Safari", value: "Open in Safari", table: nil)
        return mainBundle.localizedString(forKey: "Open in Safari", value: defaultString, table: nil)
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
        var canPerform = false
        
        for activityItem in activityItems {
            if let URL = activityItem as? URL {
                if UIApplication.shared.canOpenURL(URL) {
                    canPerform = true
                    break
                }
            }
        }
        
        return canPerform
    }

    public override func prepare(withActivityItems activityItems: [Any]) {
        for activityItem in activityItems {
            if let URL = activityItem as? URL {
                self.URL = URL
                break
            }
        }
    }

    public override func perform() {
        var completed = false
        
        if let URL = URL {
            completed = UIApplication.shared.openURL(URL)
        }
        
        activityDidFinish(completed)
    }
}
