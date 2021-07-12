//
//  ViewController.swift
//  TranslationDemo
//
//  Created by Xinrui gao on 9/7/21.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var labelTesting: UILabel!
    @IBOutlet weak var labelCurrentLanguage: UILabel!
    
    let dropDown = DropDown()
    let languageArray = ["English", "Chinese", "Malay","Hindi"]
    let languageCodeArray = ["en", "zh-Hans", "ms","hi"]
    let refreshEntireController = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Screen"
        // Do any additional setup after loading the view.
        dropDown.anchorView = dropDownView
        dropDown.dataSource = languageArray
        
        // Top of drop down will be below the anchorView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            //change language label text to selected language
            labelCurrentLanguage.text = languageArray[index]
            UserDefaults.standard.setValue(self.languageCodeArray[index], forKey: "locale")
            
            if(refreshEntireController==true){
                //call viewDidLoad() to reload the entire controller, which will also update texts to selected language
                viewDidLoad()
            }else{
                self.configureView()                
            }
        }
        
    }
    
    // ONLY update the label texts to selected language WITHOUT refreshing the entire controller
    func configureView(){
        self.labelWelcome.text = "Welcome to first screen".localizedString()
        self.labelTesting.text = "First testing label".localizedString()
    }
    
    @IBAction func dropDownOnTap(_ sender: Any) {
        dropDown.show()
    }
    
}

