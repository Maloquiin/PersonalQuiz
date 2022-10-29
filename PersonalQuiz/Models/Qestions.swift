//
//  Qestions.swift
//  PersonalQuiz
//
//  Created by Peri on 26.10.2022.
//

import UIKit

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question]{
        return [
            Question(text: "Какую пищу вы предпочитаете?",
                     type: .single,
                     answers: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Морковь", type: .rabbit),
                        Answer(text: "Кукуруза", type: .tortle)
                     ]
                    ),
            Question(text: "Что вы любите делать?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Плавать", type: .dog),
                        Answer(text: "Спать", type: .cat),
                        Answer(text: "Обниматься", type: .rabbit),
                        Answer(text: "Есть", type: .tortle)
                     ]
                    ),
            Question(text: "Любите ли вы поездки на машине?",
                     type: .range,
                     answers: [
                        Answer(text: "Обожаю", type: .dog),
                        Answer(text: "Нравится", type: .cat),
                        Answer(text: "Равнодушно", type: .rabbit),
                        Answer(text: "Ненавижу", type: .tortle)
                     ]
                    ),
        ]
    }
}
