import Foundation
import UIKit

class UIConfigurator {
    
    //MARK: - TableViewConfigure
    func tableViewConfigure<T: UIViewController & UITableViewDelegate & UITableViewDataSource>(view: UIView, tableView: UITableView, cellID: String, sender: T) {
        view.addSubview(tableView)
        tableView.delegate = sender
        tableView.dataSource = sender
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
}
