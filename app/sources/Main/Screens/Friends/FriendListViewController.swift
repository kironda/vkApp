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
    
    // MARK: - Properties
    private var friendList = FriendList([])
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
        fillData()
    }
    
    private func fillData() {
        friendList = createFriendListData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension FriendListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommonViewCell.reuseId,
                                                       for: indexPath) as? CommonViewCell,
              let friend = friendList.friendAtIndex(indexPath.row) else {
            return UITableViewCell()
        }
        
//        let model = FriendViewCellModel(friend: friend)
//        cell.configure(with: model)
        
        return cell
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

// MARK: - FillData
extension FriendListViewController {
    private func createFriendListData() -> FriendList {
        let firstPerson = Friend(id: "1",
                                 avatar: "avatar_1",
                                 firstName: "Maria",
                                 lastName: "Zvereva",
                                 homeCity: "Moscow",
                                 age: 22)
        let secondPerson = Friend(id: "2",
                                  avatar: "avatar_2",
                                  firstName: "Anna",
                                  lastName: "Tokareva",
                                  homeCity: "Voronezh",
                                  age: 27)
        let thirdPerson = Friend(id: "3",
                                 avatar: "avatar_3",
                                 firstName: "Artem",
                                 lastName: "Novikov",
                                 homeCity: "Vologda",
                                 age: 37)
        let fourthPerson = Friend(id: "4",
                                  avatar: "avatar_4",
                                  firstName: "Polina",
                                  lastName: "Starikova",
                                  homeCity: "Saint Petersburg",
                                  age: 29)
        let fifthPerson = Friend(id: "5",
                                 avatar: "avatar_5",
                                 firstName: "Evgeniy",
                                 lastName: "Ivanov",
                                 homeCity: "Bryansk",
                                 age: 34)
        return FriendList([firstPerson,
                           secondPerson,
                           thirdPerson,
                           fourthPerson,
                           fifthPerson])
    }
}
