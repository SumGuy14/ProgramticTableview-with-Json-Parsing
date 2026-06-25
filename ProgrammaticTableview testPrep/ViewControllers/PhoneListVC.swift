//
//  ViewController.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/12/26.
//

import UIKit

class PhoneListVC: UIViewController {
    var viewModel: PhoneListViewModel!
    let productTable: UITableView = {
        let table = UITableView()
        return table
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .black
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    //var productList: [Phone] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        //getData(string: URLs.productList.rawValue)
        activityIndicator.startAnimating()
        viewModel.loadData(){
            DispatchQueue.main.async {
                self.productTable.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
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
        activityIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        productTable.separatorColor = .blue
        productTable.register(ProductCell.self, forCellReuseIdentifier: CellNames.productCell.rawValue)
        productTable.dataSource = self
        productTable.delegate = self
    }
//    func getData(string: String){
//        activityIndicator.startAnimating()
//        NetworkManager.shared.fetchDataFromUrl(url: string) { [weak self] products in
//            print("fetched data method completed:\(products.count)")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//                self?.productList = products
//                self?.productTable.reloadData()
//                self?.activityIndicator.stopAnimating()
//            }
//        }
//    }
}

extension PhoneListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getPhoneCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellNames.productCell.rawValue) as? ProductCell
        cell?.loadMovieData(product: viewModel.getPhone(at: indexPath.row))
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    }
}
