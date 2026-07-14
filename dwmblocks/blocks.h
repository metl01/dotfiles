//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",	"sb-clock",		30,			0},
	{"",	"sb-weather",		1800,			0},
	{"",	"sb-volume",		1,			10},
	{"",	"sb-battery",		30,			0},
};
//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
