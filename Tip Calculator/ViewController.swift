import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tenPercentButton: UIButton!
    
    @IBOutlet var twentyfivePercentButton: UIButton!
    @IBOutlet var twentyPercentButton: UIButton!
    @IBOutlet var fifteenPercentButton: UIButton!
    @IBOutlet var displayAmount: UILabel!
    @IBOutlet var tipObject: UILabel!
    @IBOutlet var GrandTotalObject: UILabel!
    
    @IBOutlet var getMoney: UITextField!
    @IBOutlet var displayPeople: UILabel!
    @IBOutlet var downPeople: UIButton!
    @IBOutlet var upPeople: UIButton!
    var using = 0.0
    var people = 1.00
    
    /** 
    When submit is pressed, calculate and display the total amounts
    **/
    @IBAction func submitAmount(sender: AnyObject) {
        if(getMoney.text != nil && getMoney.text != ""){
            let totalNoTip:Double = Double(getMoney.text!)!
            let total = totalNoTip + totalNoTip*using
            let result = total / people
            let formatter = NSNumberFormatter()
            self.view.endEditing(true)
            formatter.numberStyle = .CurrencyStyle
            displayAmount.text = "Cost per Person: " + formatter.stringFromNumber(result)!
            GrandTotalObject.text = "Grand Total: " + formatter.stringFromNumber(total)!
            tipObject.text = "Total Tip: " + formatter.stringFromNumber(totalNoTip*using)!
            
        }
        
    }

    
    /** 
    Increment up 1 person 
    **/
    @IBAction func upPersonAction(sender: AnyObject) {
        people++
        if(people == 1){
            displayPeople.text = String(String(Int(people)) + " person")
        }
        else{
            displayPeople.text = String(String(Int(people)) + " people")
        }
    }
    
    /** 
    Increment down 1 person 
    **/
    @IBAction func downPersonAction(sender: AnyObject) {
        if(people > 1){
            people--
            if(people == 1){
                displayPeople.text = String(String(Int(people)) + " person")
            }
            else{
                displayPeople.text = String(String(Int(people)) + " people")
            }
        }
    }
    
    /** 
    Select the 10-percent button 
    **/
    @IBAction func tenperAction(sender: AnyObject) {
        let tenper = UIImage(named: "10Selected.png")
        tenPercentButton.setImage(tenper, forState: UIControlState.Normal)
    
        
        using = 0.10
    }
    
    /** 
    Select the 15-percent button 
    **/
    @IBAction func fifteenperAction(sender: AnyObject) {
        using = 0.15
        
    }
    
    /** 
    Select the 20-percent button 
    **/
    @IBAction func twentyPerAction(sender: AnyObject) {
               using = 0.20
    }
    
    /** 
    Select the 25-percent button 
    **/
    @IBAction func twentyfivePerAction(sender: AnyObject) {
        
        using = 0.25
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayPeople.text = String(String(Int(people)) + " person")
        
        fifteenperAction(self)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /** 
    Moves the screen when keyboard is opened and closed 
    **/
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 200
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 200
    }
    
    
    
    
}

