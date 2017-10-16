//
//  modePlayViewController.swift
//  freakingmath
//
//  Created by Vũ Khoa Đức on 19/05/2017.
//  Copyright © 2017 Duc Vu. All rights reserved.
//

import UIKit

class modePlayViewController: UIViewController {
    @IBOutlet weak var Calculator: UILabel!
    @IBOutlet weak var resultCalculator: UILabel!
    @IBOutlet weak var viewGameOver: UIView!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblBestScore: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var lbPoint: UILabel!
    var string = ""
    var currentIsTrue=false
    var currentPoint = 0
    var bestPoint = 0
    var timeCount = 300
    var timer = Timer()
    
    func timerAction() {
        timeCount -= 1
        lblTime.text = "\(timeCount/100)s \(timeCount%100)ms"
        if(timeCount == 0)
        {
            gameOver();
            
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
        startGame();
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Truth(_ sender: UIButton) {
        if (currentIsTrue ){
            currentPoint = currentPoint+1;
            lbPoint.text = "\(currentPoint)"
            randNewOperator();
        }else{
            gameOver()
        }
    }
    @IBAction func False(_ sender: UIButton) {
        if (!currentIsTrue ){
            currentPoint = currentPoint+1;
            lbPoint.text = "\(currentPoint)"
            randNewOperator();
        }else{
            gameOver()
        }
    }
    @IBAction func btnMenu(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeController") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func btnPlayAgain(_ sender: Any) {
        startGame()
    }
    
    func startGame(){
        currentPoint = 0;
        lbPoint.text = "\(currentPoint)"
        randNewOperator()
        viewGameOver.isHidden = true;
        
        
        timeCount = 300
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        lblTime.text = "\(timeCount)"

    }
    
    func gameOver(){
        timer.invalidate()
        
        lblScore.text = "Score: \(currentPoint)"
        lblBestScore.text = "Best: \(getBestPoint())"
        viewGameOver.isHidden = false;
        
        
        
    }
    
    func randNewOperator() {
        let randomNum = arc4random_uniform(10)
        let number1 = Int(randomNum)
        let number2 = Int(randomNum)
        let number3 = Int(arc4random_uniform(1)) - Int(arc4random_uniform(3))
        let number4 = number1 + number2 + number3
        if number4 == number1+number2 {
            currentIsTrue = true
        }else{
            currentIsTrue = false
        }
        Calculator.text = "\(number1)+\(number2)"
        resultCalculator.text = "=\(number4)"
        
        if(currentPoint < 5){
            timeCount = 300
        }
        else{
            if(currentPoint < 10){
                timeCount = 200
            }
            else{
                timeCount = 100
            }
        }
        
    }
    
    func getBestPoint() ->Int{
        let userDefaults = UserDefaults.standard
        let bestPointTmp = userDefaults.integer(forKey: "bestScore")
        
        if(bestPointTmp > currentPoint){
            bestPoint = bestPointTmp;
            return bestPointTmp;
        }else{
            userDefaults.set(currentPoint, forKey: "bestScore")
            bestPoint = currentPoint;
            return currentPoint;
        }
    }
    

    /*
     Để làm project này, cần có kiến thức về: 
     Chuyển View : "doesn't contain a view controller with identifier swift" Keyword
     Button Play: Game
     NSuserDefautls ( Set object/Int/Bôlean) : Best Score
     Random: arc4random
     Inteval: Đếm thời gian
     Model View: Kết quả của game
     Animation
     
    */

}
