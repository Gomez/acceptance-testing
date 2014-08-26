*** Settings ***

Library  Selenium2Library  timeout=5  implicit_wait=5

*** Variables ***

${BROWSER} =  Firefox
${REMOTE_URL} =
${DESIRED_CAPABILITIES} =  platform:Linux
${BUILD_NUMBER} =  manual
${OWNCLOUD_URL}  http://localhost/


*** Keywords ***

Start browser
    ${BUILD_INFO} =  Set variable
    ...           build:${BUILD_NUMBER},name:${SUITE_NAME} | ${TEST_NAME}
    Open browser  ${OWNCLOUD_URL}  ${BROWSER}
    ...           remote_url=${REMOTE_URL}
    ...           desired_capabilities=${DESIRED_CAPABILITIES},${BUILD_INFO}

Stop app and close all browsers
    Close all browsers
