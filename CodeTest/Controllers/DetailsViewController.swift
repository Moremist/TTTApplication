import UIKit

class DetailsViewController: UIViewController {
    //MARK: - Variables and constants
    var currentUser: UserElement?
    var userDataArray : [String] = []
    let detailTableView : UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    let tableViewCellID = "detailCell"
    let uiConf = UIConfigurator()
    
    let errorUser = UserElement(id: 0, name: "Error", username: "Error", email: "Error", address: Address(street: "Error", suite: "Error", city: "Error", zipcode: "Error", geo: Geo(lat: "Error", lng: "Error")), phone: "Error", website: "Error", company: Company(name: "Error", catchPhrase: "Error", bs: "Error"))

    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUserArray()
        prepareTableView()
        
    }
    
    //MARK: - Prepare funcs

    func prepareUserArray() {
        let currentUser = currentUser ?? errorUser
        userDataArray.append("Username: " + currentUser.username)
        userDataArray.append("Name: " + currentUser.name)
        userDataArray.append("Phone: " + currentUser.phone)
        userDataArray.append("Email: " + currentUser.email)
        userDataArray.append("Website: " + currentUser.website)
        userDataArray.append("Company: " + currentUser.company.name)
        userDataArray.append("City: " + currentUser.address.city)

    }
    
    func prepareTableView() {
        uiConf.tableViewConfigure(tableView: detailTableView, cellID: tableViewCellID, sender: self)
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Data"
    }

}
