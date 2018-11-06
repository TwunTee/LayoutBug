//  Copyright © 2017 Schibsted. All rights reserved.

import UIKit
import Layout

class ExamplesViewController: UIViewController, LayoutLoading, UITabBarControllerDelegate {
    private var selectedTab = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Swift 3.x compatibility
        #if swift(>=4.2)
            let foregroundColorKey = NSAttributedString.Key.foregroundColor
        #elseif swift(>=4)
            let foregroundColorKey = NSAttributedStringKey.foregroundColor
        #else
            let foregroundColorKey = NSForegroundColorAttributeName
        #endif

        loadLayout(
            named: "Sample.xml"
        )
    }

    func layoutDidLoad(_ layoutNode: LayoutNode) {
        guard let tabBarController = layoutNode.viewController as? UITabBarController else {
            return
        }

        tabBarController.selectedIndex = selectedTab
        tabBarController.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let index = tabBarController.viewControllers?.index(of: viewController) else {
            return
        }
        selectedTab = index
    }
}
