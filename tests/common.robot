*** Settings ***

Library  Selenium2Library  timeout=5  implicit_wait=5

*** Keywords ***

Start app and open browser
    Open browser  http://localhost/localdev_oc7/htdocs/

Stop app and close all browsers
    Close all browsers
