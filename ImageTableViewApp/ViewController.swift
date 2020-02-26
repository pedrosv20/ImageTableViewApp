//
//  ViewController.swift
//  ImageTableViewApp
//
//  Created by Pedro Vargas on 26/02/20.
//  Copyright © 2020 Pedro Vargas. All rights reserved.
//

import UIKit
import Moya
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let tableView =  UITableView()
    
    let provider = MoyaProvider<Router>()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        retrieveData {
            createTableView()
        }
    }
    
    func retrieveData(finished: () -> Void) {
        provider.request(.getItems){ result in
            
            switch result {
            case let .success(result):
                do {
                    let filteredResponse = try result.filterSuccessfulStatusCodes()
                    
                    let json = try filteredResponse.map(Result.self)
                    let teste = json.result.items
                    ItemsModel.shared.imagesArray.accept(teste)
                    
                }
                catch let error {
                    print(error)
                }
            case let .failure(error):
                
                
                print(error)
            }
        }
        finished()
        
    }
    
    func createTableView() {
        view.addSubview(tableView)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        ItemsModel.shared.imagesArray.bind(to: tableView.rx.items(cellIdentifier: "cell")) { row, item, cell in
            cell.textLabel?.text = "\(item.title)"
            //TODO: adicionar imagens aqui e fazer cache das que ja foram mostradas
            //TODO: Arquitetura MVVM
            cell.imageView?.image = UIImage(named: "Image")
            
        }.disposed(by: disposeBag)
    }
    
}



