//
//  ViewController.swift
//  assignment_1
//
//  Created by luhanfeng on 2019/9/14.
//  Copyright © 2019 luhanfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (((UserDefaults.standard.object(forKey: "name"))) != nil) {
            self.hasInput = true
            check(hasInput: hasInput)
            btn.setTitle("reset", for: .normal)
        }
    }
    

    var hasInput = false
    func check(hasInput: Bool) {
        nameLabel.isHidden = hasInput
        name.isHidden = hasInput
        classYearLabel.isHidden = hasInput
        classYear.isHidden = hasInput
        name.text = ""
        classYear.text = ""
        let n = UserDefaults.standard.object(forKey: "name")
        let y = UserDefaults.standard.object(forKey: "classYear")
        welcomeMessage.text = "welcome back \(n ?? "")! class of \(y ?? "")"
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var classYearLabel: UILabel!
    
    @IBOutlet weak var classYear: UITextField!
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    
    @IBAction func submit(_ sender: Any) {
        if (!self.hasInput) {
            let n = name.text ?? ""
            let y = classYear.text ?? ""
            UserDefaults.standard.set(n, forKey: "name")
            UserDefaults.standard.set(y, forKey: "classYear")
            self.hasInput = true
            check(hasInput: hasInput)
            btn.setTitle("reset", for: .normal)
        } else {
            // in this case it is reset
            self.hasInput = false
            check(hasInput: hasInput)
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "classYear")
            welcomeMessage.text = "welcome, plz enter your info"
            btn.setTitle("submit", for: .normal)
        }
    }

}

