//
//  NotificationController.swift
//  Guidancer
//
//

import UIKit

protocol NotificationRouterDelegate: AnyObject {
    func didSelect(_ viewController: NotificationViewController)
}

fileprivate let cellIdentifier = "Cell"

final class NotificationViewController: UIViewController, ViewControllerProtocol, UITableViewDelegate {
    
    var routerDelegate: NotificationRouterDelegate?
    
    let label = UILabel()

    let table = UITableView()
    let dataSource = ViewControllerDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configUI()
        table.dataSource = dataSource

    }
    
    func configUI() {
        configLabel()
        configTableView()
    }
    
    func configLabel() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Notifications"
        label.font = UIFont.boldSystemFont(ofSize: 21)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }

    func configTableView() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 41),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

class ViewControllerDataSource: NSObject, UITableViewDataSource {
    
    let arr = ["12", "11","10","9","8","7","6","5","4","2"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return arr.count
        } else if section == 1 {
            return 3
        } else {
            return 5
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        var content = cell!.defaultContentConfiguration()
        content.text = arr[indexPath.row]
        cell!.contentConfiguration = content
        if indexPath.section == 0 {
            cell?.backgroundColor = .darkGray
        } else if indexPath.section == 1 {
            cell?.backgroundColor = .blue
        } else {
            cell?.backgroundColor = .red
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "first"
        case 1:
            return "second"
        default:
            return "third"
        }
    }
}
