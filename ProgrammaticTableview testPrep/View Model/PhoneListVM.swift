//
//  PhoneListVM.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/25/26.
//

import UIKit

class PhoneListViewModel {
    var phoneList: [Phone]?
    
    func loadData(completionHandler: (() -> Void)?){
        NetworkManager.shared.fetchDataFromUrl(url: URLs.productList.rawValue) { [weak self] phones in
            self?.phoneList = phones
            completionHandler?()
        }
    }
    func getPhoneCount() -> Int {
        return phoneList?.count ?? 1
    }
    func getPhone(at index: Int) -> Phone {
        return phoneList?[index] ?? Phone(id: 0, title: "", description: "", images: [""])
    }
}
