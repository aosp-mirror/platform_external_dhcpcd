/* linux */
#define SYSCONFDIR	"/system/etc/dhcpcd"
#define SBINDIR		"/system/etc/dhcpcd"
#define LIBEXECDIR	"/system/etc/dhcpcd"
#define DBDIR		"/data/misc/dhcp"
#define RUNDIR		"/data/misc/dhcp"
#include "compat/arc4random.h"
#include "compat/closefrom.h"
#include "compat/strlcpy.h"
#include "compat/getline.h"
#include "compat/pollts.h"
#include "compat/posix_spawn.h"

#define	TAILQ_FOREACH_SAFE(var, head, field, next)			\
	for ((var) = TAILQ_FIRST((head));				\
	    (var) && ((next) = TAILQ_NEXT((var), field), 1);		\
	    (var) = (next))
#define TAILQ_FOREACH_REVERSE_SAFE(var, head, headname, field, prev)	\
	for ((var) = TAILQ_LAST((head), headname);			\
	    (var) && ((prev) = TAILQ_PREV((var), headname, field), 1);  \
	    (var) = (prev))

/*from /usr/include/sys/queue.h*/
#define TAILQ_CONCAT(head1, head2, field) do {              \
    if (!TAILQ_EMPTY(head2)) {                  \
        *(head1)->tqh_last = (head2)->tqh_first;        \
        (head2)->tqh_first->field.tqe_prev = (head1)->tqh_last; \
        (head1)->tqh_last = (head2)->tqh_last;          \
        TAILQ_INIT((head2));                    \
    }                               \
} while (/*CONSTCOND*/0)


#ifndef MAX
#define MAX(a,b)	((a) >= (b) ? (a) : (b))
#endif

#ifndef MIN
#define MIN(a,b)	((a) <= (b) ? (a) : (b))
#endif
