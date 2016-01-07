//
//  ViewController.swift
//  One Rep Max Calculator
//
//  Created by Bradley C Kennedy on 9/3/15.
//  Copyright (c) 2015 Bradley C Kennedy. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    /*override func shouldAutorotate() -> Bool {
        return false
    }*/
    
    var array = [Double]()
    @IBOutlet weak var button: UIButton!
    
    /*override func supportedInterfaceOrientations() -> Int {
        return UIInterfaceOrientation.Portrait.rawValue
    }*/
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var reps: UITextField!
    @IBOutlet weak var weight: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //button.enabled = false
        reps.delegate = self
        weight.delegate = self
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    @IBAction func info(sender: UIButton) {
    }
    @IBAction func log(sender: UIButton) {
        array.append(mValue)
        let alertController = UIAlertController(title: "Alert", message:
            "Logged to History!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    @IBAction func calc(sender: UIButton) {
        println("test")
        let w = weight.text
        let r = reps.text
        
        var wnum = w.toInt()
        var rnum = r.toInt()
        if (rnum == nil) && (wnum == nil){
            alert(1)
        }
        else if rnum == nil{
            alert(2)
        }
        else if wnum == nil{
            alert(3)
        }
        else if rnum > 25 {
            alert(4)
        }
        else if wnum != nil && rnum != nil {
                mValue = wValue / (1.0278 - (rValue * 0.0278))
                mValue = round(mValue)
        }
        
    }
    private func alert(i: Int){
        //let alertController = UIAlertController(title: "Alert",
        var text1 = "Please enter "
        var text2 = "a valid integer value"
        var text3 = " for "
        var text4 = "Reps!"
        switch i{
            case 1:
                text2 = "valid integer values"
                text4 = "Weight and Reps!"
            case 2:
                break
            case 3:
                text4 = "Weight!"
            case 4:
                text1 = "Reps must be less than or equal to 25"
                text2 = ""
                text3 = ""
                text4 = ""
        default: break
        }
        let alertController = UIAlertController(title: "Alert", message:
            text1 + text2 + text3 + text4, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    var wValue:Double{
        get{
            return NSNumberFormatter().numberFromString(weight.text!)!.doubleValue
        }
        set{
            weight.text = "\(newValue)"
        }
    }
    var rValue:Double{
        get{
            return NSNumberFormatter().numberFromString(reps.text!)!.doubleValue
        }
        set{
            reps.text = "\(newValue)"
        }
    }
    var mValue:Double{
        get{
            return NSNumberFormatter().numberFromString(max.text!)!.doubleValue
        }
        set{
            max.text = "\(newValue)"
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "HistorySeg"){
            var destViewController : HistoryTableViewController = segue.destinationViewController as! HistoryTableViewController
                HistoryTableViewController.myArray.array.extend(array)
            array.removeAll()
        }
    }
}

