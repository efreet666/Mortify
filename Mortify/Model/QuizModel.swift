//
//  QuizModel.swift
//  Mortify
//
//  Created by Влад Бокин on 16.07.2022.
//

import Foundation

struct QuizModel {
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var correctAnswerNumber: Int
}

// MARK: - Data of question
let quizData: [QuizModel] = [QuizModel(question: "В какой стране, и в каком городе проходил Финал Клубного чемпионата мира 2019?",
                                       answer1: "Иокогама (Япония)",
                                       answer2: "Абу-Даби (ОАЭ)",
                                       answer3: "Лондон (Англия)",
                                       answer4: "Доха (Катар)",
                                       correctAnswerNumber: 4),
                             QuizModel(question: "Кто стал победителем ФИФА 2019?",
                                       answer1: "Фламенго (Франция)",
                                       answer2: "Бавария (Германия)",
                                       answer3: "Ливерпуль (Англия)",
                                       answer4: "Манчестер Юнайтед (Англия)",
                                       correctAnswerNumber: 3),
                             QuizModel(question: "Кто признан лучшим вратарём вы 2019 году по версии ФИФА?",
                                       answer1: "Алиссон из «Ливерпуля»",
                                       answer2: "Тибо Куртуа из «Реала»",
                                       answer3: "Ян Облак из «Атлетико»",
                                       answer4: "Давид де Хеа из «Манчестер Юнайтед»",
                                       correctAnswerNumber: 1),
                             QuizModel(question: "Кто является лучшим бомбардиром за всю историю сборной Португалии?",
                                       answer1: "Матийс де Лигт",
                                       answer2: "Криштиану Роналду",
                                       answer3: "Лионель Месси",
                                       answer4: "Вирджил ван Дейк",
                                       correctAnswerNumber: 2),
                             QuizModel(question: "В какой стране появился и начал развиваться футбол?",
                                       answer1: "Бразилия",
                                       answer2: "Англия",
                                       answer3: "Испания",
                                       answer4: "Португалия",
                                       correctAnswerNumber: 2)]

