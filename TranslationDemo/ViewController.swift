//
//  ViewController.swift
//  TranslationDemo
//
//  Created by Xinrui gao on 9/7/21.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var labelTesting: UILabel!
    @IBOutlet weak var labelCurrentLanguage: UILabel!
    
    @IBOutlet weak var dropDownView: UIView!
    let dropDown = DropDown()
    let languageArray = ["English", "Chinese", "Malay","Hindi"]
    let languageCodeArray = ["en", "zh-Hans", "ms","hi"]
    
    let refreshEntireController = false
    
    override func viewDidLoad() {
        print("print for testing purposes for git commit")
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
            
            //change user default language of app to perform translation function
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
        print("print for testing purposes for git commit")
        print("added new stuff to test")
        self.labelWelcome.text = "testing".localizedString()
        self.labelTesting.text = "First testing label".localizedString()
    }
    
    // Button on tap action
    @IBAction func dropDownOnTap(_ sender: Any) {
        print("print for testing purposes for git commit")
        dropDown.show()
    }
    
}

