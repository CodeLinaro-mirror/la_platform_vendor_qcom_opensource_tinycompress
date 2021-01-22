pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = tinycompress.pc
EXTRA_DIST = $(pkgconfig_DATA)

AM_CFLAGS = -Wundef \
        -Wstrict-prototypes \
        -Wno-trigraphs \
        -g -O0 \
        -fno-inline \
        -fno-short-enums \
        -fpic \
        -I $(top_srcdir)/include

h_sources = ./include/tinycompress/compress_plugin.h \
            ./include/tinycompress/tinycompress.h \
            ./include/tinycompress/tinymp3.h \
            ./include/tinycompress/version.h

c_sources = ${top_srcdir}/compress.c \
            ${top_srcdir}/utils.c \
            ${top_srcdir}/compress_hw.c \
            ${top_srcdir}/compress_plugin.c \
            ${top_srcdir}/snd_utils.c

library_includedir = $(includedir)/tinycompress/
library_include_HEADERS = $(h_sources)

lib_LTLIBRARIES = libtinycompress.la
libtinycompress_la_SOURCES = $(c_sources)
libtinycompress_la_CFLAGS := $(AM_CFLAGS)
libtinycompress_la_CFLAGS += $(GLIB_CFLAGS) -Dstrlcpy=g_strlcpy -Dstrlcat=g_strlcat -include glib.h
libtinycompress_la_CFLAGS += -D__unused=__attribute__\(\(__unused__\)\)
libtinycompress_la_CFLAGS += -DNDEBUG
libtinycompress_la_LDFLAGS = -shared -avoid-version
