//
//  QestionViewController.swift
//  PersonalQuiz
//
//  Created by Peri on 26.10.2022.
//

import UIKit

class QestionViewController: UIViewController {

    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(questions[qIndex].answers.count - 1)
            rangedSlider.maximumValue = answerCount
        }
    }
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var qestionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var rangedStackView: UIStackView!
    
    
    @IBOutlet var singlebuttons: [UIButton]!
    @IBOutlet var multiplyLabel: [UILabel]!
    @IBOutlet var rangedLables: [UILabel]!
    
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    // MARK: Properties
    private let questions = Question.getQuestions()
    private var qIndex = 0
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer]{
        questions[qIndex].answers
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let FinalView = segue.destination as! FinalViewController
        FinalView.score = answerChosen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()

    }
    
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singlebuttons.firstIndex(of: sender) else {
            return}
        
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers){
            if multipleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedSliderAction(_ sender: Any) {
        let index = lrintf(rangedSlider.value)
        qestionLabel.text = String(index)
    }
    
    
    @IBAction func rangedAnswerPressed() {
        let index = Int(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
}

// MARK: - Private
extension QestionViewController {
    private func updateUI(){
        // Hide stacks
        for stackView in [singleStackView, multipleStackView, rangedStackView]{
            stackView?.isHidden = true
        }
        //get current question
        let currentQestion = questions[qIndex]
        
        
        //set current question for label
        qestionLabel.text = currentQestion.text
        
        //calculate progress
        let totalProgress = Float(qIndex) / Float(questions.count)
        
        //set progress for progressView
        progressView.setProgress(totalProgress, animated: true)
        
        
        title  = "Вопрос № \(qIndex+1) из \(questions.count)"
        
        
        // show current StackView
        showCurrentStackView(for: currentQestion.type)
    }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
            case .single:
                showSingleStackView(with: currentAnswers)
            case .multiple:
                showMultiplyStackView(with: currentAnswers)
            case .range:
                showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]){
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singlebuttons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultiplyStackView(with answers: [Answer]){
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multiplyLabel, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]){
        rangedStackView.isHidden = false
        
        rangedLables.first?.text = answers.first?.text
        rangedLables.last?.text = answers.last?.text
    }
    
    private func nextQuestion(){
        qIndex += 1
        
        if qIndex < questions.count {
            updateUI()
            return
        }
        
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
