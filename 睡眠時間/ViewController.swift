//
//  ViewController.swift
//  睡眠時間
//
//  Created by 武井　太紀 on 2019/12/21.
//  Copyright © 2019 武井　太紀. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var shushinLabel: UILabel!
    
    @IBOutlet var kishouLabel: UILabel!
    
    @IBOutlet var intervalLabel: UILabel!
    
    var buttonPushFlag: Bool = false
    
    var kishouDate: Date!
    var shushinDate: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pushRecordButton() {
        if buttonPushFlag {
            kishouDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
            let string = formatter.string(from: kishouDate)
            
            // 起床ラベル
            kishouLabel.text = string
    
            buttonPushFlag = false
            
            print(getIntervalDays(date: kishouDate, anotherDay: shushinDate))
            
            let seconds = Int(getIntervalDays(date: kishouDate, anotherDay: shushinDate))
            let hour = seconds / 3600
            let minute = (seconds % 3600) / 60
            let second = (seconds % 3600) % 60
            
            intervalLabel.text = String("\(hour)時間\(minute)分\(second)秒")
            
            
        } else {
            shushinDate = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
            let string = formatter.string(from: shushinDate)
            
            shushinLabel.text = string
            
            buttonPushFlag = true
            
            
        }
    }
    
    func getIntervalDays(date:Date?,anotherDay:Date? = nil) -> Double {
        
        var retInterval:Double!
        
        if anotherDay == nil {
            retInterval = date?.timeIntervalSinceNow
        } else {
            retInterval = date?.timeIntervalSince(anotherDay!)
        }
    
        return retInterval // n日
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
