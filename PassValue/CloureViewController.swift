

import UIKit
//闭包传值
typealias cloureCallBack = (title: String) -> Void

class CloureViewController: UIViewController {

    let screen = UIScreen.mainScreen().bounds.size
    let width:CGFloat = 40
    let height: CGFloat = 30
    
    var cloureBtn: UIButton!
    var cloureText: UITextField!
    
    //定义闭包
    var callBack: cloureCallBack!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.orangeColor()
        setup()
    }

    //MARK: setup
    func setup(){
        //确认
        cloureBtn = UIButton(frame: CGRectMake((screen.width-width)/2, (screen.height-height)/2, width, height))
        cloureBtn.setTitle("确认", forState: .Normal)
        cloureBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
        cloureBtn.addTarget(self, action: Selector("btnOk:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(cloureBtn)
        
        //闭包传值
        cloureText = UITextField(frame: CGRectMake(10, (screen.height-height)/3, screen.width-20, height))
        cloureText.placeholder = "输入闭包传入值"
        cloureText.becomeFirstResponder()
        cloureText.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(cloureText)
        
    }
    
    //MARK: action
    func btnOk(sender: UIButton){
        print("cloure")
        
        self.callBack(title: cloureText.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: 点击键盘焦点失效
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches{
            let t: UITouch = touch as! UITouch
            if (t.tapCount == 1){
                cloureText.resignFirstResponder()
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
