import UIKit

class DetailsViewController: UIViewController {
    //MARK: - Variables and constants
    var currentUser: UserElement!
    var userDataArray : [String] = []
    let detailTableView : UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    let tableViewCellID = "detailCell"
    let uiConf = UIConfigurator()

    //MARK: - Init modify
    init(user: UserElement) {
        super.init(nibName: nil, bundle: nil)
        currentUser = user
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        currentUser = API.shared.errorUser
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUserArray()
        prepareTableView()
        
    }
    
    //MARK: - Prepare funcs
    func prepareTableView() {
        uiConf.tableViewConfigure(view: view, tableView: detailTableView, cellID: tableViewCellID, sender: self)
    }
    
    func prepareUserArray() {
        userDataArray.append("Name: " + currentUser.name)
        userDataArray.append("Phone: " + currentUser.phone)
        userDataArray.append("Email: " + currentUser.email)
        userDataArray.append("Website: " + currentUser.website)
        userDataArray.append("Company: " + currentUser.company.name)
        userDataArray.append("City: " + currentUser.address.city)

    }
    
}


//MARK: - DetailsViewController extensions
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID)!
        var conf = cell.defaultContentConfiguration()
        conf.text = userDataArray[indexPath.row]
        cell.contentConfiguration = conf
        return cell
    }
    
    
}
