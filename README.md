# Logfather Swag Shop
A simple docker application for learning SQL Injection

## Introduction

This is a simple docker application using Ubuntu 16.04 xenial, apache2 httpd (2.4), php (7.0) and mariadb (10), a classical LAMP stack, to
create a vulnerable web application - Logfather Swag Shop. Logfather Swag Shop is insecurely coded and has a simple SQL injection flaw. It can be used to learn and practice SQL injection. 

> The term "Mama Shop" means a small convenient store in Singapore. In the 70s to 90s, many of these small business store serve residents 
> living nearby. As Singapore develops, these Mama shops gradually disappear, replaced by modern stores owned by big business chain. 
> Logfather Swag Shop has a SQL vulnerability. Can you find it ?

## Disclaimer and Warning

Computer misuse is a serious crime in Singapore and other countries, punishable by law. The source code and instructions provided here are for educational purposes only; meant to help IT defenders understand about SQL Injection vulnerabilities and better defend their systems and applications. It should not be misused for any other purposes. 

Logfather Swag Shop(VMS) is an insecure application and should not be exposed on the internet or an internal network. Doing so can result in a system or network compromise. It should only be used in an isolated test lab environment that is meant for security testing and learning. VMS is released under the MIT license. Read the license, the author is not responsible for any damage direct or indirect that arise from using VMS. Use VMS solely at your own risk !

## Installation

The application is packaged as a Docker application. Clone and download a copy for the application

    git clone https://github.com/ngchianglin/VulnerableMamaShop.git

Change into the directory and build using docker

    cd VulnerableMamaShop
    docker build -t mamashop .

## Running the Docker Application

To run it interactively

    docker run -it --rm -p 8000:80 mamashop

This will make Mamashop available at http://localhost:8000 or http://[ip address]:8000

Do not expose Logfather Swag Shop to the internet, it is an insecure application and can lead to a system or network compromise. 
Use it in an isolated test lab environment meant for security testing and learning. 
 
To run Logfather Swag Shop in detached mode

    docker run -d --rm -p 8000:80 mamashop
    
Note the mariadb database is restored each time the docker container is started up.     

## Finding the SQL Injection Flaw

A intercepting proxy like OWASP ZAP or Blurpsuite can be used to inspect and alter the traffic between the browser and Mama Shop. 
Mama Shop is deliberately kept simple, it should be relatively easy to find the SQL injection flaw. 

See if you can dump out the list of customers in Mama Shop. To gain the most understanding, it is advised that the user 
do this systematically, step by step. Find out where the SQL vulnerability is and proceed to gather information on the database. 
and finally dump out the customer list. 

For a more detailed walkthrough, refer to the article [https://www.nighthour.sg/articles/2018/learning-sql-injection-using-vulnerable-mama-shop.html](https://www.nighthour.sg/articles/2018/learning-sql-injection-using-vulnerable-mama-shop.html)



## Source signature
Gpg Signed commits are used for committing the source files. 

> Look at the repository commits tab for the verified label for each commit, or refer to [https://www.nighthour.sg/git-gpg.html](https://www.nighthour.sg/git-gpg.html) for instructions on verifying the git commit. 
>
> A userful link on how to verify gpg signature is availabe here [https://github.com/blog/2144-gpg-signature-verification](https://github.com/blog/2144-gpg-signature-verification)




