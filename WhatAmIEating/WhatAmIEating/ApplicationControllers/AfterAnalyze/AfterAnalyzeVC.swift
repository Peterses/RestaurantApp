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
//        cell.configure(number: "E150d", name: "Karmel amoniakalno-siarczynowy", status: "Zaakceptowany w EU. Zaakceptowany w US.", descriptionLabel: "Karmel amoniakalno-siarczynowy jest barwnikiem spożywczym. Wszystkie karmele dzieli się na cztery klasy w odniesieniu do reagentów użytych w czasie produkcji, a amoniakalno-siarczynowy zaliczany jest do klasy IV. Barwnik ten jako dodatek do żywności oznaczany jest symbolem E150d. Karmel amoniakalny wytwarza się poprzez ogrzewanie węglowodanów (cukrów prostych: glukozy i fruktozy lub ich polimerów) w obecności siarczynów i związków amoniaku.")
//        
        cell.configure(number: additives[indexPath.row].eNumber, name: additives[indexPath.row].name, status: additives[indexPath.row].status, descriptionLabel: additives[indexPath.row].eDescription)
        return cell
    }
}
