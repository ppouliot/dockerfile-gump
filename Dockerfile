FROM microsoft/windowsservercore
LABEL maintainer="peter@pouliot.net"
SHELL ["powershell", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue'; "]
RUN \
    # Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN \
    # Install Choco Package                                                                                                     
    choco install gump changelog gh-api-cli -Y ; \
    refreshenv ;
ENTRYPOINT ["C:\Program Files\gump\gump.exe"]