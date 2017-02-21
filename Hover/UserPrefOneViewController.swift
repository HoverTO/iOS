//
//  UserPrefOneViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-20.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit

class UserPrefOneViewController: UIViewController {
    @IBOutlet weak var TalkLabel: UILabel!
    @IBOutlet weak var talkSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func TalkSlider(_ sender: UISlider) {
        
        let step: Float = 4
        
        // The Value Changed event for your UISlider
        let roundedValue = round(sender.value)
        sender.value = roundedValue
            // Do something else with the value
        
        switch sender.value {
        case 0: TalkLabel.text = "I like peace and quiet"
        case 1: TalkLabel.text = "I'm slightly talkative"
        case 2: TalkLabel.text = "I enjoy the occassional conversation"
        case 3: TalkLabel.text = "I'm fairly talkative"
        case 4: TalkLabel.text = "I LOVE to talk"
        default: TalkLabel.text = "Default value"
        }
        
        new_User.talkativeness = Int(sender.value)
    }

    
    @IBAction func buttonClick(_ sender: Any) {
        new_User.updateUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
