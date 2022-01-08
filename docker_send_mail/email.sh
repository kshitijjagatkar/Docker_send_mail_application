#!/bin/bash

echo "Please enter sender's mail_id"
read -t 25 e_id
if [ -n "$e_id" ];
then
        echo "you'r mail id is: $e_id"
else
        echo "No input for mail_id provided"
fi


echo "Please enter email subject"
read -t 60 email_sub
if [ -n "$email_sub" ];
then 
        echo "you'r email subject is: $email_sub"
else
        echo "No input for email_sub is provided"
fi


echo "Please enter email body"
read -t 300 mail_body
if [ -n "$mail_body" ];
then
        echo "you'r mail body is: $mail_body"
else
        echo "No input for mail_body is provided"
fi

echo "type send to send mail & cnl to cancle"
read cnf
if [[ "$cnf" == "send" ]];
then
        echo -e "To:${e_id}\nSubject:${email_sub}\n${mail_body}" | sendmail -t "${e_id}"
        echo "\n Mail sent "
else
        echo "Mail has not sent."
fi

