# DSpectrumGUI

The goal of this app is to make it trivial to demodulate common RF signals, and provide a digital worksheet for your reverse engineering efforts.

![DSpectrumGUI Screenshot](https://raw.githubusercontent.com/tresacton/dspectrumgui/master/public/screenshot.png)

# Installation 
Step by step instructions for Kali Linux (Debian based OS), and MAC OSX, are both available in the wiki: 
<https://github.com/tresacton/dspectrumgui/wiki>


# Features
* Community can trivially donate reverse engineering worksheet templates
* Users can trivially import donated reverse engineering worksheet templates
* Ability to store device metadata and transmission binary
* Wraps Inspectrum and uses its "Extract Symbols" feature to help convert pulses into raw binary
* Automatic analysis of the binary to determine the modulation and encoding types (see Supported modulation types)
* Some error detection and verbose comments where the app believes it knows which modulation type would have been valid if the user better aligned the symbols in Inspectrum (particularly where significant whitespace was missed in PWM or where symbols are misaligned for Manchester)
* Reverse Engineering Worksheet to help you visualise the packet structure and comment on sections of the signal
* Binary Generation for RFCat transmission

# How does it work?
Once you have created a new "Device" and "Unit", you can click the link "Add New Capture". The application will then spawn an instance of Inspectrum. Once you've appropriately adjusted your symbol/grid overlay in Inspectrum, and asked it to "extract symbols", DSpectrumGUI will then convert that data into a binary string and attempt to automatically demodulate/decode it for you. It also provides a database for you to store pertinent information such as the frequency, baudrate, and FCC ID of the device for your future reference.

When you have some demodulated signals and navigate to the "Reverse Engineering Worksheet" for the device, DSpectrumGUI will present you with a form that allows you to define your own definitions for each section of the data (e.g. marking the first 'n' bits as the Device Identifier string - if that's what you discover they represent), and record your notes/observations about that section as you are working. This is very useful as you are reverse engineering your device. It allows you to keep all of your notes and observations in once place, in a structured and organised manner. Once you're satisfied with your demodulation and reverse engineering, you can choose to share your section definitions as a template for other DSpectrumGUI users to benefit from. 

The reverse engineering worksheet view also helps you to view some common binary to integer translations for your defined sections, and gives you some code you can use to attempt to generate your own signals using RFCat. 

# Supported Modulation/Encoding
* Pulse-width Modulation (PWM) - 77/25 duty cycle version, and 66/33 duty cycle version
* Frequency Shift Keying (2FSK) - though the app will treat it as OOK
* On-off Keying (OOK) / Amplitude Shift Keying (ASK)
* Manchester encoding - both "G. E. Thomas" format, and "IEE 802" format

# Usage
The wiki will be updated as I have time. In the interim, there's a high-level PDF guide I developed for a workshop which demonstrates the basic use of this application. It's available here: <https://github.com/tresacton/dspectrumgui/raw/master/public/DSpectrumGUI%20%E2%80%93%20Reverse%20Engineering%20Guide.pdf>

## License
Licensing is AGPL by default. An MIT license is available for purchase for commercial use. 

 
 
