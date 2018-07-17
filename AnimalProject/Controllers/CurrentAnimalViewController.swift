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
