*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library  OperatingSystem
*** variables ***
${CHROME_DRIVER_PATH}    ${EXECDIR}\\drivers\\chromedriver.exe
${URL_GALICIA}   https://www.bancogalicia.com/banca/online/web/Personas
${CHROME_BROWSER}    chrome 
${IMPLICIT_WAIT}    10