//
//  ViewController.swift
//  assignment2
//
//  Created by 丸山翔太郎 on 2020/10/20.
//

import UIKit
protocol ArithmeticOperation {
    var function: (Double, Double) -> Double { get }
}

struct Addition: ArithmeticOperation {
    let function: (Double, Double) -> Double = (+)
}

struct Subtraction: ArithmeticOperation {
    let function: (Double, Double) -> Double = (-)
}

struct Multiplication: ArithmeticOperation {
    let function: (Double, Double) -> Double = (*)
}

struct Division: ArithmeticOperation {
    let function: (Double, Double) -> Double = (/)
}

class ViewController: UIViewController {

    @IBOutlet weak private var leftNumField: UITextField!
    @IBOutlet weak private var rightNumField: UITextField!
    @IBOutlet weak private var fourArithmeticSegment: UISegmentedControl!
    @IBOutlet weak private var resultLabel: UILabel!

    @IBAction func tapSumButton(_ sender: Any) {
        let arithmeticOperation: ArithmeticOperation
        switch fourArithmeticSegment.selectedSegmentIndex {
            case 0: arithmeticOperation = Addition()
            case 1: arithmeticOperation = Subtraction()
            case 2: arithmeticOperation = Multiplication()
            case 3: arithmeticOperation = Division()
            default: fatalError("selectedSegmentIndex is invalid.")
        }

        let calcResult = calculation(arithmeticOperation: arithmeticOperation)
        resultLabel.text = calcResult
    }

    func calculation(arithmeticOperation: ArithmeticOperation)-> String {
        let leftNum = Double(leftNumField?.text ?? "0.0") ?? 0.0
        let rightNum = Double(rightNumField?.text ?? "0.0") ?? 0.0

        if arithmeticOperation is Division {
            guard rightNum != 0.0 else {
                return "0で除算しました"
            }
        }

        return String(arithmeticOperation.function(leftNum, rightNum))
    }
}

