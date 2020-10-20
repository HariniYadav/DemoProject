# DemoProject

In this project, test scripts were written to automate some testing scenarios related to real time actions on different type of applications using __Robot Framework__.

---

__Set-Up__

1. Python 3 interpreter
2. Pycharm community edition for IDE


---


__Automation Framework__

In this project, __Robot Framework__ was used as a Automation Framework to write the test scripts.

Robot Framework is a generic open source automation framework for acceptance testing, acceptance test driven development (ATDD), and robotic process automation (RPA). It has simple plain text syntax and it can be extended easily with libraries implemented using Python or Java. The core framework is implemented using Python and also runs on Jython (JVM) and IronPython (.NET).

The syntax for describing these test cases is based on a __Keyword Driven Testing__ approach and a __table format__.

KEYWORD-DRIVEN TESTING is a scripting technique that uses data files to contain the keywords related to the application being tested. These keywords describe the set of actions that is required to perform a specific step.

- __Installation__

  > If Python and pip installed, run the below command in command prompt
    ```
    pip install --upgrade robotframework
    ```
   
  > Install the package __robotframework__ in project interpreter settings of current project on Pycharm.

  
---


__Applications Used__

In this project, the test scripts were written on the below type of applications

  - __UI__ [link](https://demo.nopcommerce.com/)
  - __API__ [link](https://robotmetrics.netlify.com/)
  - __Hybrid__ (combination of both UI and API) [UI-link](https://github.com/) and [API-link](https://api.github.com/)


---


__Libraries Used__

In this project, below libraries are used:-

__1.__ __SeleniumLibrary__

SeleniumLibrary is a web testing library for Robot Framework that utilizes the Selenium tool internally.

- __Installation__

  > For SeleniumLibrary installation, run the below command in command prompt
    ```
    pip install --upgrade robotframework
    ```
  
  > Install the package __robotframework-seleniumlibrary__ in project interpreter settings of current project on Pycharm.
 
  > Install all the required browsers and operating system specific browser drivers used in the project. The general approach to install a browser driver is downloading a right     driver, such as chromedriver for Chrome, and placing it into a directory that is in PATH.
  
  > Add __IntelliBot@seleniumlibrary__ plugin on Pycharm
  
 - __How to use in project__
  
  ```
    Library SeleniumLibrary
  ```
  
__2.__ __RequestsLibrary__
   
RequestsLibrary is used to help in making the HTTP requests to a API.

- __Installation__

  > For RequestsLibrary installation, run the below command in command prompt
    ```
    pip install robotframework-requests
    ```
  
  > Install the package __robotframework-requests__ in project interpreter settings of current project on Pycharm.
  
 - __How to use in project__
  
  ```
    Library RequestsLibrary
  ```

 __3.__ __Collections__
   
Collections is Robot Framework's standard library that provides a set of keywords for handling Python lists and dictionaries. This library has keywords, for example, for modifying and getting values from lists and dictionaries (e.g. Append To List, Get From Dictionary) and for verifying their contents (e.g. Lists Should Be Equal, Dictionary Should Contain Value)

- __How to use in project__
  
  ```
    Library Collections
  ```

---


__Page Object Model__

In this project, used to create the test scripts based on Page Object Model(POM).

Here all the locators related to the web page and user-defined keywords are created in Resource File. This file is imported to the test file and required keywords are used for the actions to get happened.


---


__Data Driven Testing__

In this project, approached a concept of Data Driven Testing while writing the test scripts.

DATA DRIVEN TESTING is a test automation framework that stores test data in a table or spreadsheet format. This allows automation engineers to have a single test script that can execute tests for all the test data in the table.

__DataDriver__ is used/imported as Library but does not provide keywords which can be used in a test. DataDriver uses the Listener Interface Version 3 to manipulate the test cases and creates new test cases based on a Data-File that contains the data for Data-Driven Testing. These data file may be .csv , .xls or .xlsx files.

- __Installation__

  > For Data installation, run the below command in command prompt
    ```
    pip install --upgrade robotframework-datadriver
    ```
  
  > Install the package __robotframework-datadriver__ in project interpreter settings of current project on Pycharm.
  
  > For excel file support of xls or xlsx file you need to install the extra XLS or the dependencies. It contains the dependencies of pandas, numpy and xlrd.
    ```
    pip install --upgrade robotframework-datadriver[XLS]
    ```

- __How to use in project__
  
  ```
    Library     DataDriver     file=<<path of the data input file>>  sheet_name=<<sheet name>>
  ```

---


__Packages Used__

Below are other packages used in the project:-

__1.__ __robotframework-jsonlibrary__
   
This package is a Robot Framework test library for manipulating JSON object.

- __Installation__

  > For robotframework-jsonlibrary installation, run the below command in command prompt
    ```
    pip install -U robotframework-jsonlibrary
    ```
  
  > Install the package __robotframework-jsonlibrary__ in project interpreter settings of current project on Pycharm.
  
  
 __2.__ __robotframework-pabot__
   
This package is a Robot Framework parallel test runner used for running the test scripts parallely at one time.

- __Installation__

  > For robotframework-pabot installation, run the below command in command prompt
    ```
    pip install -U robotframework-pabot
    ```
  
  > Install the package __robotframework-pabot__ in project interpreter settings of current project on Pycharm.
  
 -  __How to use in project__
 
  > Following is the command can be used to run 3 processes parallely by giving its directory name alone where these test scripts are stored and also can store the resultant         report files (log.html, output.xml and report.html) in a desired directory
   ```
    pabot --processes 3 --outputdir <<path of desired directory where the reports needs to be stored>> <<path of directory where the test scripts exists>>
   ```    


---


__Actions Used__

Below were some actions used in the project

__1.__ __Waits__

Following are different type of waits used in Robot Framework:

 - __Sleep__
    
  Whereever we want to wait for sometime, add sleep before the statement. Bydefault the wait time is 0 seconds.
  ```
   sleep 3
  ```
  
 - __Selenium Speed__
 
  This is used to add delay time for every statement in the test script. Bydefault the delay time is 0 seconds.
  ```
   set selenium speed 3 seconds
   
   get selenium speed
  ``` 

- __Selenium Timeout__

 This is used to add maximum time to wait until the given element is appeared on the webpage. Bydefault the maximum timeout is 5 seconds.
 ```
   set selenium timeout 10 seconds
   
   wait until page contains  <<text>>
  ``` 
 This timeout is applicable only for that particular statement.
 
- __Implicit Wait__

 This is used to add maximum time to wait until the element got located with the given locator and this time is applicable to all web elements written in the test script.
 
 Bydefault the wait time is 0 seconds.
 ```
   set selenium implicit wait 10 seconds
 ```
 
__2.__ __Mouse Over__

 Simulates hovering the mouse over the element locator.
 ```
   mouse over  link:<<locator>>
   
   click link  link:<<locator>>
 ```

__3.__ __Scrolling__

 Simulates scrolling on the webpage until particular element is found. Also helps in scrolling to the end of page and to the top of the page.
 
 Following are examples to show how to use __Execute Javacscript__ keyword for performing the scrolling in different scenarios
 
 > Scroll on webpage until certain element is located where its pixel number is used as a locator.
   ```
    execute javascript  window.scrollTo(0,1500)
   ```
 > Scroll until end of the webpage
   ```
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
   ```
 > Scroll until top of the webpage
   ```
    execute javascript  window.scrollTo(0,-document.body.scrollHeight)
   ```
 > Scroll on webpage until certain element is located by using its locator.
   ```
    scroll element into view    xpath:<<locator>>
   ```
   

---


__Robot Framework Metrics Report__

Creates awesome HTML (dashboard view) report by parsing robotframework output.xml file

- __How it works__

1. Read output.xml file using robotframework API

2. Get Suite, Test Case , Keyword , Status and Elapsed time values

3. Convert data to html report using Beautifulsoup
  
- __Installation__
  
  > Install the package __robotframework-metrics__ in project interpreter settings of current project on Pycharm.

- __How to use in project__
  
  Following are the robotmetrics commands used to generate reports in different cases
  
  > Case 1: No change in output.xml, log.html file name's and user is in same folder
   ```
   robotmetrics
   ```
   
  > Case 2: RobotFramework Metrics Report __metric-timestamp.html__ file will be created in current folder | `-inputpath` if specified

   Note: From v3.1.6 users can specify __custom_report_name__ instead of __metrics-timestamp.html__
   ```
   robotmetrics -M regression_metrics.html
   ```
  
  > Case 3: Customize specific custom logo in robotmetrics report by using --logo command line option
   ```
   robotmetrics --logo ../Apple-Logo.png -M regression_metrics.html
   ```
 
- __Help Option__
  
  > For more info on command line options use:
   ```
   robotmetrics --help
   ```
 
 ---
 
 
__Embed a file__

There is feasibility to embed links in robot framework log by different ways

__1. Adding links via log__

  Instead of just putting a simple text we can also put a HTML Hyperlink.

  ```
   log   <a href="file://path of the data input file">Input Data File<a>    html=True
   ```
__2. Adding links via free test suite metadata__

  We can use metadata in your test suites. Those metadata can contains external links and will add those links in output.xml and report.html files.
  
  ```
   *** Settings ***
   Metadata   Input Data File    <<file://path of the data input file>>
   ```
  
---
  
