import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Variables and constants
    let usersTableView = UITableView()
    let tableViewCellID = "cell"
    let api = API()
    let uiConf = UIConfigurator()
    let udService = UserDefaultsService()
    var dataArray : [UserElement] = []

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUsersData()
        prepareTableView()
    }
    
    //MARK: - Prepare funcs
    func prepareTableView() {
        uiConf.tableViewConfigure(view: view, tableView: usersTableView, cellID: tableViewCellID, sender: self)
    }
    
    func prepareUsersData() {
        if let data = udService.loadUsersData() {
            dataArray = data
            usersTableView.reloadData()
        } else {
            downloadUserData()
        }
    }
    
    //MARK: - API interaction
    func downloadUserData() {
        api.fetchData { users in
            self.dataArray = users
            DispatchQueue.main.async {
                self.udService.saveUsersData(data: self.dataArray)
                self.usersTableView.reloadData()
            }
        }
    }
    

}


//MARK: - MainViewController extensions
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID)!
        
        var cellConf = cell.defaultContentConfiguration()
        
        cellConf.text = String(dataArray[indexPath.row].username)
        
        cell.contentConfiguration = cellConf
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController(user: dataArray[indexPath.row])
        present(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}



