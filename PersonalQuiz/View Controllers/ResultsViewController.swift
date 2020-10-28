//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//
// 1. Передать сюда массив с ответами
// 2. Определить наиболее часто встречающийся тип животного
// 3. Отобразить результаты на экране
// 4. Избавится от кнопки возврата на предыдущий экран

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - Public Properties
    var answer: [Answer]!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        showHowYouAnimal()
    }
    
}

//MARK: - Private Methods
extension ResultsViewController {
    private func mostFrequentAnimal(result answer: [Answer]) -> AnimalType {
        var animals: [AnimalType] = []
        for animal in answer {
            animals.append(animal.type)
        }
        
        let countedSet = NSCountedSet(array: animals)
        let mostFrequent = countedSet.max { countedSet.count(for: $0) <
            countedSet.count(for: $1) }
        return mostFrequent as! AnimalType
    }
    
    private func showHowYouAnimal() {
        let animal = mostFrequentAnimal(result: answer)
        
        emojiLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }

}
