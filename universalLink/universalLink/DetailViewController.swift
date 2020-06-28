//
//  DetailViewController.swift
//  universalLink
//
//  Created by Mine Oz on 28.06.2020.
//  Copyright © 2020 mobilerdev. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var selectedProduct: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedProduct
        navigationItem.largeTitleDisplayMode = .never
        if let product = selectedProduct {
            label.text = "\(product) ürünleri detay sayfası"
        }
    }
}
