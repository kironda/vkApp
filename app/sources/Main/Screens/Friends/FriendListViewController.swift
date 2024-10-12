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
    private var searchController = UISearchController(searchResultsController: nil)
    private var filteredFriendList = FriendList([])
    
    private var friendList: FriendList {
        createFriendListData()
    }
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.isActive = true
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension FriendListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredFriendList.count : friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommonViewCell.reuseId,
                                                       for: indexPath) as? CommonViewCell,
              let friend = friendList.friendAtIndex(indexPath.row) else {
            return UITableViewCell()
        }
        
        let model = FriendCellViewModel(friend: friend)
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 60.0
        return rowHeight
    }
}

// MARK: - UISearchResultsUpdating
extension FriendListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
}

// MARK: - UI
extension FriendListViewController {
    // MARK: - Settings
    private func tableViewSettings() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.sectionHeaderTopPadding = 0.0
        tableView.separatorStyle = .singleLine
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
        tableView.register(CommonViewCell.self, forCellReuseIdentifier: CommonViewCell.reuseId)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.showsCancelButton = false
        navigationItem.searchController = searchController
        
        searchController.searchBar.showsScopeBar = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        definesPresentationContext = false
        
        searchController.searchBar.searchTextField.textColor = UIColor.black
        searchController.searchBar.searchTextField.backgroundColor = UIColor.white
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
