//
//  CurrentAnimalViewController.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 17/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class CurrentAnimalViewController: UIViewController {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var currentFeedbackLabel: UILabel!
    @IBOutlet weak var showerAnimalButton: UIButton!
    @IBOutlet weak var petAnimalButton: UIButton!
    @IBOutlet weak var finishAnimalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadQuotes(for specie: Animal.Specie) {
        switch specie {
        case .Dog:
        case .Cat:
        case .Ferret:
        case .Parekeet:
        case .Parrot:
        }
    }
    
    @IBAction func showerAnimalAction(_ sender: UIButton) {
        showerAnimalButton.isEnabled = false
        petAnimalButton.isEnabled = true
    }
    
    @IBAction func petAnimalAction(_ sender: UIButton) {
        petAnimalButton.isEnabled = false
        finishAnimalButton.isEnabled = true
    }
    
    @IBAction func endAnimalVisitAction(_ sender: UIButton) {
        
    }
}
