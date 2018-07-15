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
    var animals = [Animal]()
    var delegate: AnimalDelegate?
    
    init(tableView: UITableView, animals: [Animal]){
        self.tableView = tableView
        self.animals = animals
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell")
        cell?.textLabel?.text = animals[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(self, animal: animals[indexPath.row])
    }
    
    
}
