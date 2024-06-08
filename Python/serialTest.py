import serial
import time

# COM port settings
port = "COM9"
baudrate = 9600

# Open the serial port
ser = serial.Serial(port, baudrate)

# Define the binary data to send
binary_data = [0b00000001, 0b00000010, 0b00000011, 0b00000100]


# 00000000 01111000 00000000 00000000

try:
    # Send the binary data
    ser.write(binary_data)

    # Wait for the device to process and send the data
    # time.sleep(0.1)  # Adjust the delay as needed

    # Read the received data
    # received_data = ser.read(len(binary_data))
    received_data = ser.read(4)

    # Print the received data
    binary_representation = " ".join([f"{byte:08b}" for byte in received_data])
    print("Received data (binary):", binary_representation)
    
except serial.SerialException as e:
    print("Serial port error:", e)
finally:
    # Close the serial port
    ser.close()
