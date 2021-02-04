
include_directories(common)

include(GNUInstallDirs)

add_library(common STATIC common/abend.c common/abend.h common/addrsize.c common/addrsize.h
            common/alignment.c common/alignment.h common/assertion.c common/assertion.h
            common/attrib.h common/bitops.c common/bitops.h common/cddefs.h
            common/chartype.c common/chartype.h common/check.c common/check.h
            common/cmdline.c common/cmdline.h common/coll.c common/coll.h
            common/cpu.c common/cpu.h common/debugflag.c common/debugflag.h
            common/exprdefs.c common/exprdefs.h common/fileid.c common/fileid.h
            common/filepos.c common/filepos.h common/filestat.c common/filestat.h
            common/filetype.h common/filetype.c
            common/filetime.c common/filetime.h common/fname.c common/fname.h
            common/fp.c common/fp.h common/fragdefs.h common/gentype.c common/gentype.h
            common/hashfunc.c common/hashfunc.h common/hashtab.c common/hashtab.h
            common/hlldbgsym.h common/inline.h common/intptrstack.c common/intptrstack.h
            common/intstack.c common/intstack.h
            common/inttypes.h common/libdefs.h common/lidefs.h common/matchpat.c
            common/matchpat.h common/mmodel.c common/mmodel.h common/objdefs.h
            common/optdefs.h common/print.c common/print.h common/scopedefs.h
            common/searchpath.c common/searchpath.h common/segdefs.h
            common/segnames.c common/segnames.h common/shift.c common/shift.h
            common/strbuf.c common/strbuf.h common/strpool.c common/strpool.h
            common/strstack.c common/strstack.h common/strutil.c common/strutil.h
            common/symdefs.h common/target.c common/target.h common/tgttrans.c
            common/tgttrans.h common/va_copy.h common/version.c common/version.h
            common/xmalloc.c common/xmalloc.h common/xsprintf.c common/xsprintf.h)

add_executable(ar65 ar65/add.c ar65/add.h ar65/del.c ar65/del.h ar65/error.c ar65/error.h 
                ar65/exports.c ar65/exports.h ar65/extract.c ar65/extract.h ar65/fileio.c
                ar65/fileio.h ar65/global.c ar65/global.h ar65/library.c ar65/library.h 
                ar65/list.c ar65/list.h ar65/main.c ar65/objdata.c ar65/objdata.h
                ar65/objfile.c ar65/objfile.h)

target_link_libraries(ar65 common)

install(TARGETS ar65)

set(CA65_INCLUDE_PATH "include" CACHE STRING "The path to install (and search for) include files with ca65 to")

if(IS_ABSOLUTE CA65_INCLUDE_PATH)
    set(CA65_FULL_INCLUDE_PATH "${CA65_INCLUDE_PATH}")
else()
    set(CA65_FULL_INCLUDE_PATH "${CC65_FULL_BASE_DIR}/${CA65_INCLUDE_PATH}")
endif()


add_executable(ca65 ca65/anonname.c ca65/anonname.h ca65/asserts.c ca65/asserts.h
                ca65/condasm.c ca65/condasm.h ca65/dbginfo.c ca65/dbginfo.h
                ca65/ea.h ca65/ea65.c ca65/ea65.h ca65/easw16.c ca65/easw16.h
                ca65/enum.c ca65/enum.h ca65/error.c ca65/error.h ca65/expr.c 
                ca65/expr.h ca65/feature.c ca65/feature.h ca65/filetab.c 
                ca65/filetab.h ca65/fragment.c ca65/fragment.h ca65/global.c 
                ca65/global.h ca65/incpath.c ca65/incpath.h ca65/instr.c 
                ca65/instr.h ca65/istack.c ca65/istack.h ca65/lineinfo.c
                ca65/lineinfo.h ca65/listing.c ca65/listing.h ca65/macro.c ca65/macro.h 
                ca65/main.c ca65/nexttok.c ca65/nexttok.h ca65/objcode.c ca65/objcode.h 
                ca65/objfile.c ca65/objfile.h ca65/options.c ca65/options.h ca65/pseudo.c 
                ca65/pseudo.h ca65/repeat.c ca65/repeat.h ca65/scanner.c ca65/scanner.h 
                ca65/segdef.c ca65/segdef.h ca65/segment.c ca65/segment.h 
                ca65/sizeof.c ca65/sizeof.h ca65/span.c ca65/span.h 
                ca65/spool.c ca65/spool.h ca65/struct.c ca65/struct.h
                ca65/studyexpr.c ca65/studyexpr.h ca65/symbol.c ca65/symbol.h
                ca65/symentry.c ca65/symentry.h ca65/symtab.c ca65/symtab.h 
                ca65/token.c ca65/token.h ca65/token.h ca65/toklist.c ca65/toklist.h
                ca65/ulabel.c ca65/ulabel.h)
target_link_libraries(ca65 common)
target_compile_definitions(ca65 PRIVATE -DCA65_INC="${CA65_FULL_INCLUDE_PATH}")

install(TARGETS ca65)

add_executable(ld65 ld65/asserts.c ld65/asserts.h ld65/bin.c ld65/bin.h ld65/binfmt.c 
                ld65/binfmt.h ld65/cfgexpr.c ld65/cfgexpr.h ld65/condes.c ld65/condes.h 
                ld65/config.c ld65/config.h ld65/dbgfile.c ld65/dbgfile.h ld65/dbgsyms.c 
                ld65/dbgsyms.h ld65/error.c ld65/error.h ld65/exports.c ld65/exports.h 
                ld65/expr.c ld65/expr.h ld65/extsyms.c ld65/extsyms.h ld65/fileinfo.c 
                ld65/fileinfo.h ld65/fileio.c ld65/fileio.h ld65/filepath.c
                ld65/fragment.c ld65/fragment.h ld65/global.c ld65/global.h 
                ld65/library.c ld65/library.h ld65/lineinfo.c ld65/lineinfo.h 
                ld65/main.c ld65/mapfile.c ld65/mapfile.h ld65/memarea.c ld65/memarea.h 
                ld65/o65.c ld65/o65.h ld65/objdata.c ld65/objdata.h ld65/scanner.c 
                ld65/objfile.h ld65/objfile.c
                ld65/scanner.h ld65/scopes.c ld65/scopes.h ld65/segments.c ld65/segments.h 
                ld65/span.c ld65/span.h ld65/spool.c ld65/spool.h ld65/tpool.c ld65/tpool.h 
                ld65/xex.c ld65/xex.h )

target_link_libraries(ld65 common)
install(TARGETS ld65) 

install(SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/install_target_symlinks.cmake)
