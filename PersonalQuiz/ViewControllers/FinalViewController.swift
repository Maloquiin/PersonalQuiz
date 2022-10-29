//
//  FinalViewController.swift
//  PersonalQuiz
//
//  Created by Peri on 26.10.2022.
//

import UIKit

class FinalViewController: UIViewController {
    
    
    @IBOutlet var labelFinal: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    var score:[Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        let maxAnimal = getMaxAnimal()
        updateUI(with: maxAnimal)
        
        
    }



}

extension FinalViewController{
    
    private func getMaxAnimal() -> AnimalType? {
        return Dictionary(grouping: score, by: { $0.type })
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
        
    }
    
    private func updateUI(with animal: AnimalType?) {
        labelFinal.text = "Вы - \(animal?.rawValue ?? "🐶" )!"
        descriptionLabel.text = animal?.definition ?? ""
    }
}
    
