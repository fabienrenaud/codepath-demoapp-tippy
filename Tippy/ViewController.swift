//
//  ViewController.swift
//  Tippy
//
//  Created by Fabien Renaud on 9/17/16.
//  Copyright © 2016 Fabien Renaud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let lightThemeTopViewColor = TippyUtil.colorFromHex(hexString: "#9bc780")
    static let lightThemeBottomViewColor = TippyUtil.colorFromHex(hexString: "#44692e")
    static let lightThemeTextColor = TippyUtil.colorFromHex(hexString: "#333333")
    
    static let darkThemeTopViewColor = TippyUtil.colorFromHex(hexString: "#213216")
    static let darkThemeBottomViewColor = TippyUtil.colorFromHex(hexString: "#0f170a")
    static let darkThemeTextColor = TippyUtil.colorFromHex(hexString: "#dddddd")

    
    @IBOutlet var topView: UIView!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    @IBOutlet weak var tipLabelLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabelLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    let currencyFormatter = NumberFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear")
        
        setTheme()
        
        tipSelector.selectedSegmentIndex = TippyUtil.tipValueToIndex(value: UserSession.instance.tipPercent)
        billField.text = UserSession.instance.billAmount
        
        currencyFormatter.numberStyle = .currency
        billField.placeholder = currencyFormatter.currencySymbol
        
        calculateTip()
        
        billField.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View will disappear")
        UserSettings.instance.save()
        UserSession.instance.save()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBillChanged(_ sender: AnyObject) {
        UserSession.instance.billAmount = billField.text!
        calculateTip()
    }
    
    @IBAction func onTipChoiceChanged(_ sender: AnyObject) {
        UserSession.instance.tipPercent = TippyUtil.tipIndexToValue(index: tipSelector.selectedSegmentIndex)
        calculateTip()
    }
    
    func calculateTip() {
        let bill = Double(UserSession.instance.billAmount) ?? 0
        let tipPercent = UserSession.instance.tipPercent
        let tip = bill * (Double(tipPercent) / 100.0)
        let total = bill + tip
        
        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
    }
    
    func setTheme() {
        if (UserSettings.instance.darkTheme) {
            setDarkTheme()
        } else {
            setLightTheme()
        }
    }
    
    func setDarkTheme() {
        topView.backgroundColor = ViewController.darkThemeTopViewColor
        bottomView.backgroundColor = ViewController.darkThemeBottomViewColor
        
        billField.textColor = ViewController.darkThemeTextColor
        tipLabelLabel.textColor = ViewController.darkThemeTextColor
        tipLabel.textColor = ViewController.darkThemeTextColor
        totalLabelLabel.textColor = ViewController.darkThemeTextColor
        totalLabel.textColor = ViewController.darkThemeTextColor
        
        topView.tintColor = UIColor.lightText
    }
    
    func setLightTheme() {
        topView.backgroundColor = ViewController.lightThemeTopViewColor
        bottomView.backgroundColor = ViewController.lightThemeBottomViewColor
        
        billField.textColor = ViewController.lightThemeTextColor
        tipLabelLabel.textColor = ViewController.lightThemeTextColor
        tipLabel.textColor = ViewController.lightThemeTextColor
        totalLabelLabel.textColor = ViewController.lightThemeTextColor
        totalLabel.textColor = ViewController.lightThemeTextColor
        
        topView.tintColor = UIColor.darkText
    }
}

