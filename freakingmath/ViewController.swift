//
//  ViewController.swift
//  freakingmath
//
//  Created by Vũ Khoa Đức on 19/05/2017.
//  Copyright © 2017 Duc Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modePlay(_ sender: UIButton) {
//        self.performSegue(withIdentifier: "modePlay", sender: nil)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ModePlayViewController") as! modePlayViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
