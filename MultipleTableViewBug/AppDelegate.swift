
import UIKit
import Layout
import Nuke
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        LayoutNode.useLegacyLayoutMode = false
        
        window = UIWindow()
        window?.rootViewController = ExamplesViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    
}
extension UIImageView {
    
    func setImageUrl(url: String) {
        
        Nuke.loadImage(with: URL(string: "https://picsum.photos/200/300?\(url)")!, into: self)
        
        
        
    }
    
    @objc open override class var expressionTypes: [String: RuntimeType] {
        var types = super.expressionTypes
        
        types["imgUrl"] = RuntimeType(String.self)
        return types
    }
    
    @objc open override func setValue(_ value: Any, forExpression name: String) throws {
        switch name {
            
        case "imgUrl":
            var value = value as! String
            let hash = value.hashValue
            if (self.frame.size.height != 0 && self.tag != hash) {
                self.tag = hash
                setImageUrl(url: value)
            }
            
        default:
            try super.setValue(value, forExpression: name)
        }
    }
    
    
}
