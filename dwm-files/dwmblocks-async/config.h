#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 0

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 1

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
    X("", "$HOME/.local/bin/sb-clock.sh", 30, 0) \
    X("", "$HOME/.local/bin/sb-weather.sh", 1800, 0) \
    X("", "$HOME/.local/bin/sb-disk.sh", 1800, 0) \
    X("", "$HOME/.local/bin/sb-memory.sh", 2, 0) \
    X("", "$HOME/.local/bin/sb-cpu.sh", 2, 0) \
    X("", "$HOME/.local/bin/sb-temps.sh", 5, 0) \
    X("", "$HOME/.local/bin/sb-volume.sh", 0, 10) \
    X("", "$HOME/.local/bin/sb-battery.sh", 5, 0) \
    

#endif  // CONFIG_H
