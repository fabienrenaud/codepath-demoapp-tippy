//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Fabien Renaud on 9/17/16.
//  Copyright © 2016 Fabien Renaud. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var darkTheme: UISwitch!
    @IBOutlet weak var defaultTipSelector: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        darkTheme.isOn = UserSettings.instance.darkTheme
        defaultTipSelector.selectedSegmentIndex = TippyUtil.tipValueToIndex(value: UserSettings.instance.defaultTip)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onThemeChanged(_ sender: AnyObject) {
        UserSettings.instance.darkTheme = darkTheme.isOn
    }
    
    @IBAction func onDefaultTipChanged(_ sender: AnyObject) {
        let tipValue = TippyUtil.tipIndexToValue(index: defaultTipSelector.selectedSegmentIndex)
        UserSettings.instance.defaultTip = tipValue
        if (UserSession.instance.billAmount == "") {
            UserSession.instance.tipPercent = tipValue
        }
    }

}
