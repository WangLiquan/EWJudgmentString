//
//  ViewController.swift
//  EWJudgmentString
//
//  Created by Ethan.Wang on 2018/9/25.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import UIKit

let screenHeight = UIScreen.main.bounds.width

class ViewController: UIViewController {

    private let phoneTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 24, y: 100, width: screenHeight - 48, height: 35))
        textField.placeholder = "请输入您的手机号"
        textField.keyboardType = .phonePad
        return textField
    }()
    private let smsTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 24, y: 150, width: screenHeight - 48, height: 35))
        textField.placeholder = "请输入您收到的验证码"
        textField.keyboardType = .numberPad
        return textField
    }()
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 24, y: 200, width: screenHeight - 48, height: 35))
        textField.placeholder = "请输入您的密码"
        textField.keyboardType = .asciiCapable
        return textField
    }()
    private let passwordSureTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 24, y: 250, width: screenHeight - 48, height: 35))
        textField.placeholder = "请确认您输入的密码"
        textField.keyboardType = .asciiCapable
        return textField
    }()
    private let sureButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 350, width: screenHeight - 200, height: 50))
        button.setTitle("确认", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(onClickSureButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "字符串验证"
        drawMyView()
    }
    private func drawMyView(){
        self.view.addSubview(phoneTextField)
        self.view.addSubview(smsTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(passwordSureTextField)
        self.view.addSubview(sureButton)
    }
    @objc private func onClickSureButton(){
        if  let phone = phoneTextField.text,
            let sms = smsTextField.text,
            let password = passwordTextField.text,
            let passwordSure = passwordSureTextField.text
        {
            ///进行判断
            let (isVerify, message) = UserVerifyService.verifyInput(phone: phone, code: sms, password: password, passwordSure: passwordSure)
            ///判断结果,如果failed
            if !isVerify {
                ///message: 失败原因
                if let message = message {
                    EWToast.showCenterWithText(text: message, duration: 1)
                }
                return
            }
        }
        EWToast.showCenterWithText(text: "全部填写正确", duration: 1)
    }


}

