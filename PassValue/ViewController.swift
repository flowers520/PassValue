

import UIKit

class ViewController: UIViewController, protocolVCDelegate {

    let screen = UIScreen.mainScreen().bounds.size
    let width: CGFloat = 40
    let height: CGFloat = 30
    
    var protocolText: UITextField!
    var cloureText: UITextField!
    var notificationText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.orangeColor()
        
        setup()
    }

    //MARK: 界面设置
    func setup(){
        //协议传值
        let protocolBtn = UIButton(frame: CGRectMake(10, screen.height/4, width, height))
        protocolBtn.setTitle("协议", forState: UIControlState.Normal)
        protocolBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        protocolBtn.addTarget(self, action: Selector("btnProtocol:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(protocolBtn)
        
        protocolText = UITextField(frame: CGRectMake(60, screen.height/4, width*7, height))
        protocolText.placeholder = "协议传值"
        protocolText.borderStyle = UITextBorderStyle.RoundedRect
        protocolText.resignFirstResponder()
        self.view.addSubview(protocolText)
        
        //闭包传值
        let cloureBtn = UIButton(frame: CGRectMake(10, screen.height/2, width, height))
        cloureBtn.setTitle("闭包", forState: UIControlState.Normal)
        cloureBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        cloureBtn.addTarget(self, action: Selector("btnCloure:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cloureBtn)
        
        cloureText = UITextField(frame: CGRectMake(60, screen.height/2, width*7, height))
        cloureText.placeholder = "闭包传值"
        cloureText.borderStyle = UITextBorderStyle.RoundedRect
        cloureText.resignFirstResponder()
        self.view.addSubview(cloureText)
        
        //通知传值
        let notificationBtn = UIButton(frame: CGRectMake(10, screen.height/4*3, width, height))
        notificationBtn.setTitle("通知", forState: UIControlState.Normal)
        notificationBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        notificationBtn.addTarget(self, action: Selector("btnNotification:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(notificationBtn)
        
        notificationText = UITextField(frame: CGRectMake(60, screen.height/4*3, width*7, height))
        notificationText.placeholder = "通知传值"
        notificationText.borderStyle = UITextBorderStyle.RoundedRect
        notificationText.resignFirstResponder()
        self.view.addSubview(notificationText)
        
    }
    
    //点击屏幕使键盘失去焦点
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches{
            let t: UITouch = touch as! UITouch
            if (t.tapCount == 1){
                protocolText.resignFirstResponder()
                cloureText.resignFirstResponder()
                notificationText.resignFirstResponder()
            }
        }
    }
    
    //MARK: - action
    //协议传值
    func btnProtocol(sender: UIButton){
        print("protocol")
        let protocolVC = ProtocolViewController()
        protocolVC.title = "协议传值界面"
        protocolVC.delegate = self
        self.presentViewController(protocolVC, animated: true, completion: nil)
        
    }
    
    func getTextValue(title: String) {
        self.protocolText.text = title
    }
    
    
    //闭包传值
    func btnCloure(sender: UIButton){
        print("cloure")
//        cloureText.text = "cloure"
        let cloureVC = CloureViewController()
        cloureVC.title = "闭包传值界面"
        cloureVC.callBack = ({ (title: String) -> Void in
            self.cloureText.text = title
            
        })
        self.presentViewController(cloureVC, animated: true, completion: nil)
    }
    
    
    //通知传值
    func btnNotification(sender: UIButton){
        print("notification")
//        notificationText.text = "notification"
        
        let notificationVC = NotificationViewController()
        notificationVC.title = "通知传值界面"
        self.presentViewController(notificationVC, animated: true , completion: nil)
    }
    
    //接收通知
    override func viewDidAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("passNotification:"), name: "notificationPassData", object: nil)
    }
    
    //从通知函数中取值
    func passNotification(info: NSNotification){
        let text = info.userInfo!["text"] as! String
        if let str: String = text {
            self.notificationText.text = str
            NSNotificationCenter.defaultCenter().removeObserver(self, name: "notificationPassData", object: nil)
        }
    }

}

