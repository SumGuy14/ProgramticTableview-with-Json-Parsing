
//
//  Movie.swift
//  ProgrammaticTableview testPrep
//
//  Created by Sumedh Kulkarni on 6/12/26.
//
import UIKit
struct Movie{
    let name: String?
    let description: String?
    let rating: Double?
    let image: String?
}
struct Phones: Decodable{
    let products: [Phone]
}

struct Phone: Decodable{
    let id : Int
    let title: String
    let description: String
    let images: [String?]
}
