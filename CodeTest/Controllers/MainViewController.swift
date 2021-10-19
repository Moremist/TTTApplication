import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Variables and constants
    let usersTableView = UITableView()
    let tableViewCellID = "cell"
    let parcer = Parcer()
    let uiConf = UIConfigurator()
    let udService = UserDefaultsService()
    var dataArray : [UserElement] = []
    
    private let urlString = "https://jsonplaceholder.typicode.com/users"

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUsersData()
        prepareTableView(tableView: usersTableView)
        
    }
    
    //MARK: - Prepare funcs
    func prepareUsersData() {
        if let loadedFromMemoryData = udService.loadUsersData() {
            dataArray = loadedFromMemoryData
            print("Users data loaded from memory")
        } else {
            downloadUsersData()
            print("Users data loaded from internet")
        }
        
    }
    
    func prepareTableView(tableView: UITableView) {
        uiConf.tableViewConfigure(tableView: usersTableView, cellID: tableViewCellID, sender: self)
    }
    
    
    //MARK: - API interaction
    func downloadUsersData() {
        parcer.fetchData(urlString: urlString) { downloadedData in
            if let downloadedData = downloadedData {
                self.dataArray = downloadedData
            }
            DispatchQueue.main.async {
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
        let vc = DetailsViewController()
        vc.currentUser = dataArray[indexPath.row]
        present(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Users"
    }

}



