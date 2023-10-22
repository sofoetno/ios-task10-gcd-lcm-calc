import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var num1TextField: UITextField!
    @IBOutlet weak var switchMode: UISwitch!
    
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var num2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        var isValid = true
        
        let num1Value = num1TextField.text ?? ""
        let num2Value = num2TextField.text ?? ""
        
        if num1Value == "" {
            markAsInvalid(field: num1TextField)
            isValid = false
        }
        
        if num2Value == "" {
            markAsInvalid(field: num2TextField)
            isValid = false
        }
        
        if !isValid {
            return
        }
        
        let num1 = Int(num1Value)
        let num2 = Int(num2Value)
        
        if num1 == nil {
            markAsInvalid(field: num1TextField)
            isValid = false
        }
        
        if num2 == nil {
            markAsInvalid(field: num2TextField)
            isValid = false
        }
        
        if !isValid {
            return
        }
        
        markAsValid(field: num1TextField)
        markAsValid(field: num2TextField)
        
        var calculate = 0

        if switchMode.isOn {
            calculate = calculateGcd(num1: num1!, num2: num2!)
        } else {
            calculate = calculateLcm(num1: num1!, num2: num2!)
        }
        
        resultLabel.text = "Result: \(String(calculate))"
    }
    
    
    @IBAction func switcherClicked(_ sender: UISwitch) {
        if sender.isOn {
            modeLabel.text = "GCD"
        } else {
            modeLabel.text = "LCM"
        }
    }
    
    func calculateGcd(num1: Int, num2: Int) -> Int {
        var x = num1
        var y = num2
        
        while y != 0 {
            let temp = x
            x = y
            y = temp % y
        }
        
        return abs(x)
    }
    
    func calculateLcm(num1: Int, num2: Int) -> Int {
        return (num1 * num2) / calculateGcd(num1: num1, num2: num2)
    }
    
    func markAsInvalid(field: UITextField!) {
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.red.cgColor
        field.layer.cornerRadius = 5.0
    }
    
    func markAsValid(field: UITextField!) {
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.cornerRadius = 5.0
    }
}

