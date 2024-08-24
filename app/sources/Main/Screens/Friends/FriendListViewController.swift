//
//  FriendListViewController.swift
//  VkApp
//
//  Created by Mac on 16.08.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {
    // MARK: - UI
    private lazy var tableView: UITableView = {
        tableViewSettings()
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension FriendListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        }
}

// MARK: - UI
extension FriendListViewController {
    // MARK: - Settings
    private func tableViewSettings() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.sectionHeaderTopPadding = 0.0
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }
    
    // MARK: - Configure
    private func configureUI() {
        setupTableView()
    }
    
    // MARK: - Setups
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
