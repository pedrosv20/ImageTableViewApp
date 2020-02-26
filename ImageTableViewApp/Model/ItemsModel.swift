//
//  ItemsModel.swift
//  ImageTableViewApp
//
//  Created by Pedro Vargas on 26/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ItemsModel {
    
    static var shared = ItemsModel()
    
    var imagesArray: BehaviorRelay<[Item]> = BehaviorRelay<[Item]>(value: [Item(image: "", title: "")])
    
    private init() {}
}
