//
//  ViewController.swift
//  MyAdventure
//
//  Created by Jasmine Sung on 11/2/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var currentOption: Int = 0
    var currentScenario: Scenario!
    var adventureLogic = AdventureLogic()

    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func clickedOptionOne(_ sender: UIButton) {
        if sender.titleLabel!.text == "Restart" {
            restartGame()
            return
        }
        currentOption = 1
        if adventureLogic.isGameOver() {
            setGameOver(currentOption)
            return
        }
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @IBAction func clickedOptionTwo(_ sender: UIButton) {
        currentOption = 2
        if adventureLogic.isGameOver() {
            setGameOver(currentOption)
            return
        }
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        currentScenario = adventureLogic.genNextScenario(currentOption)
        label.text = currentScenario.description
        optionOne.setTitle(currentScenario.option_one, for: .normal)
        optionTwo.setTitle(currentScenario.option_two, for: .normal)
    }
    
    func restartGame() {
        currentOption = 0
        optionTwo.isEnabled = true
        updateUI()
    }
    
    func setGameOver(_ option: Int) {
        if adventureLogic.isWin(option) {
            label.text = "YOU WIN!"
        } else {
            label.text = "YOU LOSE!"
        }
        optionOne.setTitle("Restart", for: .normal)
        optionTwo.isEnabled = false
    }
}

