//
//  AfterAnalyzeVC.swift
//  WhatAmIEating
//
//  Created by Peterses on 10/05/2021.
//

import Foundation
import UIKit

class AfterAnalyzeVC: UIViewController {
    
    private var additives: [Additive]
    private var tableView: UITableView = UITableView()
    
    init(additives: [Additive]) {
        self.additives = additives
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.register(AdditivesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
}

extension AfterAnalyzeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return additives.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AdditivesTableViewCell

        cell.configure(number: additives[indexPath.row].eNumber, name: additives[indexPath.row].name, status: additives[indexPath.row].status, descriptionLabel: additives[indexPath.row].eDescription)
        return cell
    }
}
