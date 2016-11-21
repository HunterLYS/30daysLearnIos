//
//  ViewController.swift
//  Project 01 Hello Ios
//
//  Created by qs on 2016/11/21.
//  Copyright © 2016年 YBX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var guess: UITextField!
    
    // arc4random_uniform(100) 是用于生成一个随机数，参数 100 的意思是在 0-99 中生成一个。
    var number = Int(arc4random_uniform(100))//保存每一局生成的数字
    var times = 0//猜测次数
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGame(_ sender: Any) {
        
        times = 0
        number = Int(arc4random_uniform(100))
    }

    @IBAction func sureEnter(_ sender: Any) {
        let result = guess.text!
        if let res = Int(result) {
            times += 1
            var message = ""
            if res > number {
                message = "你输入的\(res) 太大"
            }else if res < number {
                message = "你输入的数字\(res) 太小"
                
            }else {
                message = "猜中了！ 结果就是\(res), 你猜了 \(times) 次"
            }
            
            let alert1 = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action1 = UIAlertAction(title: "确定", style: .default, handler: nil)
            alert1.addAction(action1)
            present(alert1, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: nil, message: "输入0-99中的任意一个数字", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "确定", style: .default, handler: nil)
            alert.addAction(action)
            
            present(alert,animated: true,completion: nil)
            
            
        }

    }
}

