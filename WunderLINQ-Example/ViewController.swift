/*
WunderLINQ Client Application
Copyright (C) 2020  Keith Conger, Black Box Embedded, LLC

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keypressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var keyCommands: [UIKeyCommand]? {
        //Capture some common WunderLINQ key mappings
        let commands = [
            UIKeyCommand(input: UIKeyCommand.inputLeftArrow, modifierFlags:[], action: #selector(leftArrow)),
            UIKeyCommand(input: UIKeyCommand.inputRightArrow, modifierFlags:[], action: #selector(rightArrow)),
            UIKeyCommand(input: UIKeyCommand.inputUpArrow, modifierFlags:[], action: #selector(upArrow)),
            UIKeyCommand(input: "+", modifierFlags:[], action: #selector(addition)),
            UIKeyCommand(input: UIKeyCommand.inputDownArrow, modifierFlags:[], action: #selector(downArrow)),
            UIKeyCommand(input: "-", modifierFlags:[], action: #selector(minus)),
            UIKeyCommand(input: UIKeyCommand.inputEscape, modifierFlags:[], action: #selector(escape)),
            UIKeyCommand(input: "\u{d}", modifierFlags:[], action: #selector(enter)),
            
        ]
        if #available(iOS 15, *) {
            commands.forEach { $0.wantsPriorityOverSystemBehavior = true }
        }
        return commands
    }
    
    @objc func leftArrow() {
        SoundManager().playSoundEffect("directional")
        keypressLabel.text = "Left Arrow"
    }
    
    @objc func rightArrow() {
        SoundManager().playSoundEffect("directional")
        keypressLabel.text = "Right Arrow"
    }
    
    @objc func upArrow() {
        SoundManager().playSoundEffect("directional")
        keypressLabel.text = "Up Arrow"
    }
    
    @objc func downArrow() {
        SoundManager().playSoundEffect("directional")
        keypressLabel.text = "Down Arrow"
    }
    
    @objc func addition() {
        SoundManager().playSoundEffect("directional")
        keypressLabel.text = "+"
    }
    
    @objc func minus() {
        SoundManager().playSoundEffect("directional")
        keypressLabel.text = "-"
    }
    
    @objc func escape() {
        SoundManager().playSoundEffect("enter")
        keypressLabel.text = "Escape"
        // Launch WunderLINQ app when Escape is pressed
        guard let url = URL(string: "wunderlinq://") else {
            return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @objc func enter() {
        keypressLabel.text = "Enter"
    }
}

