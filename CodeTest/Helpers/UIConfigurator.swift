import Foundation
import UIKit

class UIConfigurator {
    
    //MARK: - TableViewConfigure
    func tableViewConfigure<T: UIViewController & UITableViewDelegate & UITableViewDataSource>(tableView: UITableView, cellID: String, sender: T) {
        sender.view.addSubview(tableView)
        
        tableView.delegate = sender
        tableView.dataSource = sender
        tableView.sectionHeaderHeight = 50
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: sender.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: sender.view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: sender.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: sender.view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
    }
}
