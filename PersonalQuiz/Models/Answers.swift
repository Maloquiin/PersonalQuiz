//
//  Answers.swift
//  PersonalQuiz
//
//  Created by Peri on 26.10.2022.
//

import UIKit

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case tortle = "🐢"
    
    var definition: String {
        switch self {
            case .dog:
                return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
            case .cat:
                return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
            case .rabbit:
                return "Вам нравятся все мягкое. Вы здоровы и полны энергии."
            case .tortle:
                return "Ваша сила - в мудростиЮ Медленный и вдумчивы выигрывает на больших дистанциях."
        }
    }
}

struct Answer{
    let text: String
    let type: AnimalType
}

