//
//  ViewController.swift
//  0_0 - Empty Template (Swift)
//
//  Created by Justin Reina on 11/12/15.
//  Copyright © 2015 Jaostech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIAlertViewDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.translatesAutoresizingMaskIntoConstraints = false;
        
        print("ViewController.viewDidLoad():       viewDidLoad() complete");
        
        return;
    }


    override func viewDidAppear(_ animated: Bool) {

        self.doAlertControllerDemo();                               /* this can't be called in view did load! :(                    */
        
        return;
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();

        return;
    }

    
    func doAlertControllerDemo() {

        var inputTextField: UITextField?;
        
        let passwordPrompt = UIAlertController(title: "Enter Password", message: "You have selected to enter your passwod.", preferredStyle: UIAlertControllerStyle.alert);
        
        passwordPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            // Now do whatever you want with inputTextField (remember to unwrap the optional)

            let entryStr : String = (inputTextField?.text)! ;
    
            print("BOOM! I received '\(entryStr)'");
            
            self.doAlertControllerDemo();       /* do again! */
        }));

        
        passwordPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            print("done");
        }));

        
        passwordPrompt.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = false       /* true here for pswd entry */
            inputTextField = textField
        });
        
        
        self.present(passwordPrompt, animated: true, completion: nil);
        

        return;
    }
}

