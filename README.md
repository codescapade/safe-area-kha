# Safe Area Kha

Kha library to get the safe area on iOS devices so you can check where the notch is. Only works on iOS 11+. On older versions of iOS the insets return 0.


## Installation
Clone this repository into the Libraries folder of your Kha project and add the following line to your khafile.js:  
```
project.addLibrary('safeArea');
```

## Usage
To get the insets on all sides of the screen call:  
```
SafeArea.getInsets();
```  
This will return an Insets instance with the insets in screen pixels.
```
{
  left: 0,
  right: 0,
  top: 0,
  bottom: 0
}
```