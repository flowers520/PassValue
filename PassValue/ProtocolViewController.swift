

import UIKit

//定义协议
protocol protocolVCDelegate{
    func getTextValue(title: String)
}

class ProtocolViewController: UIViewController {

    let screen = UIScreen.mainScreen().bounds.size
    let width: CGFloat = 40
    let height: CGFloat = 30
    
    var protocolText: UITextField!
    var protocolBtn: UIButton!
    
    var delegate: protocolVCDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orangeColor()
        
        setup()
    }

    //MARK: 界面设置
    func setup(){
        //确认按钮
        protocolBtn = UIButton(frame: CGRectMake((screen.width-width)/2, screen.height/2, width, height))
        protocolBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        protocolBtn.setTitle("确认", forState: .Normal)
        protocolBtn.addTarget(self, action: Selector("btnOk:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(protocolBtn)
        
        //输入传值的文本框
        protocolText = UITextField(frame: CGRectMake(10, screen.height/4, screen.width-20, height))
        protocolText.placeholder = "输入传值内容"
        protocolText.borderStyle = UITextBorderStyle.RoundedRect
        protocolText.becomeFirstResponder()
        self.view.addSubview(protocolText)
        
    }
    
    //MARK: action
    func btnOk(sender: UIButton){
        print("OK")
        delegate.getTextValue(protocolText.text!)
//        presentViewController(UIViewController(), animated: true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //MARK: 手势点击使键盘失去焦点
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches{
            let t: UITouch = touch as! UITouch
            if (t.tapCount == 1){
                protocolText.resignFirstResponder()
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
