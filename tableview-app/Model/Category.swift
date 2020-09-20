//
//  Category.swift
//  tableview-app
//
//  Created by Андрей Лебедев on 20.09.2020.
//

import Foundation

struct Category {
    private(set) var title: String
    private(set) var imageName: String
    
    init(title: String, imageName: String){
        self.title = title
        self.imageName = imageName
    }
}
