//
//  MenuItemStruct.swift
//  LittleLemonRestaurantOrderApp
//
//  Created by Virgo Obraj on 1/3/25.
//
import Foundation

struct MenuItem: Decodable {
    let title: String
    let image: String
    let price: String
}
