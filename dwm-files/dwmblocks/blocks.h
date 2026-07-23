//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",	"$HOME/.local/bin/sb-clock.sh",		30,			0},
	{"",	"$HOME/.local/bin/sb-weather.sh",		1800,			0},
  {"",	"$HOME/.local/bin/sb-temps.sh",		5,			0},
	{"",	"$HOME/.local/bin/sb-volume.sh",		0,			10},
	{"",	"$HOME/.local/bin/sb-battery.sh",		30,			0},
};
//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
