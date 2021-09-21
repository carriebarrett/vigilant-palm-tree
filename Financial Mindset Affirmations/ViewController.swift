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
        
        // code to update titles w/current affirmations goes here
        affirmationA.setTitle(affirmationMessages[0].text, for: .normal)
        
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

enum Category {
    case moneyMindset
    case income
    case budgeting
    case other
}

struct Affirmation {
    var text = ""
    var category = Category.other
}

var affirmationMessages =
    [Affirmation(text: "I deserve a prosperous life", category: Category.moneyMindset),
     Affirmation(text: "Money is a tool that can change my life for the better", category: Category.moneyMindset),
     Affirmation(text: "I control money, money doesn't control me", category: Category.moneyMindset)]
