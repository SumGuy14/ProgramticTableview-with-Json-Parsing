//
//  TableviewCustomCell.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/23/26.
//

import UIKit
class ProductCell: UITableViewCell {
    
    var movieName: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.layer.cornerRadius = 10
        label.text = "default name"
        return label
    }()
    var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "gear")
        return image
    }()
    var movieRating: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.layer.cornerRadius = 10
        label.text = "test"
        return label
    }()
    var movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.layer.cornerRadius = 10
        label.text = "blah blah blah"
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(movieName)
        addSubview(movieImage)
        addSubview(movieRating)
        addSubview(movieDescription)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            //movieImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            movieImage.heightAnchor.constraint(equalToConstant: 70),
            movieImage.widthAnchor.constraint(equalToConstant: 70),
            
            movieName.topAnchor.constraint(equalTo: topAnchor),
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            
            movieRating.topAnchor.constraint(equalTo: movieName.bottomAnchor),
            movieRating.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor),
            movieRating.bottomAnchor.constraint(equalTo: movieDescription.topAnchor),
            
            movieDescription.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10),
            movieDescription.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor),
            movieDescription.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 10)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func loadMovieData(movie: Phone){
        movieName.text = movie.title
        movieImage.image = UIImage(systemName:  "gear") //movie.images ??
        movieRating.text = "\(movie.id, default: "none")"
        movieDescription.text = movie.description
    }
}
