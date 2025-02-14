TARGET = main

# Project layout
STARTUPDIR = startup/
OBJSDIR = build/obj/
BUILDDIR = build/
SRCDIR = src/

# Define the linker script location and chip architecture.
LD_SCRIPT = $(STARTUPDIR)STM32F072RBTX_FLASH.ld
MCU_SPEC  = cortex-m0

# Toolchain definitions (ARM bare metal defaults)
TOOLCHAIN = /usr
CC = $(TOOLCHAIN)/bin/arm-none-eabi-gcc
AS = $(TOOLCHAIN)/bin/arm-none-eabi-as
LD = $(TOOLCHAIN)/bin/arm-none-eabi-ld
OC = $(TOOLCHAIN)/bin/arm-none-eabi-objcopy
OD = $(TOOLCHAIN)/bin/arm-none-eabi-objdump
OS = $(TOOLCHAIN)/bin/arm-none-eabi-size

# Assembly directives.
ASFLAGS += -c
ASFLAGS += -O0
ASFLAGS += -mcpu=$(MCU_SPEC)
ASFLAGS += -mthumb
ASFLAGS += -Wall
# (Set error messages to appear on a single line.)
ASFLAGS += -fmessage-length=0

# C compilation directives
CFLAGS += -mcpu=$(MCU_SPEC)
CFLAGS += -mthumb
CFLAGS += -Wall
CFLAGS += -g
# (Set error messages to appear on a single line.)
CFLAGS += -fmessage-length=0
# (Set system to ignore semihosted junk)
CFLAGS += --specs=nosys.specs

# Linker directives.
LSCRIPT = ./$(LD_SCRIPT)
LFLAGS += -mcpu=$(MCU_SPEC)
LFLAGS += -mthumb
LFLAGS += -Wall
LFLAGS += --specs=nosys.specs
LFLAGS += -nostdlib
LFLAGS += -lgcc
LFLAGS += -T$(LSCRIPT)

INCLUDE += -I./include/device
INCLUDE += -I./include/cmsis


AS_SRC   =  startup_stm32f072rbtx.s
C_SRC    =  main.c

_OBJS = $(AS_SRC:.s=.o) 
_OBJS += $(C_SRC:.c=.o)
OBJS = $(addprefix $(OBJSDIR),$(_OBJS))


.PHONY: all
all: $(BUILDDIR) $(OBJSDIR) $(BUILDDIR)$(TARGET).bin

$(OBJSDIR)%.o: $(STARTUPDIR)%.s
	$(CC) -x assembler-with-cpp $(ASFLAGS) $< -o $@

$(OBJSDIR)%.o: $(SRCDIR)%.s
	$(CC) -x assembler-with-cpp $(ASFLAGS) $< -o $@

$(OBJSDIR)%.o: $(SRCDIR)%.c
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

$(BUILDDIR)$(TARGET).elf: $(OBJS)
	$(CC) $^ $(LFLAGS) -o $@

$(BUILDDIR)$(TARGET).bin: $(BUILDDIR)$(TARGET).elf
	$(OC) -S -O binary $< $@
	$(OS) $<

.PHONY: clean
clean:
	rm -rf $(OBJSDIR)
	rm -rf $(BUILDDIR)

$(BUILDDIR):
	mkdir -p $@

$(OBJSDIR):
	mkdir -p $@
