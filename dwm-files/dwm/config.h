/* See LICENSE file for copyright and license details. */
/* appearance */
#include <X11/Xutil.h>
#include <X11/XF86keysym.h>
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 1;
static const unsigned int systrayonleft = 0;
static const unsigned int systrayspacing = 2;
static const int systraypinningfailfirst = 1;
static const int showsystray        = 1;
static const unsigned int gappih    = 4;
static const unsigned int gappiv    = 4;
static const unsigned int gappoh    = 4;
static const unsigned int gappov    = 4;
static       int smartgaps          = 0;
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "AdwaitaMono Nerd Font:size=12" };
static const char dmenufont[]       = "AdwaitaMono Nerd Font:size=12";
static const char background[]       = "#272e33";
static const char col_gray1[]       = "#7a8478";
static const char foreground[]       = "#d3c6aa";
static const char foreground2[]       = "#2e383c";
static const char accent[]          = "#83c092";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { foreground, background, col_gray1 },
	[SchemeSel]  = { foreground2, accent, accent  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int refreshrate = 120;  /* refresh rate (per second) for client move/resize */

#define FORCE_VSPLIT 1

#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
  { "[\\]",       dwindle },
  { "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
/*	{ "[M]",      monocle },*/
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *termcmd[]  = { "kitty", NULL };
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", background, "-nf", foreground, "-sb", accent, "-sf", foreground2, NULL };
static const char *screenshotcmd[] = { "flameshot", "gui", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
  { 0,                            XK_Print,  spawn,          {.v = screenshotcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
		TAGKEYS(                        XK_1,                      0)
	  TAGKEYS(                        XK_2,                      1)
	  TAGKEYS(                        XK_3,                      2)
	  TAGKEYS(                        XK_4,                      3)
	  TAGKEYS(                        XK_5,                      4)
	  TAGKEYS(                        XK_6,                      5)
	  TAGKEYS(                        XK_7,                      6)
	  TAGKEYS(                        XK_8,                      7)
	  TAGKEYS(                        XK_9,                      8)
  /*{ MODKEY|ShiftMask,             XK_p,      quit,           {0} },*/
  { MODKEY|ControlMask,           XK_equal,  incrgaps,       {.i = +1} },
  { MODKEY|ControlMask,           XK_minus,  incrgaps,       {.i = -1} },
  { MODKEY|ControlMask,           XK_g,      togglegaps,     {0} },
  { MODKEY|ControlMask|ShiftMask, XK_g,      defaultgaps,    {0} },
  { MODKEY|ShiftMask,             XK_w,      spawn,          SHCMD("$HOME/.local/bin/wallswitch.sh") },
  { MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("$HOME/.local/bin/powermenu.sh") },
  /* Audio Controls */
  { 0, XF86XK_AudioRaiseVolume, spawn, SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && pkill -RTMIN+10 dwmblocks") },
  { 0, XF86XK_AudioLowerVolume, spawn, SHCMD("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && pkill -RTMIN+10 dwmblocks") },
  { 0, XF86XK_AudioMute, spawn, SHCMD("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && pkill -RTMIN+10 dwmblocks") },
  { 0, XF86XK_AudioMicMute, spawn, SHCMD("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && pkill -RTMIN+10 dwmblocks") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

