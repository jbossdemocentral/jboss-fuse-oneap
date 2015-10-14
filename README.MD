JBoss Fuse on EAP
====================

Demo based on JBoss Fuse and JBoss EAP products to highlight different ways to develop Camel application on JBoss EAP

  * Spring DSL. (Demo01)
  * Route XML with JNDI (Demo02)
  * Java DSL with CDI (Demo03)

This demo allow user to calculate the exchanged value of the currency and amount of their choice. it goes show how to 
  
  * Add Camel Route
  * Register Java Bean
  * Lookup Java Bean
  * Look up datasources
  * Provide Restful Service
  * Expose Servlets

Install on your machine
----------------------------------

1. [Download and unzip.](https://github.com/weimeilin79/fuseeapdemo/archive/master.zip). If running on Windows, it is recommended the project be extracted to a location near the root drive path due to limitations of length of file/path names.

2. Add products to installs directory.In this case you will need JBoss EAP and JBoss Fuse EAP patch installer.

3. Run 'init.sh'

4. Start the JBoss EAP server by going target/jboss-eap-6.4/, Run standalone.sh or standalone.bat. if you are using WINDOWS, must run with Administrative privileges.

5. And you are ready to go. In your browser, goto  
     ```
     http://localhost:8080/demo01-0.0.1-SNAPSHOT/
     ```
6. Enjoy Demo!

If you like to deploy others, please login to 
  	 ```
  		http://localhost:9990 with ID/PWD : admin/jbosseap1!
     ```

1. Go to Runtime -> Server -> Manage Deployments

2. Undeploy demo01(Spring DSL) application by removing it.   

3. Deploy demo02(XML with JNDI) or demo03(Java DSL with CDI) by adding the war file from projects/demo0*/target/

4. Remember to Enable the application

5. Go to 
	   ```
     http://localhost:8080/demo02-0.0.1-SNAPSHOT/
     ```
     or 
     ```
     http://localhost:8080/demo03-0.0.1-SNAPSHOT/
     ```

12. Enjoy the other demos!



Supporting Articles
-------------------
[Develop Application via Spring DSL](http://wei-meilin.blogspot.com/2015/11/red-hat-jboss-fuse-3-ways-to-develop.html)
[Develop Application via XML and JNDI](http://wei-meilin.blogspot.com/2015/11/red-hat-jboss-fuse-3-ways-to-develop.html)
[Develop Application via Java DSL with CDI](http://wei-meilin.blogspot.com/2015/11/red-hat-jboss-fuse-3-ways-to-develop_13.html)


Released versions
-----------------

- v1.0 is JBoss EAP 6.4.0, and JBoss Fuse  6.2.1.



![Shows deployment of first Demo](https://raw.githubusercontent.com/weimeilin79/fuseeapdemo/master/docs/01_deploydemo01.png)

![Shows undeployment of first Demo](https://raw.githubusercontent.com/weimeilin79/fuseeapdemo/master/docs/02_removedemo01.png)

![Shows enabling second demo](https://raw.githubusercontent.com/weimeilin79/fuseeapdemo/master/docs/03_enabledemo02.png)

![Currecy Dashboad Demo01](https://raw.githubusercontent.com/weimeilin79/fuseeapdemo/master/docs/04_Demo01.png)

![Currecy Dashboad Demo02] (https://raw.githubusercontent.com/weimeilin79/fuseeapdemo/master/docs/05_Demo02.png)


