//
//  ErrorInfoVC.swift
//  Mortify
//
//  Created by Влад Бокин on 22.06.2022.
//

import UIKit
import SnapKit

class ErrorInfoVC: UIViewController {

    // MARK: - Error alert
    public func errorAlert(title: String, message: String, style: UIAlertController.Style) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)

        let action = UIAlertAction(title: "OK", style: .default) {_ in }

            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        errorAlert(title: "Ошибка", message: "Повторите попытку позже", style: .alert)
        
        // MARK: - Create elements
        self.navigationItem.setHidesBackButton(true, animated: true)

        let errorLabel = UILabel()
        errorLabel.text = "Произошла ошибка"
        errorLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        errorLabel.textAlignment = .center
        self.view.addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.trailing.leading.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        //quiz
        quizSetup()
    }

    func quizSetup() {
        // MARK: - Quiz task
        
        let quizLabel = UILabel()
        quizLabel.text = "Задача 1"
        quizLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        quizLabel.textAlignment = .center
        quizLabel.numberOfLines = 3
        self.view.addSubview(quizLabel)
        quizLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(100)
        }
        
        // MARK: - Answer buttons
        let answerButton1 = UIButton()
        answerButton1.setTitle("Ответ 1", for: .normal)
        answerButton1.setTitleColor(.gray, for: .selected)
        answerButton1.backgroundColor = .orange
               self.view.addSubview(answerButton1)
        answerButton1.snp.makeConstraints { make in
            make.top.equalTo(quizLabel).offset(120)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        answerButton1.tag = 1
        answerButton1.addTarget(self, action: #selector(tapAnswerButton(button:)), for: .touchUpInside)
        

        let answerButton2 = UIButton()
        answerButton2.setTitle("Ответ 2", for: .normal)
        answerButton2.setTitleColor(.gray, for: .selected)
        answerButton2.backgroundColor = .orange
               self.view.addSubview(answerButton2)
        answerButton2.snp.makeConstraints { make in
            make.top.equalTo(answerButton1).offset(70)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
       // answerButton2.addTarget(self, action: #selector(tapAnswerButton(tag: 2)), for: .touchUpInside)
        
        let answerButton3 = UIButton()
        answerButton3.setTitle("Ответ 3", for: .normal)
        answerButton3.setTitleColor(.gray, for: .selected)
        answerButton3.backgroundColor = .orange
               self.view.addSubview(answerButton3)
        answerButton3.snp.makeConstraints { make in
            make.top.equalTo(answerButton2).offset(70)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        //answerButton3.addTarget(self, action: #selector(tapAnswerButton(tag: 3)), for: .touchUpInside)
        
        let answerButton4 = UIButton()
        answerButton4.setTitle("Ответ 4 ", for: .normal)
        answerButton4.setTitleColor(.gray, for: .selected)
        answerButton4.backgroundColor = .orange
               self.view.addSubview(answerButton4)
        answerButton4.snp.makeConstraints { make in
            make.top.equalTo(answerButton3).offset(70)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
       // answerButton4.addTarget(self, action: #selector(tapAnswerButton(tag: 4)), for: .touchUpInside)
        
        let reloadDataButton = UIButton()
        reloadDataButton.setTitle("Обновить", for: .normal)
        reloadDataButton.setTitleColor(.gray, for: .selected)
        reloadDataButton.backgroundColor = .orange
               self.view.addSubview(reloadDataButton)
        reloadDataButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(50)
        }
        reloadDataButton.addTarget(self, action: #selector(reloadDataRequest), for: .touchUpInside)

        func loadQuiz() {
    
            var numberOfQuestion = 0
            let data = quizData[numberOfQuestion]
            
            func loadQuistion(data: QuizModel) {
                quizLabel.text = data.question
                answerButton1.setTitle(data.answer1, for: .normal)
                answerButton2.setTitle(data.answer2, for: .normal)
                answerButton3.setTitle(data.answer3, for: .normal)
                answerButton4.setTitle(data.answer4, for: .normal)
            }
            loadQuistion(data: data)
            
        }
        
        loadQuiz()
    }
    
    // MARK: - Update data
    @objc func reloadDataRequest(target: UIButton) {
        let myWebView = WebViewController()
        self.showSpiner()
        myWebView.dataRequest()
        self.removeSpiner()
        print("updating data")
        errorAlert(title: "Ошибка", message: "Повторите попытку позже", style: .alert)
        }
    
    @objc func tapAnswerButton(button: UIButton) {
        print("button is", button.tag)
    }
    
}
