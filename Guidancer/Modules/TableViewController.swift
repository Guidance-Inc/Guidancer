//
//  TableViewController.swift
//  Guidancer
//
//

import UIKit

class TableViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Notifications"
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(label)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 41),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath) as? CustomTableViewCell else {
                                                    return UITableViewCell()
            
        }
//        cell.configure(text: "Custom + \(indexPath.row+1)",
//                       imageName: indexPath.row % 2 == 0 ? "image1" : "image2")
        cell.configure(text: "Oleg Olegich have liked your post", firstImage: "image1", secondImage: "image1")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
