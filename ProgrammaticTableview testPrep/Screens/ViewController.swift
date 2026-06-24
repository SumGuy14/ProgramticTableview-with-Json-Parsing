//
//  ViewController.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/12/26.
//

import UIKit

class ViewController: UIViewController {
    let productTable: UITableView = {
        let table = UITableView()
        return table
    }()
    var productList: [Phone] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(string: URLs.productList.rawValue)
        productTable.dataSource = self
        productTable.delegate = self
        setupUI()
    }
}




