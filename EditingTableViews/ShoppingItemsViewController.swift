import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var shoppingItems: [ShoppingItem] = []
    
    @IBOutlet weak var shoppingItemsTableView: UITableView!
    

    @IBAction func editButton(_ sender: UIButton) {
        if shoppingItemsTableView.isEditing {
            sender.setTitle("Edit", for: .normal)
            shoppingItemsTableView.setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
        shoppingItemsTableView.setEditing(true, animated: true)
        }
    }
    
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shoppingItemsTableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath)
        cell.textLabel?.text = shoppingItems[indexPath.row].name
        cell.detailTextLabel?.text = String(shoppingItems[indexPath.row].price)
        return cell
    }
    
    private func loadShoppingItems() {
        let allItems = ShoppingItemFetchingClient.getShoppingItems()
        shoppingItems = allItems
    }
    
    private func configureShoppingItemsTableView() {
        shoppingItemsTableView.dataSource = self
        shoppingItemsTableView.delegate = self
    }
  


    
    override func viewDidLoad() {
        configureShoppingItemsTableView()
        loadShoppingItems()
        shoppingItemsTableView.isEditing = false //this is false by default
        super.viewDidLoad()

    }
}

