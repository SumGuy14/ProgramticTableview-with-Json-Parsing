//
//  ViewController.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/12/26.
//

import UIKit

class PhoneListVC: UIViewController {
    let productTable: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .systemOrange
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var productList: [Phone] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTable.dataSource = self
        productTable.delegate = self
        setupUI()
        getData(string: URLs.productList.rawValue)
    }
    func setupUI(){
        view.addSubview(productTable)
        view.addSubview(activityIndicator)
        productTable.rowHeight = UITableView.automaticDimension
        productTable.estimatedRowHeight = 150
        productTable.translatesAutoresizingMaskIntoConstraints = false
        productTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        productTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        productTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        productTable.separatorColor = .blue
        productTable.register(ProductCell.self, forCellReuseIdentifier: CellNames.productCell.rawValue)
    }
    func getData(string: String){
        activityIndicator.startAnimating()
        NetworkManager.shared.fetchDataFromUrl(url: string) { [weak self] products in
            print("fetched data method completed:\(products.count)")
            DispatchQueue.main.async(){
                self?.productList = products
                self?.productTable.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }
    }
}




