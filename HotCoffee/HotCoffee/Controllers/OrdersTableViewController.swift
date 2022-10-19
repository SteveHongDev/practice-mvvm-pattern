//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by 홍성범 on 2022/10/18.
//

import UIKit

class OrdersTableViewController: UITableViewController {

    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        
        guard let coffeeOrdersURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else { fatalError("URL was incorrect") }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        WebService().load(resource: resource) { [weak self] result in
            
            switch result {
            case .success(let orders):
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        var content = UIListContentConfiguration.cell()
        
        content.text = vm.type
        content.secondaryText = vm.size
        
        cell.contentConfiguration = content
        
        return cell
    }

}
