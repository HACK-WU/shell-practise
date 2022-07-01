#!/usr/bin/python
#encoding:utf-8

# _*_ coding : utf-8 _*_
# @Time : 2022/6/30 17:45
# @Author : HackWu
# @File : test01

import smtplib
import ssl
from email.message import EmailMessage
def send_email(email_info):
    key=email_info.get("key")      
    EMAIL_ADDRESS=email_info.get("sender")     #换成你的邮箱地址
    EMAIL_PASSWORD=key          #邮件秘钥
    smtp=smtplib.SMTP('smtp.qq.com',25)         #邮件协议


    context=ssl.create_default_context()
    sender=email_info.get("sender")            #发件邮箱
    receiver=email_info.get("receiver")
    #收件邮箱

    subject=email_info.get("subject")             #邮件主题
    body=email_info.get("body")       #邮件正文
    msg=EmailMessage()
    msg['subject']=subject       #邮件主题
    msg['From']=sender           #发件地址
    msg['To']=receiver           #目标地址
    msg.set_content(body)        #邮件内容

    with smtplib.SMTP_SSL("smtp.qq.com",465,context=context) as smtp:
        smtp.login(EMAIL_ADDRESS,EMAIL_PASSWORD)
        smtp.send_message(msg)

if __name__ == '__main__':
    subject="给hackwu的邮件";
    email_body="天天开心！！！"
    email_info={
        "sender":"hackwu@qq.com",             #发件方的邮件地址
        "key":"*************",             #发件方的SMTP服务授权码
        "receiver":"hackwu@qq.com",       #收件方的邮件地址
        "subject":subject,                    #主题内容
        "body":email_body                     #邮件正文内容
    }
    send_email(email_info)
    print("发送成功")
