//
//  ViewController.swift
//  Apple pie.
//
//  Created by rezra on 21.06.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var treeImageVIew: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: - Properties
    var currentGame: Game!
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var incorrectMovesAllowed = 7
    var listOfTowers = ["Амстердам",
                    "Андорра-ла-Велья",
                    "Афины",
                    "Белград",
                    "Берлин",
                    "Берн",
                    "Братислава",
                    "Брюссель",
                    "Будапешт",
                    "Бухарест",
                    "Вадуц",
                    "Валлетта",
                    "Варшава",
                    "Ватикан",
                    "Вена",
                    "Вильнюс",
                    "Дублин",
                    "Загреб",
                    "Киев",
                    "Кишинёв",
                    "Копенгаген",
                    "Лиссабон",
                    "Лондон",
                    "Любляна",
                    "Люксембург",
                    "Мадрид",
                    "Минск",
                    "Монако",
                    "Москва",
                    "Осло",
                    "Париж",
                    "Прага",
                    "Рейкьявик",
                    "Рига",
                    "Рим",
                    "Сан-Марино",
                    "Сараево",
                    "Скопье",
                    "София",
                    "Стокгольм",
                    "Таллин",
                    "Тирана",
                    "Хельсинки",
                    "Подгорица",
                    "Приштина",
                    "Тирасполь",
                    "Абу-Даби",
                    "Амман",
                    "Анкара",
                    "Астана",
                    "Ашхабад",
                    "Багдад",
                    "Баку",
                    "Бангкок",
                    "Бандар-Сери-Бегаван",
                    "Бейрут",
                    "Бишкек",
                    "Вьентьян",
                    "Дакка",
                    "Дамаск",
                    "Нью-Дели",
                    "Джакарта",
                    "Дили",
                    "Доха",
                    "Душанбе",
                    "Ереван",
                    "Иерусалим",
                    "Исламабад",
                    "Кабул",
                    "Катманду",
                    "Куала-Лумпур",
                    "Мале",
                    "Манама",
                    "Манила",
                    "Маскат",
                    "Нейпьидо",
                    "Никосия",
                    "Пекин",
                    "Пномпень",
                    "Пхеньян",
                    "Сана",
                    "Сеул",
                    "Сингапур",
                    "Ташкент",
                    "Тбилиси",
                    "Тегеран",
                    "Токио",
                    "Тхимпху",
                    "Улан-Батор",
                    "Ханой",
                    "Эль-Кувейт",
                    "Эр-Рияд",
                    "Лефкоша",
                    "Рамалла",
                    "Сухум",
                    "Тайбэй",
                    "Цхинвал",
                    "Абуджа",
                    "Аддис-Абеба",
                    "Аккра",
                    "Алжир",
                    "Антананариву",
                    "Асмэра",
                    "Бамако",
                    "Банги",
                    "Банжул",
                    "Бисау",
                    "Браззавиль",
                    "Бужумбура",
                    "Виктория",
                    "Виндхук",
                    "Габороне",
                    "Дакар",
                    "Джибути",
                    "Джуба",
                    "Додома",
                    "Каир",
                    "Кампала",
                    "Кигали",
                    "Киншаса",
                    "Конакри",
                    "Либревиль",
                    "Лилонгве",
                    "Ломе",
                    "Луанда",
                    "Лусака",
                    "Малабо",
                    "Мапуту",
                    "Масеру",
                    "Мбабане",
                    "Могадишо",
                    "Монровия",
                    "Морони",
                    "Найроби",
                    "Нджамена",
                    "Ниамей",
                    "Нуакшот",
                    "Порт-Луи",
                    "Порто-Ново",
                    "Прая",
                    "Претория",
                    "Рабат",
                    "Сан-Томе",
                    "Триполи",
                    "Тунис",
                    "Уагадугу",
                    "Фритаун",
                    "Хараре",
                    "Хартум",
                    "Ямусукро",
                    "Яунде",
                    "Харгейса",
                    "Асунсьон",
                    "Бастер",
                    "Бельмопан",
                    "Богота",
                    "Бразилиа",
                    "Бриджтаун",
                    "Буэнос-Айрес",
                    "Вашингтон",
                    "Гавана",
                    "Гватемала",
                    "Джорджтаун",
                    "Каракас",
                    "Кастри",
                    "Кингстаун",
                    "Кингстон",
                    "Кито",
                    "Лима",
                    "Манагуа",
                    "Мехико",
                    "Монтевидео",
                    "Нассау",
                    "Оттава",
                    "Панама",
                    "Парамарибо",
                    "Порт-о-Пренс",
                    "Порт-оф-Спейн",
                    "Розо",
                    "Сан-Сальвадор",
                    "Сан-Хосе",
                    "Санто-Доминго",
                    "Сантьяго",
                    "Сент-Джонс",
                    "Сент-Джорджес",
                    "Сукре",
                    "Тегусигальпа",
                    "Кайенна",
                    "Апиа",
                    "Веллингтон",
                    "Канберра",
                    "Маджуро",
                    "Нгерулмуд",
                    "Нукуалофа",
                    "Паликир",
                    "Порт-Вила",
                    "Сува",
                    "Фунафути",
                    "Хониара"
    ].shuffled()

    //MARK: - Method
    func enableButton(_ enable: Bool = true) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func newRound() {
        guard !listOfTowers.isEmpty else {
            enableButton(false)
            updateUI()
            return
        }
        let newWord = listOfTowers.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enableButton()
    }
    
    func updateCorrectWordLabel() {
        var displayWord = [String]()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
    }
    
    func updateState() {
        if currentGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if currentGame.guessedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func updateUI() {
        let imageNumber = (currentGame.incorrectMovesRemaining + 64) % 8
        let image = "Tree\(imageNumber)"
        treeImageVIew.image = UIImage(named: image)
        updateCorrectWordLabel()
        scoreLabel.text = "Выигрыши: \(totalWins) Проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    //MARK: - IBAction
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateState()
    }
}
