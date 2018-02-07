//
//  PisPerSelectView.swift
//  PermissionsDemo
//
//  Created by PisK on 2018/2/5.
//  Copyright © 2018年 PisK. All rights reserved.
//

import UIKit
import Photos
import AddressBook

class PisPerSelectView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    let perArray = ["相机权限","相册权限","位置权限","麦克风权限","通讯录权限"];
    var locationManager:CLLocationManager!
    let addressBook: ABAddressBook = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.white
        setUI()
    }
    
    func setUI() {
        
        for item in 0...perArray.count - 1 {
            
            let button = UIButton(frame: CGRect(x: 20, y: 20 + item * 60, width: 200, height: 40))
            button.setTitle(perArray[item], for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.cornerRadius = 20
            button.tag = 101 + item
            button.setTitleColor(UIColor(red: 1, green: 0.49, blue: 0.11, alpha: 1), for: .normal)
            button.addTarget(self, action: #selector(PerDetection(sender:)), for: .touchUpInside)
            self.addSubview(button)
        }
        reloadButtonState()
    }
    
    // 提示权限
    @objc func PerDetection(sender: UIButton) {
        
        PisPermissionsModel.getCurrentVC().dismiss(animated: true, completion: nil)
        if sender.title(for: .normal) == "相机权限" {
            getPerCamera()
        }
        else if sender.title(for: .normal) == "相册权限" {
            getPerPhoto()
        }
        else if sender.title(for: .normal) == "位置权限" {
            getPerGPS()
        }
        else if sender.title(for: .normal) == "麦克风权限" {
            getPerMc()
        }
        else if sender.title(for: .normal) == "通讯录权限" {
            getPerPhone()
        }
    }
    
    // 获取相机权限
    func getPerCamera() {
        
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        if status == .notDetermined {
            print("正在选择是否授权");
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (bool) in
                
            })
        }
            // 已经拒绝访问
        else if status == .restricted || status == .denied{
            showAlertSetting()
        }
            // 已经授权
        else if status == .authorized {
            print("已经授权");
        }
    }
    
    // 获取相册权限
    func getPerPhoto() {
        
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .notDetermined {
            print("正在选择是否授权");
            PHPhotoLibrary.requestAuthorization({ (status2) in
                
            })
        }
            // 已经拒绝访问
        else if status == .restricted || status == .denied{
            showAlertSetting()
        }
            // 已经授权
        else if status == .authorized {
            print("已经授权");
        }
    }
    
    // 获取位置权限
    func getPerGPS() {
        
        let status = CLLocationManager.authorizationStatus()
        
        if status == .authorizedWhenInUse || status == .authorizedAlways{
            print("已经获得定位权限")
        }
        else if status == .notDetermined {
            print("正在选择是否授权");
            locationManager = CLLocationManager()
            locationManager.requestWhenInUseAuthorization()
        }
        else if status == .denied || status == .restricted {
            showAlertSetting()
        }
    }
    
    // 获取麦克风权限
    func getPerMc() {
        
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        
        if status == .notDetermined {
            print("正在选择是否授权");
            AVCaptureDevice.requestAccess(for: .audio, completionHandler: { (bool) in
                
            })
        }
            // 已经拒绝访问
        else if status == .restricted || status == .denied{
            showAlertSetting()
        }
            // 已经授权
        else if status == .authorized {
            print("已经授权");
        }
    }
    
    // 获取通讯录权限
    func getPerPhone() {
        
        let status = ABAddressBookGetAuthorizationStatus()
        
        if status == .notDetermined {
            print("正在选择是否授权");
            ABAddressBookRequestAccessWithCompletion(addressBook, { (granted, error) in
                
            })
        }
            // 已经拒绝访问
        else if status == .restricted || status == .denied{
            showAlertSetting()
        }
            // 已经授权
        else if status == .authorized {
            print("已经授权");
        }
    }
    
    func reloadButtonState() {
        
        DispatchQueue.main.async {
            
            let bu1 : UIButton = self.viewWithTag(101) as! UIButton
            let bu2 : UIButton = self.viewWithTag(102) as! UIButton
            let bu3 : UIButton = self.viewWithTag(103) as! UIButton
            let bu4 : UIButton = self.viewWithTag(104) as! UIButton
            let bu5 : UIButton = self.viewWithTag(105) as! UIButton
            
            let status1 = AVCaptureDevice.authorizationStatus(for: .video)
            if status1 == .authorized {
                bu1.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)
            } else {
                bu1.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
            }
            
            let status2 = PHPhotoLibrary.authorizationStatus()
            if status2 == .authorized {
                bu2.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)
            } else {
                bu2.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
            }
            
            let status3 = CLLocationManager.authorizationStatus()
            if status3 == .authorizedWhenInUse || status3 == .authorizedAlways {
                bu3.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)
            } else {
                bu3.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
            }
            
            let status4 = AVCaptureDevice.authorizationStatus(for: .audio)
            if status4 == .authorized {
                bu4.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)
            } else {
                bu4.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
            }
            
            let status5 = ABAddressBookGetAuthorizationStatus()
            
            if status5 == .authorized {
                bu5.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)
            } else {
                bu5.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)
            }
        }
    }
    
    func showAlertSetting() {
        
        let alert = UIAlertController(title: "温馨提示", message: "是否进入系统设置", preferredStyle: .alert)
        let action = UIAlertAction(title: "取消", style: .cancel) { (sender) in
            
        }
        let action2 = UIAlertAction(title: "进入", style: .default) { (sender) in
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(NSURL(string: UIApplicationOpenSettingsURLString)! as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(NSURL(string: UIApplicationOpenSettingsURLString)! as URL)
            }
        }
        alert.addAction(action)
        alert.addAction(action2)
        
        PisPermissionsModel.getCurrentVC().showDetailViewController(alert, sender: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

