//
//  TableviewCustomCell.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/23/26.
//

import UIKit
class ProductCell: UITableViewCell {
    
    var productTitle: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.text = "default name"
        return label
    }()
    var productImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "gear")
        image.image!.withTintColor(.black)
        return image
    }()
    var productId: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.text = "test"
        return label
    }()
    var productDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.layer.cornerRadius = 10
        label.text = "blah blah blah"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productTitle)
        contentView.addSubview(productImage)
        contentView.addSubview(productId)
        contentView.addSubview(productDescription)
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            productImage.heightAnchor.constraint(equalToConstant: 70),
            productImage.widthAnchor.constraint(equalToConstant: 70),
            
            productTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            productTitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor),
            productTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            
            
            productId.topAnchor.constraint(equalTo: productTitle.bottomAnchor),
            productId.leadingAnchor.constraint(equalTo: productImage.trailingAnchor),
            productId.bottomAnchor.constraint(equalTo: productDescription.topAnchor),
            
            productDescription.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
            productDescription.leadingAnchor.constraint(equalTo: productImage.leadingAnchor),
            productDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            productDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func loadMovieData(product: Phone){
        productTitle.text = product.title
        productImage.image = UIImage(systemName:  "gear") //movie.images ??
        productId.text = "\(product.id, default: "none")"
        productDescription.text = product.description
        productDescription.numberOfLines = 0
    }
}
