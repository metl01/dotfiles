//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",	"~/.local/bin/sb-clock.sh",		30,			0},
	{"",	"~/.local/bin/sb-weather.sh",		1800,			0},
	{"",	"~/.local/bin/sb-volume.sh",		0,			10},
	{"",	"~/.local/bin/sb-battery.sh",		30,			0},
};
//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
