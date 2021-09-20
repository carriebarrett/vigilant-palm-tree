//
//  ViewController.swift
//  Financial Mindset Affirmations
//
//  Created by Carrie Barret on 9/19/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // get affirmation buttons
    @IBOutlet weak var affirmationA: UIButton!
    
    @IBOutlet weak var affirmationB: UIButton!
    
    @IBOutlet weak var affirmationC: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        affirmationA.setTitle("Affirmation goes here", for: .normal)
        
        let center = UNUserNotificationCenter.current()
        
        // get permission for notifications
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey I'm a notification"
        content.body = "Look at me!"
        
        // notification trigger
        let date = Date().addingTimeInterval(10)
    
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // notification request
        let uuidString = UUID().uuidString
        
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // register the request with notification center
        center.add(request) { (error) in
            // check for and handle any errors
        }
        
    }


}

class affirm1 {
    var text = "I deserve a prosperous life"
    var category = "Money Mindset"
    var id = 101
}

class affirm2 {
    var text = "Money is a tool that can change my life for the better"
    var category = "Money Mindset"
    var id = 102
}

class affirm3 {
    var text = "I control money, money doesn't control me"
    var category = "Money Mindset"
    var id = 103
}

//var affirmationMessages = [1: affirm1,
  //                         2: affirm2,
    //                       3: affirm3]
