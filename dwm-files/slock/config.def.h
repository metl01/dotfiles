/* user and group to drop privileges to */ static const char *user  = "nobody";
static const char *group = "nogroup";
/*Font settings for the time text*/
static const float textsize=64.0;
static const char* textfamily="serif";
static const double textcolorred=255;
static const double textcolorgreen=255;
static const double textcolorblue=255;

static const char *colorname[NUMCOLS] = {
	[BG] =     "black",     /* background */
	[INIT] =   "#4f525c",   /* after initialization */
	[INPUT] =  "#005577",   /* during input */
	[FAILED] = "#CC3333",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* size of square in px */
static const int squaresize = 50;
