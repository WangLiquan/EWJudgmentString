# EWJudgmentString
[![996.icu](https://img.shields.io/badge/link-996.icu-red.svg)](https://996.icu)

优雅的字符串判断拓展

# 实现功能:

优雅的实现通过一个外部方法判断多个输入字符串是否符合设定规则.

代码低耦合,拓展方便,使用方便.

实现手机号正则验证,以及邮箱账号正则验证.

<br>

![效果图预览](https://github.com/WangLiquan/EWJudgmentString/raw/master/images/demonstration.gif)

# 使用方法示例:
将EWUserVerifyService文件拖入项目,调用时:
```
if  let phone = phoneTextField.text,
    let sms = smsTextField.text,
    let password = passwordTextField.text,
    let passwordSure = passwordSureTextField.text
{
    ///进行判断
    let (isVerify, message) =   UserVerifyService.verifyInput(phone: phone, code: sms, password: password, passwordSure: passwordSure)
    ///如果failed
    if !isVerify {
        ///message:失败原因
        if let message = message {
            EWToast.showCenterWithText(text: message, duration: 1)
        }
        return
    }
}
EWToast.showCenterWithText(text: "全部填写正确", duration: 1)
```
