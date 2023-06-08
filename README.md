# Introduction
The DTMF (dual tone multi-frequency) is one kind of signaling system intended for identifying a push button on a DTMF keypad. A key can be formed by combining two sine wave tones. These tones are the frequencies of rows as well as column which are represented on the keypad of the DTMF. It activates the long-distance signaling to the entered key through the frequency of voice.

<p align="center">
<img width="360" height="360" src= "https://github.com/abdelazeem201/DTMF/assets/58098260/8a0c77b3-944f-4880-a5cd-a5673d7099e8">
</p>

In this keypad, if we push any input key on your handset, then immediately it gives two tones of particular frequencies, the first tone is a high-frequency one, as well as the second tone, is a low-frequency one. The following tabular form demonstrates different signals that you transmit whenever you push your mobile keypad.

# Generating DTMF Tones
A DTMF signal consists of the sum of two sinusoids – or tones – with frequencies taken from two mutually exclusive groups. These frequencies were chosen to prevent any harmonics from being incorrectly detected by the receiver as some other DTMF frequency. Each pair of tones contains one frequency of the low group (697 Hz, 770 Hz, 852 Hz, 941 Hz) and one frequency of the high group (1209 Hz, 1336 Hz, 1477 Hz) and represents a unique symbol. The frequencies allocated to the push-buttons of the telephone pad are shown below:

<p align="center">
<img width="360" height="360" src= "https://github.com/abdelazeem201/DTMF/assets/58098260/d630c836-657d-444f-bc9e-bd669dcd7a79">
</p>

Generate and plot a DTMF signal for each button on the telephone pad. Each signal has a sample rate of 8 kHz and a duration of 100 ms.
````````
symbol = {'1','2','3','4','5','6','7','8','9','*','0','#'};
[tones, Fs, f, lfg, hfg] = helperDTMFToneGenerator(symbol, false);
helperDFTEstimationPlot1(tones, symbol, Fs, f);
````````
<p align="center">
 <img width="1024" height="1024" src= "https://github.com/abdelazeem201/DTMF/assets/58098260/9f7d916a-be44-4b4d-8564-c7162bf07a8f">
</p> 
