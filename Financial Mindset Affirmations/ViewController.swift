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
        
        // code to randomize titles w/current affirmations goes here
        var number1 = Int.random(in: 0..<affirmationMessages.count)
        var number2 = Int.random(in: 0..<affirmationMessages.count)
        while number2 == number1 {
            number2 = Int.random(in: 0..<affirmationMessages.count)
        }
        var number3 = Int.random(in: 0..<affirmationMessages.count)
        while number3 == number1 || number3 == number2 {
            number3 = Int.random(in: 0..<affirmationMessages.count)
        }
        
        affirmationA.setTitle(affirmationMessages[number1].text, for: .normal)
        affirmationB.setTitle(affirmationMessages[number2].text, for: .normal)
        affirmationC.setTitle(affirmationMessages[number3].text, for: .normal)
        
        let center = UNUserNotificationCenter.current()
        
        // get permission for notifications
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        // notification content
        let content = UNMutableNotificationContent()
        content.title = "Today's affirmation"
        content.body = affirmationMessages[number1].text
        
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

// categories of affirmations (type-safe)
enum Category {
    case moneyMindset
    case income
    case budgeting
    case other
}

// data structure for the affirmations
struct Affirmation {
    var text = ""
    var category = Category.other
}

// list of affirmations
// (if list gets longer or changes then using a database would be better)
var affirmationMessages =
    [Affirmation(text: "I deserve a prosperous life", category: Category.moneyMindset),
     Affirmation(text: "Money is a tool that can change my life for the better", category: Category.moneyMindset),
     Affirmation(text: "I control money, money doesn't control me", category: Category.moneyMindset),
     Affirmation(text: "Money flows to me freely as I move through this world", category: Category.moneyMindset),
     Affirmation(text: "I can use money to create a better life", category: Category.moneyMindset),
     Affirmation(text: "My finances don't scare me because I have a plan", category: Category.moneyMindset),
     Affirmation(text: "I am worthy of a solid financial foundation", category: Category.moneyMindset),
     Affirmation(text: "Money can expand the opportunities of my life", category: Category.moneyMindset),
     Affirmation(text: "Negative emotions about money don't serve my financial goals", category: Category.moneyMindset),
     Affirmation(text: "I am a very capable person that can tackle all money obstacles", category: Category.moneyMindset)
    ]
