# Using ADB Over TCP/IP for Wireless Connection

ADB (Android Debug Bridge) allows you to debug and manage Android devices from your computer. This guide explains how to connect to an Android device wirelessly using ADB over TCP/IP.

## Prerequisites

- Android device with USB debugging enabled.
- Computer connected to the same Wi-Fi network as the Android device.
- ADB installed on your computer.

## Steps

1. **Connect via USB First**

   - Connect your Android device to your computer via USB.

2. **Find Your Device IP Address**

   - Open a terminal or command prompt.
   - Run the following command to find your device's IP address:
     ```
     adb shell ip -f inet addr show wlan0
     ```
     Note down the IP address displayed (e.g., `192.168.1.100`).

3. **Enable TCP/IP Connection**

   - Once you have the IP address, run the following command to switch ADB from USB to TCP/IP mode (replace `5555` with any port number you prefer):
     ```
     adb tcpip 5555
     ```

4. **Disconnect USB**

   - Disconnect your Android device from the USB cable.

5. **Connect Wirelessly**

   - To connect wirelessly, use the IP address obtained earlier:
     ```
     adb connect <device-ip-address>:5555
     ```
     For example:
     ```
     adb connect 192.168.1.100:5555
     ```

6. **Verify Connection**

   - To verify that your device is connected wirelessly, run:
     ```
     adb devices
     ```
     You should see your device listed with a status of `device`.

7. **Disconnecting**

   - To disconnect from the device:
     ```
     adb disconnect
     ```

## Troubleshooting

- Ensure that your Android device and computer are on the same Wi-Fi network.
- Check for any firewall or network configurations that might block ADB connections.

This setup allows you to debug and run applications on your Android device wirelessly, providing flexibility and convenience for development and testing.
