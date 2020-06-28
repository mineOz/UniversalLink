//
//  ViewController.swift
//  universalLink
//
//  Created by Mine Oz on 31.05.2020.
//  Copyright © 2020 mobilerdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    let items = ["Ev Yaşam", "Giyim", "Elektronik", "Bahçe"]
       
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ürün Kategorileri"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedProduct = items[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

