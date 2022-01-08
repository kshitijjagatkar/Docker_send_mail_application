# Docker_send_mail_application
A shell script which sends an e-mail from docker container using postfix service.


1. Project Summary
2. Project Components, Installation & Run
3. File Descriptions
5. Results

## 1. Project Summary
 I recently got understanding about docker & here I'm sharing my work in which a shell script sends an email by taking email parameters such as recipient's
 mail ID, subject of the mail & messege  that want to send. It's pretty basic task & exciting also, we could take this example as a single microservice which is
 running in isolated container. I use postfix service which is a free and open-source mail transfer agent that routes and delivers e-mail. let's get started with
 project components & files.
 
## 3. Project Components, Installation & Run
This project has two main things: 1. docker setup & 2. postfix configuration.
1.   Docker setup:
     * This is main starting point. just remember this things to create a docker container we need an docker image & to create an image we need dockerfile.
     * Step1 dockerfile: which has all our applications, dependencies, environment varibales, files, & even commands that you would want to run after creating.
                    basically we are defining our software/application how we want to be, just like we used to define a virtual machine. these things will
                    will need while creating an image. In our case we need ubuntu to run our script, also we updating source using command, & lastly
                    copying our script file(email.sh) from host machine into docker container.
     * Step2 Docker Image: go to folder where our dockerfile is resting, & run this command to create docker image: "sudo docker build -t yourImageName ."
                    "." represents the current location of the dockerfile
     * Step3 Docker Container: Now to create a docker container we need this command: "sudo run -it --name=yourContainerName image_id" this will create a
                    container & runs interactively. you will see you will be in docker container. Now we can interact with our ubuntu image just like we do
                    normally, now we have to configure postfix mail server.
2.  Postfix
    * Step1: first thing, update Ubuntu so it has the latest packages installed: "sudo apt-get update && sudo apt-get upgrade"
    * Step2: Install postfix: "sudo apt-get install postfix" & Use you keyboard to select Internet Site for the type of mail configuration.
    * Step3: Get google App Password(don't use personal password.), Just search this you will get it with few steps.
    * Step4: Configure SASL with Your Gmail Credentials. SASL, which stands for Simple Authentication and Security Layer, is basically what it sounds like. SASL                makes it easy for applications to authenticate with various internet technologies. Create a the file /etc/postfix/sasl/sasl_passwd and add your Gmail              address and app password to it like this using editor: [smtp.gmail.com]:587 mailid@gmail.com:yourapppasswordgoeshere
    * Step5: create a hash database file with the following postmap command. sudo postmap /etc/postfix/sasl/sasl_passwd
    * Step6: One more configuration file to edit here. In order to tell Postfix to use Gmail servers to send mail, set the relay value in the /etc/postfix/main.cf              file. mydestination = $myhostname, localhost, localhost.localdomain
              relayhost = [smtp.gmail.com]:587
              mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
    * Also, add the following to the end of /etc/postfix/main.cf to enable SASL authentication for Postfix.
               # Enable SASL authentication
                smtp_sasl_auth_enable = yes
                smtp_sasl_security_options = noanonymous
                smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd
                smtp_tls_security_level = encrypt
                smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt

    * Step7: Finally, restart Postfix to apply our configuration changes. sudo systemctl restart postfix
    * Step8: To send the mail just Run the shell script. ./email.sh
 
## 4. File Structure
* | - Docker_send_mail
  
  | |- Dockerfile  #dockerfile
  
  | |- email.sh #Shell script to send mail
  
## 5. Results
You will recieve an email if all setup is configured correctly.




    

