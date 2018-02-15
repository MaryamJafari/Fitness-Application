//
//  ViewController.swift
//  Fitness
//
//  Created by Maryam Jafari on 10/7/17.
//  Copyright © 2017 Maryam Jafari. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    let stopColor = UIColor(red: 0.75, green: 0.0, blue: 0.0, alpha: 0.5)
    let startColor = UIColor(red: 0.0, green: 0.75, blue: 0.0, alpha: 0.5)
    var _numberOfSteps:Int! = nil
    var _floordes:Int! = nil
    var _floorAsc:Int! = nil
    var _totalDis:Int!
    var distance:Double! = nil
    var averagePace:Double! = nil
    var pace:Double! = nil
    var pedometer = CMPedometer()
    var timer = Timer()
    let timerInterval = 1.0
    var timeElapsed:TimeInterval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var steps: UILabel!
    @IBOutlet weak var statusTitle: UILabel!
    @IBOutlet weak var totalDistance: UILabel!
    @IBOutlet weak var floorsDes: UILabel!
    @IBOutlet weak var floorsAsc: UILabel!
    
    @IBAction func start(_ sender: UIButton) {
        startTimer()
        if sender.titleLabel?.text == "Start"{
            statusTitle.text = "On"
            pedometer = CMPedometer()
            startTimer()
            pedometer.startUpdates(from: Date(), withHandler: {(pedometerData, error) in
                
                if let pedData = pedometerData{
                    self._numberOfSteps = Int(truncating: pedData.numberOfSteps)
                    self._floorAsc = Int(truncating: pedData.floorsAscended!)
                    self._floordes = Int(truncating: pedData.floorsDescended!)
                    self._totalDis = Int(truncating: pedData.distance!)
                } else {
                    
                    self.steps.text = "Steps: Not Available"
                    self.floorsDes.text = "Floor counting is not available"
                    self.floorsAsc.text = "Floor counting is not available"
                    self.totalDistance.text = "Distance counting is not available"
                }
            })
            sender.setTitle("Stop", for: .normal)
            sender.backgroundColor = stopColor
            statusTitle.textColor = startColor
        } else {
            statusTitle.text = "Off"
            statusTitle.textColor = stopColor
            pedometer.stopUpdates()
            stopTimer()
            sender.backgroundColor = startColor
            sender.setTitle("Start", for: .normal)
        }
    }

    func startTimer(){
        
        if  timer.isValid { timer.invalidate() }
        timer = Timer.scheduledTimer(timeInterval: timerInterval,target: self,selector: #selector(timerAction(timer:)) ,userInfo: nil,repeats: true)
    }
    
    func stopTimer(){
        timer.invalidate()
        displayPedometerData()
    }
    
    @objc func timerAction(timer:Timer){
        displayPedometerData()
    }
    func displayPedometerData(){
        
        if let numberOfSteps = self._numberOfSteps{
            steps.text = String("\(numberOfSteps)")
        }
        if let floorAsc = self._floorAsc{
            floorsAsc.text = String("\(floorAsc)")
        }
        if let floordes = self._floordes{
            floorsDes.text = String("\(floordes)")
        }
        
        if let totalDis = self._totalDis{
            totalDistance.text = String("\(totalDis) m ")
        }
        
    }

}


