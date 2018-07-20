//
//  AnimalViewController.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {
    
    var animals = [Animal]()
    
    var priorityAnimals = [Animal]()
    var nonPriorityAnimals = [Animal]()
    
    @IBOutlet weak var nextAnimalButton: UIButton!
    @IBOutlet weak var animalsTableView: UITableView!
    
    var source: AnimalDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimals(priority: priorityAnimals, nonPriority: nonPriorityAnimals)
    }
    
    func loadAnimals(priority: [Animal], nonPriority: [Animal]) {
        receiveAnimals(priorityAnimals, nonPriority: nonPriorityAnimals)
    }
    
    func receiveAnimals(_ priority: [Animal], nonPriority: [Animal]) {
        let source = AnimalDataSource(tableView: animalsTableView, priorityAnimals: priorityAnimals, nonPriorityAnimals: nonPriorityAnimals)
        applyDataSource(source: source)
    }
    
    func applyDataSource(source: AnimalDataSource) {
        self.view.bringSubview(toFront: animalsTableView)
        self.view.bringSubview(toFront: nextAnimalButton)
        source.delegate = self
        self.source = source
        animalsTableView.reloadData()
        if nonPriorityAnimals.isEmpty && priorityAnimals.isEmpty {
            createEmptyView()
        }
    }
    
    /* Creating a View programatically so I can train constraints and all the process better */
    /* I'm trying to follow the 'Clean Code' function explanation, that every function has a single purpose only */
    func createEmptyView(){
        let emptyStateView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        emptyStateView.backgroundColor = .white
        createOutletsFor(emptyStateView)
        self.view.addSubview(emptyStateView)
        self.view.bringSubview(toFront: emptyStateView)
    }
    
    func createOutletsFor(_ view: UIView) {
        createRefreshButtonOn(view)
    }
    
    func createRefreshButtonOn(_ view: UIView){
        let refreshButton = UIButton()
        refreshButton.setTitle("Atualizar", for: .normal)
        refreshButton.backgroundColor = .blue
        view.addSubview(refreshButton)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        refreshButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        refreshButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        refreshButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        refreshButton.addTarget(self, action: #selector(refreshTableView(_:)), for: .touchUpInside)
        createEmptyStateLabel(view: view, button: refreshButton)
        addNewAnimalOn(view, buttonReference: refreshButton)
    }
    
    func addNewAnimalOn(_ view: UIView, buttonReference: UIButton){
        let addAnimalButton = UIButton()
        addAnimalButton.setTitle("Adicionar novo animal", for: .normal)
        addAnimalButton.backgroundColor = .purple
        view.addSubview(addAnimalButton)
        addAnimalButton.translatesAutoresizingMaskIntoConstraints = false
        addAnimalButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        addAnimalButton.topAnchor.constraint(equalTo: buttonReference.bottomAnchor, constant: 32).isActive = true
        addAnimalButton.leadingAnchor.constraint(equalTo: buttonReference.leadingAnchor).isActive = true
        addAnimalButton.trailingAnchor.constraint(equalTo: buttonReference.trailingAnchor).isActive = true
        addAnimalButton.addTarget(self, action: #selector(addAnimalOptionAction), for: .touchUpInside)
    }
    
    func createEmptyStateLabel(view: UIView, button: UIButton){
        let label = UILabel()
        label.text = "Você já atendeu todos os animais! :)"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -32).isActive = true
        label.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 0).isActive = true
    }
    
    /* Target for button inside view */
    @objc func refreshTableView(_ sender: UIButton) {
        loadAnimals(priority: priorityAnimals, nonPriority: nonPriorityAnimals)
    }
    
    @IBAction func addAnimalOptionAction(_ sender: UIBarButtonItem) {
        let animalChoice = UIAlertController(title: "Adicionar novo animal", message: "Qual animal?", preferredStyle: .actionSheet)
        let view = DetailAnimalViewController.instance
        let dogAction = UIAlertAction(title: "Cachorro", style: .default) { (alert) in
            view.specie = .dog
            self.navigationController?.show(view, sender: nil)
        }
        let catAction = UIAlertAction(title: "Gato", style: .default) { (alert) in
            view.specie = .cat
            self.navigationController?.show(view, sender: nil)
        }
        let parrotAction = UIAlertAction(title: "Papagaio", style: .default) { (alert) in
            view.specie = .parrot
            self.navigationController?.show(view, sender: nil)
        }
        let parakeetAction = UIAlertAction(title: "Periquito", style: .default) { (alert) in
            view.specie = .parekeet
            self.navigationController?.show(view, sender: nil)
        }
        let ferretAction = UIAlertAction(title: "Furão", style: .default) { (alert) in
            view.specie = .ferret
            self.navigationController?.show(view, sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        animalChoice.addAction(dogAction)
        animalChoice.addAction(catAction)
        animalChoice.addAction(parrotAction)
        animalChoice.addAction(parakeetAction)
        animalChoice.addAction(ferretAction)
        animalChoice.addAction(cancelAction)
        view.delegate = self
        present(animalChoice, animated: true, completion: nil)
    }
    
    @IBAction func callNextAnimalAction(_ sender: UIButton) {
        if priorityAnimals.isEmpty {
            nonPriorityAnimals.removeFirst()
        } else {
            priorityAnimals.removeFirst()
        }
        loadAnimals(priority: priorityAnimals, nonPriority: nonPriorityAnimals)
    }
}

extension AnimalViewController: AnimalDelegate {
    func selected(_ AnimalDataSource: AnimalDataSource, animal: Animal) {
        
    }
}

extension AnimalViewController: DetailAnimalViewControllerDelegate {
    func addNewAnimal(_ DetailAnimalViewController: DetailAnimalViewController, animal: Animal){
        if animal.age > 3 {
            priorityAnimals.append(animal)
        } else {
            nonPriorityAnimals.append(animal)
        }
        loadAnimals(priority: priorityAnimals, nonPriority: nonPriorityAnimals)
    }
}
