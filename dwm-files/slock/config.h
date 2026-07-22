/* user and group to drop privileges to */ static const char *user  = "noah";
static const char *group = "noah";
/*Font settings for the time text*/
static const float textsize=64.0;
static const char* textfamily="AdwaitaMono Nerd Font";
static const double textcolorred=255;
static const double textcolorgreen=255;
static const double textcolorblue=255;

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#272e33",     /* after initialization */
	[INPUT] =  "#83c092",   /* during input */
	[FAILED] = "#e67e80",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
