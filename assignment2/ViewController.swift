//
//  ViewController.swift
//  assignment2
//
//  Created by 丸山翔太郎 on 2020/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var leftNumField: UITextField!
    @IBOutlet weak private var rightNumField: UITextField!
    @IBOutlet weak private var fourArithmeticSegment: UISegmentedControl!
    @IBOutlet weak private var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapSumButton(_ sender: Any) {
        let calcResult = calculation(fourArithmeticSegment.selectedSegmentIndex)

        
        resultLabel.text = calcResult
    }
    
    func calculation(_ operator:Int)-> String{
        var calcResult:Double
        let leftNum = Double(leftNumField?.text ?? "0.0") ?? 0.0
        let rightNum = Double(rightNumField?.text ?? "0.0") ?? 0.0
        switch `operator`{
        case 0:
            calcResult = leftNum + rightNum
        case 1:
            calcResult = leftNum - rightNum
        case 2:
            calcResult = leftNum * rightNum
        default:
            if(rightNum == 0.0){
                return "0で除算しました"
            }else{
                calcResult = leftNum / rightNum
            }
        }
        return String(calcResult)
    }
    
    
    
}

