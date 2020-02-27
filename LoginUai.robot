*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Usuario_C}      matiasandres.cantoni@alumnos.uai.edu.ar
${Usuario_I}      matias.cantoni@alumnos.uai.edu.ar
${Contraseña_C}    Nisman123.
${Contraseña_I}    assadas
${Usuario_noInstitucional}    matiasandres.cantoni@gmail.com
${Usuario_Sin@}    matiasandres.cantoni

*** Test Cases ***
Navegacion
    Open Browser    https://www.uai.edu.ar/    chrome
    Set window Size    1920    1080
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@class="top-bar"]
    Sleep    3
    Click Element    xpath=//a[contains(@href, '/auth/login')]
    Switch Window    url=https://www.uai.edu.ar/auth/login
    Wait Until Element Is Visible    name=Username
    Input Text    name=Username    ${Usuario_C}
    Input Password    name=Password    ${Contraseña_C}
    Capture Page Screenshot
    Click Element    xpath=//*[@type="submit"]
    Sleep    3
    #Capture Page Screenshot
    Click Element    xpath=//a[contains(@href, '/miuai/estado-situacion?carrera=T1')]
    Sleep    3
    Go Back
    Wait until Element is visible    xpath=//*[@class='navbar-brand miuai-logo']
    Sleep    3
    Click Element    xpath=//*[@class="d-none d-sm-inline-block miuai-name"]
    Sleep    5
    Click Element    xpath=//*[@href="/logout"]
    Capture Page Screenshot
    Go Back
    Sleep    5
    Capture Page Screenshot
    close Browser

Usuario incorrecto Elemento visible
    Open Browser    https://www.uai.edu.ar/    chrome
    Set window Size    1920    1080
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@class="top-bar"]
    Sleep    5
    Click Element    xpath=//a[contains(@href, '/auth/login')]
    Switch Window    url=https://www.uai.edu.ar/auth/login
    Wait Until Element Is Visible    name=Username
    Input Text    name=Username    ${Usuario_I}
    Input Password    name=Password    ${Contraseña_C}
    Click Element    xpath=//*[@type="submit"]
    Capture Page Screenshot
    Element Should Be Visible    xpath=//a[contains(@href, '/miuai/estado-situacion?carrera=T1')]
    Sleep    2
    Close Browser

Usuario incorrecto
    Open Browser    https://www.uai.edu.ar/    chrome
    Set window Size    1920    1080
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@class="top-bar"]
    Sleep    5
    Click Element    xpath=//a[contains(@href, '/auth/login')]
    Switch Window    url=https://www.uai.edu.ar/auth/login
    Wait Until Element Is Visible    name=Username
    Input Text    name=Username    ${Usuario_I}
    Input Password    name=Password    ${Contraseña_C}
    Click Element    xpath=//*[@type="submit"]
    Sleep    2
    Click Element    xpath=//*[contains(text(),'Cerrar')]
    Capture Page Screenshot
    Close Browser

Contraseña incorrecta
    Open Browser    https://www.uai.edu.ar/    chrome
    Set window Size    1920    1080
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@class="top-bar"]
    Sleep    5
    Click Element    xpath=//a[contains(@href, '/auth/login')]
    Switch Window    url=https://www.uai.edu.ar/auth/login
    Wait Until Element Is Visible    name=Username
    Input Text    name=Username    ${Usuario_C}
    Input Password    name=Password    ${Contraseña_I}
    Click Element    xpath=//*[@type="submit"]
    Sleep    2
    Click Element    xpath=//*[contains(text(),'Cerrar')]
    Capture Page Screenshot
    Close Browser

Correo sin '@'
    Open Browser    https://www.uai.edu.ar/    chrome
    Set window Size    1920    1080
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@class="top-bar"]
    Sleep    5
    Click Element    xpath=//a[contains(@href, '/auth/login')]
    Switch Window    url=https://www.uai.edu.ar/auth/login
    Wait Until Element Is Visible    name=Username
    Input Text    name=Username    ${Usuario_Sin@}
    Input Password    name=Password    ${Contraseña_C}
    Click Element    xpath=//*[@type="submit"]
    Capture Page Screenshot
    Sleep    2
    Close Browser

Usuario No institucional
    Open Browser    https://www.uai.edu.ar/    chrome
    Set window Size    1920    1080
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@class="top-bar"]
    Sleep    5
    Click Element    xpath=//a[contains(@href, '/auth/login')]
    Switch Window    url=https://www.uai.edu.ar/auth/login
    Wait Until Element Is Visible    name=Username
    Input Text    name=Username    ${Usuario_noInstitucional}
    Input Password    name=Password    ${Contraseña_I}
    Click Element    xpath=//*[@type="submit"]
    Capture Page Screenshot
    Sleep    2
    Click Element    xpath=//*[contains(text(),'Cerrar')]
    Close Browser
