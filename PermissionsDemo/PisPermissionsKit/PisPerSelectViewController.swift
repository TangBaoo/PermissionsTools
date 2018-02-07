//
//  PisPerSelectViewController.swift
//  PermissionsDemo
//
//  Created by PisK on 2018/2/5.
//  Copyright © 2018年 PisK. All rights reserved.
//

import UIKit

class PisPerSelectViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        if #available(iOS 8.0, *) {
            self.modalPresentationStyle = .overCurrentContext
        } else {
            self.modalPresentationStyle = .currentContext
        }
        let color = UIColor.black
        self.view.backgroundColor = color.withAlphaComponent(0.7)
        
        let single = UITapGestureRecognizer(target: self, action: #selector(hideView))
        self.view.addGestureRecognizer(single)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
    }
    
    func setUI() {
        
        let vc = PisPerSelectView(frame: CGRect(x: (self.view.frame.size.width - 240) / 2, y: 150, width: 240, height: 320))
        self.view.addSubview(vc)
    }
    
    @objc func hideView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
