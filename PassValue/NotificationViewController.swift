//
//  NotificationViewController.swift
//  PassValue
//
//  Created by jim on 16/8/17.
//  Copyright © 2016年 jim. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    
    let screen = UIScreen.mainScreen().bounds.size
    let width: CGFloat = 40
    let height: CGFloat = 30
    
    var notificationBtn: UIButton!
    var notificationText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orangeColor()
        setup()
    }

    //MARK: setup
    func setup(){
        //按钮
        notificationBtn = UIButton(frame: CGRectMake((screen.width-width)/2, (screen.height-height)/2, width, height))
        notificationBtn.setTitle("确认", forState: .Normal)
        notificationBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        notificationBtn.addTarget(self, action: Selector("btnOk:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(notificationBtn)
        
        //text
        notificationText = UITextField(frame: CGRectMake(10, (screen.height-height)/3, screen.width-20, height))
        notificationText.placeholder = "输入通知传值"
        notificationText.borderStyle = UITextBorderStyle.RoundedRect
        notificationText.becomeFirstResponder()
        self.view.addSubview(notificationText)
        
    }
    
    //MARK:action
    func btnOk(sender: UIButton){
        print("notification")
        
        let dataDic = NSMutableDictionary()
        dataDic.setValue(notificationText.text, forKey: "text")
        
        //注册通知
        let notification = NSNotification(name: "notificationPassData", object: nil, userInfo: dataDic as [NSObject: AnyObject])
        //发送通知
        NSNotificationCenter.defaultCenter().postNotification(notification)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches{
            let t: UITouch = touch as! UITouch
            if (t.tapCount == 1){
                notificationText.resignFirstResponder()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
