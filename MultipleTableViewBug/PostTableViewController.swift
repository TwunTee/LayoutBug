//  Copyright © 2017 Schibsted. All rights reserved.

import UIKit
import Layout


class PostTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView? {
        didSet {
            tableView?.registerLayout(
                named: "PostTableCellView.xml",
                forCellReuseIdentifier: "standCell"
            )
        }
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 500
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection _: Int) -> UIView? {
        let node = tableView.dequeueReusableHeaderFooterNode(withIdentifier: "templateHeader")
        return node?.view as? UITableViewHeaderFooterView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "standCell"
        let node = tableView.dequeueReusableCellNode(withIdentifier: identifier, for: indexPath)

        node.setState([
            "row": indexPath.row,
   
        ])

        return node.view as! UITableViewCell
    }
}
