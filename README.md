# The MVS 3.8j Tur(n)key 4- System Container

OS/VS2 MVS 3.8j Service Level 8505 Tur(n)key Level 4- Version 1.00

<img src="/img/terminal.gif"
     alt="Terminal"
     style="float: left; margin-right: 10px;" />

## Pull container
```docker pull goldimage/tk4:latest```

## Build container
```make```

## Run Container
```make run```

## Browser Clients

Connect to ip_address:8038
http://localhost:8038

## Terminal Clients

x3270 : c3270 : Mocha [tn3270](https://apps.apple.com/us/app/mocha-tn3270-lite/id871706308?mt=12)

## Install 3270 terminal

OS X - Install
    ```brew install x3270```
Linux - Install
    ```apt install x3270```
    ```apt install c3270```

## Connect Terminal

c3270 ip_address 3270 <- port configured

## Screenshots

Container Started:<br>
<img src="/img/tk4-01.png"
     alt="Container Started"
     style="float: left; margin-right: 10px;" />

Terminal Attached:<br>
<img src="/img/tk4-02.png"
     alt="Terminal Attached"
     style="float: left; margin-right: 10px;" />

Browser Monitoring:<br>
<img src="/img/tk4-03.png"
     alt="Browser Monitoring"
     style="float: left; margin-right: 10px;" />
