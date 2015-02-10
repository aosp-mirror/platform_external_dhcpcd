# linux
SYSCONFDIR=	/etc
SBINDIR=	/sbin
LIBDIR=		/lib
LIBEXECDIR=	/libexec
DBDIR=		/var/db
RUNDIR=		/var/run
LIBDIR=		/lib
MANDIR=		/usr/share/man
DHCPCD_SRCS+=	dhcpcd-embedded.c
CPPFLAGS+=	-D_BSD_SOURCE -D_XOPEN_SOURCE=700
CPPFLAGS+=	-D_DEFAULT_SOURCE
DHCPCD_SRCS+=	if-linux.c
CPPFLAGS+=	-DINET
DHCPCD_SRCS+=	arp.c dhcp.c ipv4.c ipv4ll.c
CPPFLAGS+=	-DINET6
DHCPCD_SRCS+=	ipv6.c ipv6nd.c dhcp6.c
DHCPCD_SRCS+=	if-linux-wext.c
COMPAT_SRCS+=	compat/arc4random.c
COMPAT_SRCS+=	compat/arc4random_uniform.c
COMPAT_SRCS+=	compat/closefrom.c
COMPAT_SRCS+=	compat/strlcpy.c
MD5_SRC=	crypt/md5.c
SHA256_SRC=	crypt/sha256.c
SERVICEEXISTS=	
SERVICECMD=	
SERVICESTATUS=	
HOOKSCRIPTS=	50-ntp.conf
