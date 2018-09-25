//
//  EWUserVerifyService.swift
//  EWJudgmentString
//
//  Created by Ethan.Wang on 2018/9/25.
//  Copyright © 2018年 Ethan. All rights reserved.
//
import Foundation

enum VerifyResult {
    case ok     ///正确
    case empty  ///为空
    case failed(message: String)  ///错误,返回错误原因
}

class UserVerifyService {
    /// 验证手机号
    ///
    /// - Parameter phone: 手机号
    class func verifyPhone(_ phone:String) -> VerifyResult {
        guard phone.count != 0 else {
            return .empty
        }
        guard Validate.phoneNum(phone).isRight else {
            return .failed(message: "请输入正确手机号")
        }
        return .ok
    }
    /// 验证验证码
    class func verifyCode(_ code:String) -> VerifyResult {
        guard code.count != 0 else {
            return .empty
        }
        guard code.count == 6 else {
            return .failed(message: "请输入正确6位验证码")
        }
        return .ok
    }
    /// 验证昵称
    class func verifyNick(_ nick:String) -> VerifyResult {
        if nick.count == 0 {
            return .empty
        }
        return .ok
    }
    /// 验证密码
    class func verifyPassword(_ password:String) -> VerifyResult {
        if password.count == 0 {
            return .empty
        }
        if !(password.count >= 6
            && password.count <= 12) {
            return .failed(message: "请输入6-12位的密码")
        }
        return .ok
    }
    /// 验证手机号,返回状态以及原因
    class func verifyInput(phone:String) -> (Bool,String?) {
        switch UserVerifyService.verifyPhone(phone) {
        case .empty:
            return (false, "请输入手机号")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        return (true, nil)
    }
    /// 验证用户名密码
    ///
    /// - Parameters:
    ///   - userName: 用户名
    ///   - password: 密码
    /// - Returns: (状态,原因)
    class func verifyInput(userName:String, password:String) -> (Bool,String?) {
        switch UserVerifyService.verifyPhone(userName) {
        case .empty:
            return (false, "请输入手机号")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyPassword(password) {
        case .empty:
            return (false, "请输入密码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        return (true, nil)
    }
    /// 验证用户名,验证码,密码
    ///
    /// - Parameters:
    ///   - userName: 用户名
    ///   - code: 验证码
    ///   - password: 密码
    /// - Returns: (状态,原因)
    class func verifyInput(userName:String,code:String,password:String) -> (Bool,String?) {
        switch UserVerifyService.verifyPhone(userName) {
        case .empty:
            return (false, "请输入手机号")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyCode(code) {
        case .empty:
            return (false,"请输入验证码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyPassword(password) {
        case .empty:
            return (false,"请输入密码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        return (true, nil)
    }
    /// 验证昵称,手机号,验证码,密码,确认密码
    ///
    /// - Parameters:
    ///   - nickName: 昵称
    ///   - phone: 手机号
    ///   - code: 验证码
    ///   - password: 密码
    ///   - passwordSure: 确认密码
    /// - Returns: (状态,原因)
    class func verifyInput(nickName:String,phone:String,code:String,password:String,passwordSure:String) -> (Bool,String?) {
        switch UserVerifyService.verifyNick(nickName) {
        case .empty:
            return (false, "请输入昵称")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyPhone(phone) {
        case .empty:
            return (false, "请输入手机号")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyCode(code) {
        case .empty:
            return (false,"请输入验证码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyPassword(password) {
        case .empty:
            return (false,"请输入密码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyPassword(passwordSure) {
        case .empty:
            return (false,"请确认密码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        guard password == passwordSure else {
            return (false,"两次密码不一致")
        }
        return (true, nil)
    }
    /// 验证手机号,验证码,密码,确认密码
    ///
    /// - Parameters:
    ///   - phone: 手机号
    ///   - code: 验证码
    ///   - password: 密码
    ///   - passwordSure: 确认密码
    /// - Returns: (状态,原因)
    class func verifyInput(phone:String,code:String,password:String,passwordSure:String) -> (Bool,String?) {
        switch UserVerifyService.verifyPhone(phone) {
        case .empty:
            return (false, "请输入手机号")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyCode(code) {
        case .empty:
            return (false,"请输入验证码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyPassword(password) {
        case .empty:
            return (false,"请输入密码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        switch UserVerifyService.verifyPassword(passwordSure) {
        case .empty:
            return (false,"请输入确认密码")
        case .failed(let message):
            return (false, message)
        default:
            break
        }
        guard password == passwordSure else {
            return (false,"两次密码不一致")
        }
        return (true, nil)
    }
}

/// 正则验证格式
///
/// - phoneNum: 验证手机号格式block
/// - email: 验证邮箱格式block
enum Validate {
    ///需要拓展可以添加相应block以及相应状态,类似身份证等等
    case phoneNum(_: String)
    case email(_: String)

    var isRight: Bool {
        ///正则表达式字符串
        var predicateStr:String!
        ///需要验证的字符串
        var currObject:String!
        switch self {
        case let .phoneNum(str):
            predicateStr = "^1(3|4|5|6|7|8|9)[0-9]\\d{8}$"
            currObject = str
        case let .email(str):
            predicateStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            currObject = str
        }
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: currObject)
    }
}


