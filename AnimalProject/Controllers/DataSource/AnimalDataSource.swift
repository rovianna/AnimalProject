//
//  AnimalDataSource.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

protocol AnimalDelegate {
    func selected(_ AnimalDataSource: AnimalDataSource, animal: Animal)
}

class AnimalDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    weak var tableView: UITableView?
    var animals = [Animal]() {
        didSet {
            onMain {
            self.tableView?.reloadData()
            }
        }
    }
    var delegate: AnimalDelegate?
    
    init(tableView: UITableView, animals: [Animal]){
        super.init()
        self.animals = animals
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }
    
    func onMain(block: @escaping ()->()) {
        DispatchQueue.main.async {
            block()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib = UINib(nibName: "AnimalTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "animalCell")
        let animal = animals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as! AnimalTableViewCell
        cell.selectionStyle = .none
        cell.configure(animal: animal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(self, animal: animals[indexPath.row])
    }
    
    
}
