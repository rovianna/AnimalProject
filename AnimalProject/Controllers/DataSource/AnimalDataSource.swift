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
    
    var priorityAnimals = [Animal]() {
        didSet {
            onMain {
                self.tableView?.reloadData()
            }
        }
    }
    var nonPriorityAnimals = [Animal]() {
        didSet {
            onMain {
                self.tableView?.reloadData()
            }
        }
    }
    
    var delegate: AnimalDelegate?
    
    init(tableView: UITableView, priorityAnimals: [Animal], nonPriorityAnimals: [Animal]){
        super.init()
        self.priorityAnimals = priorityAnimals
        self.nonPriorityAnimals = nonPriorityAnimals
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView = tableView
    }
    
    func onMain(block: @escaping ()->()) {
        DispatchQueue.main.async {
            block()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return priorityAnimals.count
        } else {
            return nonPriorityAnimals.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Fila Prioritária"
        } else {
            return "Fila normal"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let nib = UINib(nibName: "AnimalTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "animalCell")
        var animal : Animal?
        if indexPath.section == 0 {
        animal = priorityAnimals[indexPath.row]
        } else {
        animal = nonPriorityAnimals[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as! AnimalTableViewCell
        if let animal = animal {
        cell.selectionStyle = .none
        cell.configure(name: animal.name, age: animal.age, specie: animal.specie)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
        delegate?.selected(self, animal: priorityAnimals[indexPath.row])
        } else {
        delegate?.selected(self, animal: nonPriorityAnimals[indexPath.row])
        }
    }
    
    
}
