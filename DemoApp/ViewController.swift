import UIKit
import SafariActivity

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var actionBarButtonItem: UIBarButtonItem!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let URL = NSURL(string: "https://google.com")!
        let request = NSURLRequest(URL: URL)
        webView.loadRequest(request)
    }
    
    @IBAction func showActivityViewController() {
        if let URL = webView.request?.URL {
            let activity = SafariActivity()
            let viewController = UIActivityViewController(activityItems: [URL], applicationActivities: [activity])
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        actionBarButtonItem.enabled = true
    }
}
