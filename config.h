/* linux */
#define SYSCONFDIR	"/etc"
#define SBINDIR		"/sbin"
#define LIBDIR		"/lib"
#define LIBEXECDIR	"/libexec"
#define DBDIR		"/var/db"
#define RUNDIR		"/var/run"
#include <asm/types.h> /* fix broken headers */
#include <linux/rtnetlink.h>
#define HAVE_NL80211_H
#include		"compat/closefrom.h"
#include		<sys/queue.h>
#include		"compat/queue.h"
#define pollts		ppoll
#include		"compat/endian.h"


#include <strings.h>
#include <signal.h>

#define NBBY 8 /* number of bits in a byte */
