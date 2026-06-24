//
//  Helpers.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/23/26.
//

import UIKit
extension ViewController {
    func setupUI(){
        view.addSubview(productTable)
        productTable.rowHeight = UITableView.automaticDimension
        productTable.estimatedRowHeight = 150
        productTable.translatesAutoresizingMaskIntoConstraints = false
        productTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        productTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        productTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        productTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        productTable.separatorColor = .blue
        productTable.register(ProductCell.self, forCellReuseIdentifier: CellNames.productCell.rawValue)
    }
    func getData(string: String){
        NetworkManager.shared.fetchDataFromUrl(url: string) { [weak self] products in
            print("fetched data method completed:\(products.count)")
            self?.productList = products
            DispatchQueue.main.async(){
                self?.productTable.reloadData()
            }
        }
    }
}
