//
//  ErrorInfoVC.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import UIKit
import SnapKit

class ErrorInfoVC: UIViewController {
    
    var numberOfQuestion = 0
    var data = quizData[0]
    
    // MARK: - Basic labels and buttons
    let correctInfoLabel = UILabel()
    let quizLabel = UILabel()
    let endGameLabel = UILabel()
    let answerButton1 = UIButton()
    let answerButton2 = UIButton()
    let answerButton3 = UIButton()
    let answerButton4 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.view.backgroundColor = .black
        // MARK: - Show Alert
        
         errorAlert(title: "Произошла ошибка", message: "Повторите попытку позже", style: .alert)
        
        // MARK: - Setup UI
        setupErrorLabelAndButton()
        showQuizButton()
    }
    
    // MARK: - Error alert
    func errorAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) {_ in }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Setup error label and reload button
    func setupErrorLabelAndButton() {
        
        let errorLabel = UILabel()
        errorLabel.text = "Произошла ошибка"
        errorLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        errorLabel.isHighlighted = true
        errorLabel.textAlignment = .center
        self.view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.trailing.leading.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        // reload button
        let reloadDataButton = UIButton()
        reloadDataButton.setTitle("Обновить страницу", for: .normal)
        reloadDataButton.setTitleColor(.gray, for: .selected)
        reloadDataButton.backgroundColor = .orange
        self.view.addSubview(reloadDataButton)
        reloadDataButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        reloadDataButton.layer.cornerRadius = 13
        reloadDataButton.addTarget(self, action: #selector(reloadDataRequest), for: .touchUpInside)
    }
    
    func showQuizButton() {
        let showQuizButton = UIButton()
        showQuizButton.setTitle("Сыграть в викторину", for: .normal)
        showQuizButton.setTitleColor(.gray, for: .selected)
        showQuizButton.backgroundColor = .orange
        self.view.addSubview(showQuizButton)
        showQuizButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        showQuizButton.layer.cornerRadius = 13
        showQuizButton.addTarget(self, action: #selector(tapAndShowQuiz(button:)), for: .touchUpInside)
    }
    
    func quizSetup(data: QuizModel, hideQuiz: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            // MARK: - Quiz task
            self.quizLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
            self.quizLabel.textAlignment = .center
            self.quizLabel.numberOfLines = 3
            self.view.addSubview(self.quizLabel)
            self.quizLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(150)
                make.trailing.leading.equalToSuperview().inset(25)
                make.height.equalTo(100)
            }
        })
        
        // MARK: - Answer buttons
        
        // Button 1
        answerButton1.setTitleColor(.gray, for: .selected)
        answerButton1.backgroundColor = .orange
        self.view.addSubview(answerButton1)
        answerButton1.snp.makeConstraints { make in
            make.top.equalTo(quizLabel).offset(120)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        answerButton1.layer.cornerRadius = 13
        answerButton1.tag = 1
        answerButton1.addTarget(self, action: #selector(tapAnswerButton(button:)), for: .touchUpInside)
        
        // Button 2
        answerButton2.setTitleColor(.gray, for: .selected)
        answerButton2.backgroundColor = .orange
        self.view.addSubview(answerButton2)
        answerButton2.snp.makeConstraints { make in
            make.top.equalTo(answerButton1).offset(70)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        answerButton2.layer.cornerRadius = 13
        answerButton2.tag = 2
        answerButton2.addTarget(self, action: #selector(tapAnswerButton(button:)), for: .touchUpInside)
        
        // Button 3
        answerButton3.setTitleColor(.gray, for: .selected)
        answerButton3.backgroundColor = .orange
        self.view.addSubview(answerButton3)
        answerButton3.snp.makeConstraints { make in
            make.top.equalTo(answerButton2).offset(70)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        answerButton3.layer.cornerRadius = 13
        answerButton3.tag = 3
        answerButton3.addTarget(self, action: #selector(tapAnswerButton(button:)), for: .touchUpInside)
        
        // Button 4
        answerButton4.setTitleColor(.gray, for: .selected)
        answerButton4.backgroundColor = .orange
        self.view.addSubview(answerButton4)
        answerButton4.snp.makeConstraints { make in
            make.top.equalTo(answerButton3).offset(70)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        answerButton4.layer.cornerRadius = 13
        answerButton4.tag = 4
        answerButton4.addTarget(self, action: #selector(tapAnswerButton(button:)), for: .touchUpInside)
        
        // Score label
        endGameLabel.alpha = 0
        endGameLabel.text = "Поздравляю, вы прошли викторину"
        endGameLabel.numberOfLines = 0
        endGameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        endGameLabel.isHighlighted = true
        endGameLabel.textAlignment = .center
        self.view.addSubview(endGameLabel)
        endGameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.trailing.leading.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        
        // MARK: - Hide if game ended
        if hideQuiz == true {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
                self.answerButton4.alpha = 0
                self.answerButton3.alpha = 0
                self.answerButton2.alpha = 0
                self.answerButton1.alpha = 0
                self.quizLabel.alpha = 0
                self.endGameLabel.alpha = 1
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            self.answerButton4.removeFromSuperview()
            self.answerButton3.removeFromSuperview()
            self.answerButton2.removeFromSuperview()
            self.answerButton1.removeFromSuperview()
            self.quizLabel.removeFromSuperview()
            }
            
        }
        
        // MARK: - Load data
        func loadQuiz(data: QuizModel) {
            
            quizLabel.text = data.question
            answerButton1.setTitle(data.answer1, for: .normal)
            answerButton2.setTitle(data.answer2, for: .normal)
            answerButton3.setTitle(data.answer3, for: .normal)
            answerButton4.setTitle(data.answer4, for: .normal)
        }
        
        loadQuiz(data: data)
    }
    
    // MARK: - Present correct label
    func showCorrectLabel(isCorrect: Bool, hide: Bool) {
        // Animation
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.correctInfoLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
            self.correctInfoLabel.textAlignment = .center
            self.correctInfoLabel.numberOfLines = 1
            self.view.addSubview(self.correctInfoLabel)
            self.correctInfoLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(550)
                make.trailing.leading.equalToSuperview().inset(70)
                make.height.equalTo(30)
            }
            self.correctInfoLabel.layer.cornerRadius = 10
            
            if hide == true {
                self.correctInfoLabel.alpha = 0
            } else {
                self.correctInfoLabel.alpha = 1
            }
        })
        
        // show anotation
        switch isCorrect {
        case true:
            correctInfoLabel.backgroundColor = .black
            correctInfoLabel.text = "Ответ верный"
            correctInfoLabel.textColor = .green
            correctInfoLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        case false:
            correctInfoLabel.backgroundColor = .black
            correctInfoLabel.text = "Ответ неправильный"
            correctInfoLabel.textColor = .red
            correctInfoLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        }
    }
    
    // MARK: - Update data
    @objc func reloadDataRequest(target: UIButton) {
        let myWebView = WebViewController()
        self.showSpiner()
        myWebView.dataRequest()
        self.removeSpiner()
        print("updating data")
        errorAlert(title: "Произошла ошибка", message: "Повторите попытку позже", style: .alert)
    }
    
    // MARK: - Check answer from button
    @objc func tapAnswerButton(button: UIButton) {
        
        // Check button tag
        if button.tag == data.correctAnswerNumber {
            showCorrectLabel(isCorrect: true, hide: false)

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                if quizData.count - 1 != numberOfQuestion {
                    self.numberOfQuestion += 1
                    data = quizData[numberOfQuestion]
                    self.quizSetup(data: data, hideQuiz: false)
                    showCorrectLabel(isCorrect: true, hide: true)
                } else {
                    // End game
                    showCorrectLabel(isCorrect: true, hide: true)
                    quizSetup(data: data, hideQuiz: true)
                    
                }
            }
        } else {
            showCorrectLabel(isCorrect: false, hide: false)
            // delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                showCorrectLabel(isCorrect: false, hide: true)
            }
        }
    }
    
    @objc func tapAndShowQuiz(button: UIButton) {
        // MARK: - Setup quiz
        data = quizData[numberOfQuestion]
        quizSetup(data: data, hideQuiz: false)
        button.removeFromSuperview()
    }
}
