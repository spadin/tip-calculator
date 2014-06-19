//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Sandro Padin on 6/15/14.
//  Copyright (c) 2014 Sandro Padin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var totalTextField : UITextField
  @IBOutlet var taxPercentageLabel : UILabel
  @IBOutlet var taxPercentageSlider : UISlider
  @IBOutlet var resultsTextView : UITextView
  
  var percentage : CFloat = 0.0
  var billTotal : CFloat = 0.0
                            
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    updateResultsTexView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func taxPercentageChanged(sender : AnyObject) {
    updatePercentage()
    updatePercentageLabel()
    updateResultsTexView()
  }
  
  @IBAction func billTotalChanged(sender : AnyObject) {
    updateBillTotal()
    updateResultsTexView()
  }
  
  func updateResultsTexView() {
    let results = billTotal * (1 + (percentage/100))
    resultsTextView.text = NSString(format:"%.2f", results)
  }
  
  func setup() {
    setupResultsTextView()
    setupTaxPercentageSlider()
  }
  
  func setupTaxPercentageSlider() {
    taxPercentageSlider.setThumbImage(UIImage(named: "sliderhandle"), forState: UIControlState.Normal)
    taxPercentageSlider.setThumbImage(UIImage(named: "sliderhandle"), forState: UIControlState.Highlighted)
  }
  
  func setupResultsTextView() {
    resultsTextView.selectable = false
  }
  
  func updateBillTotal() {
    billTotal = totalTextField.text.bridgeToObjectiveC().floatValue
  }
  
  func updatePercentage() {
    percentage = roundf(taxPercentageSlider.value * 2.0) / 2.0
  }
  
  func updatePercentageLabel() {
    let percentageStr = NSString(format: "%.2f", percentage)
    taxPercentageLabel.text = "Tax Percentage (\(percentageStr)%):"
  }
}

