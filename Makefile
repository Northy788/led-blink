MCU = atmega2560
F_CPU = 16000000UL

CXX = avr-g++
OBJCOPY = avr-objcopy
CXXFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os -Wall -Wextra -std=c++11

PROGRAMMER = -c stk500v2 -P /dev/ttyACM0 -b 115200
TARGET = led

SRC = $(TARGET).cpp

all: $(TARGET).hex

$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

$(TARGET).elf: $(SRC)
	$(CXX) $(CXXFLAGS) -o $@ $^

flash: $(TARGET).hex
	avrdude $(PROGRAMMER) -p $(MCU) -U flash:w:$< -D

clean:
	rm -f $(TARGET).hex $(TARGET).elf

.PHONY: all flash clean
