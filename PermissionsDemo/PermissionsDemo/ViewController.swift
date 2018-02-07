//
//  ViewController.swift
//  PermissionsDemo
//
//  Created by PisK on 2018/2/1.
//  Copyright © 2018年 PisK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(frame: CGRect(x: (self.view.frame.size.width - 150) / 2, y: 200, width: 150, height: 60))
        button.backgroundColor = UIColor.brown
        button.addTarget(self, action: #selector(ShowClick), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    @objc func ShowClick() {
        
        PisPermissionsModel.ShowView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

