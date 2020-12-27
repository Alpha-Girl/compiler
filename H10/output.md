# output

## cl /d1 reportSingleClassLayoutD c.cpp

用于 x86 的 Microsoft (R) C/C++ 优化编译器 19.25.28610.4 版
版权所有(C) Microsoft Corporation。保留所有权利。

c.cpp

class _PMD      size(12):
        +---
 0      | mdisp
 4      | pdisp
 8      | vdisp
        +---

class _TypeDescriptor   size(8):
        +---
 0      | pVFTable
 4      | spare
 8      | name
        +---

class _s__RTTIBaseClassDescriptor       size(28):
        +---
 0      | pTypeDescriptor
 4      | numContainedBases
 8      | _PMD where
20      | attributes
24      | pClassDescriptor
        +---

class _s__RTTIClassHierarchyDescriptor  size(16):
        +---
 0      | signature
 4      | attributes
 8      | numBaseClasses
12      | pBaseClassArray
        +---

class __s_GUID  size(16):
        +---
 0      | Data1
 4      | Data2
 6      | Data3
 8      | Data4
        +---

class __vcrt_va_list_is_reference<char const * const>   size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<char const * const>       size(1):
        +---
        +---

class std::numeric_limits<char> size(1):
        +---
 0      | +--- (base class std::_Num_int_base)
 0      | | +--- (base class std::_Num_base)
        | | +---
        | +---
        +---

class std::_Distance_unknown    size(1):
        +---
        +---

class std::_Default_sentinel    size(1):
        +---
        +---

class std::_Is_character<char>  size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::_Default_allocate_traits     size(1):
        +---
        +---

class std::_Narrow_char_traits<char,int>        size(1):
        +---
        +---

class std::char_traits<char>    size(1):
        +---
 0      | +--- (base class std::_Narrow_char_traits<char,int>)
        | +---
        +---

class std::allocator<char>      size(1):
        +---
        +---

class std::_Default_allocator_traits<class std::allocator<char> >       size(1):
        +---
        +---

class std::allocator_traits<class std::allocator<char> >        size(1):
        +---
 0      | +--- (base class std::_Default_allocator_traits<class std::allocator<char> >)
        | +---
        +---

class std::_Simple_types<char>  size(1):
        +---
        +---

class std::_String_val<struct std::_Simple_types<char> >        size(24):
        +---
 0      | +--- (base class std::_Container_base0)
        | +---
 0      | _Bxty _Bx
16      | _Mysize
20      | _Myres
        +---

class std::_Compressed_pair<class std::allocator<char>,class std::_String_val<struct std::_Simple_types<char> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@D@std@@ _Myval2
        +---

class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > size(24):
        +---
 0      | ?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00 _Mypair
        +---

class std::initializer_list<char>       size(8):
        +---
 0      | _First
 4      | _Last
        +---

class std::_Default_allocator_traits<class std::allocator<wchar_t> >    size(1):
        +---
        +---

class std::_Default_allocator_traits<class std::allocator<char16_t> >   size(1):
        +---
        +---

class std::_Default_allocator_traits<class std::allocator<char32_t> >   size(1):
        +---
        +---

class std::_Yarn<char>  size(8):
        +---
 0      | _Myptr
 4      | _Nul
        | <alignment member> (size=3)
        +---

class std::codecvt<char16_t,char,struct _Mbstatet>      size(16):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Maxcode
12      | _Codecvt_mode _Mode
        +---

std::codecvt<char16_t,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@_SDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<char16_t,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_length

std::codecvt<char16_t,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::codecvt<char32_t,char,struct _Mbstatet>      size(16):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Maxcode
12      | _Codecvt_mode _Mode
        +---

std::codecvt<char32_t,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@_UDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<char32_t,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_length

std::codecvt<char32_t,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::codecvt<wchar_t,char,struct _Mbstatet>       size(52):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Cvtvec _Cvt
        +---

std::codecvt<wchar_t,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@_WDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<wchar_t,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_length

std::codecvt<wchar_t,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::codecvt<unsigned short,char,struct _Mbstatet>        size(52):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Cvtvec _Cvt
        +---

std::codecvt<unsigned short,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@GDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<unsigned short,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_length

std::codecvt<unsigned short,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::ctype<char>  size(24):
        +---
 0      | +--- (base class std::ctype_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Ctypevec _Ctype
        +---

std::ctype<char>::$vftable@:
        | &?$ctype@D_meta
        |  0
 0      | &std::ctype<char>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::ctype<char>::do_tolower
 4      | &std::ctype<char>::do_tolower
 5      | &std::ctype<char>::do_toupper
 6      | &std::ctype<char>::do_toupper
 7      | &std::ctype<char>::do_widen
 8      | &std::ctype<char>::do_widen
 9      | &std::ctype<char>::do_narrow
10      | &std::ctype<char>::do_narrow

std::ctype<char>::{dtor} this adjustor: 0
std::ctype<char>::do_tolower this adjustor: 0
std::ctype<char>::do_tolower this adjustor: 0
std::ctype<char>::do_toupper this adjustor: 0
std::ctype<char>::do_toupper this adjustor: 0
std::ctype<char>::do_widen this adjustor: 0
std::ctype<char>::do_widen this adjustor: 0
std::ctype<char>::do_narrow this adjustor: 0
std::ctype<char>::do_narrow this adjustor: 0
std::ctype<char>::__delDtor this adjustor: 0
std::ctype<char>::__vecDelDtor this adjustor: 0

class std::basic_ios<char,struct std::char_traits<char> >       size(72):
        +---
 0      | +--- (base class std::ios_base)
 0      | | {vfptr}
 8      | | +--- (base class std::_Iosb<int>)
        | | +---
 8      | | _Stdstr
12      | | _Mystate
16      | | _Except
20      | | _Fmtfl
24      | | _Prec
32      | | _Wide
40      | | _Arr
44      | | _Calls
48      | | _Ploc
        | | <alignment member> (size=4)
        | +---
56      | _Mystrbuf
60      | _Tiestr
64      | _Fillch
        | <alignment member> (size=7)
        +---

std::basic_ios<char,struct std::char_traits<char> >::$vftable@:
        | &?$basic_ios@DU?$char_traits@D@std@@_meta
        |  0
 0      | &std::basic_ios<char,struct std::char_traits<char> >::{dtor}

std::basic_ios<char,struct std::char_traits<char> >::{dtor} this adjustor: 0
std::basic_ios<char,struct std::char_traits<char> >::__delDtor this adjustor: 0
std::basic_ios<char,struct std::char_traits<char> >::__vecDelDtor this adjustor: 0

class std::basic_ostream<char,struct std::char_traits<char> >   size(80):
        +---
 0      | {vbptr}
        +---
4       | (vtordisp for vbase std::basic_ios<char,struct std::char_traits<char> >)
        +--- (virtual base std::basic_ios<char,struct std::char_traits<char> >)
 8      | +--- (base class std::ios_base)
 8      | | {vfptr}
16      | | +--- (base class std::_Iosb<int>)
        | | +---
16      | | _Stdstr
20      | | _Mystate
24      | | _Except
28      | | _Fmtfl
32      | | _Prec
40      | | _Wide
48      | | _Arr
52      | | _Calls
56      | | _Ploc
        | | <alignment member> (size=4)
        | +---
64      | _Mystrbuf
68      | _Tiestr
72      | _Fillch
        | <alignment member> (size=7)
        +---

std::basic_ostream<char,struct std::char_traits<char> >::$vbtable@:
 0      | 0
 1      | 8 (?$basic_ostream@DU?$char_traits@D@std@@d(?$basic_ostream@DU?$char_traits@D@std@@+0)?$basic_ios@DU?$char_traits@D@std@@)

std::basic_ostream<char,struct std::char_traits<char> >::$vftable@:
        | -8
 0      | &(vtordisp) std::basic_ostream<char,struct std::char_traits<char> >::{dtor}

std::basic_ostream<char,struct std::char_traits<char> >::{dtor} this adjustor: 8
std::basic_ostream<char,struct std::char_traits<char> >::__delDtor this adjustor: 8
std::basic_ostream<char,struct std::char_traits<char> >::__vecDelDtor this adjustor: 8
vbi:       class  offset o.vbptr  o.vbte fVtorDisp
std::basic_ios<char,struct std::char_traits<char> >       8       0       4 1

class std::is_lvalue_reference<class std::basic_ostream<char,struct std::char_traits<char> > &> size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class D size(20):
        +---
 0      | +--- (base class B)
 0      | | +--- (base class A)
 0      | | | dataA
        | | +---
 4      | | dataB
        | +---
 8      | +--- (base class C)
 8      | | +--- (base class A)
 8      | | | dataA
        | | +---
12      | | dataC
        | +---
16      | dataD
        +---

class std::is_nothrow_constructible<class std::allocator<char>,class std::allocator<char> >     size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::is_nothrow_constructible<class std::_String_val<struct std::_Simple_types<char> > >  size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,0>)
        | +---
        +---

class std::is_nothrow_default_constructible<class std::allocator<char> >        size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::_Aligned<8,4,char,0> size(1):
        +---
        +---

class std::_Facetptr<class std::ctype<char> >   size(1):
        +---
        +---
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.25.28610\include\ostream(743): warning C4530: 使用了 C++ 异常处理程序，但未启用展开语义。请指定 /EHsc
c.cpp(16): note: 查看对正在编译的函数 模板 实例化“std::basic_ostream<char,std::char_traits<char>> &std::operator <<<std::char_traits<char>>(std::basic_ostream<char,std::char_traits<char>> &,const char *)”的引用

class std::basic_streambuf<char,struct std::char_traits<char> > size(56):
        +---
 0      | {vfptr}
 4      | _Gfirst
 8      | _Pfirst
12      | _IGfirst
16      | _IPfirst
20      | _Gnext
24      | _Pnext
28      | _IGnext
32      | _IPnext
36      | _Gcount
40      | _Pcount
44      | _IGcount
48      | _IPcount
52      | _Plocale
        +---

std::basic_streambuf<char,struct std::char_traits<char> >::$vftable@:
        | &?$basic_streambuf@DU?$char_traits@D@std@@_meta
        |  0
 0      | &std::basic_streambuf<char,struct std::char_traits<char> >::{dtor}
 1      | &std::basic_streambuf<char,struct std::char_traits<char> >::_Lock
 2      | &std::basic_streambuf<char,struct std::char_traits<char> >::_Unlock
 3      | &std::basic_streambuf<char,struct std::char_traits<char> >::overflow
 4      | &std::basic_streambuf<char,struct std::char_traits<char> >::pbackfail
 5      | &std::basic_streambuf<char,struct std::char_traits<char> >::showmanyc
 6      | &std::basic_streambuf<char,struct std::char_traits<char> >::underflow
 7      | &std::basic_streambuf<char,struct std::char_traits<char> >::uflow
 8      | &std::basic_streambuf<char,struct std::char_traits<char> >::xsgetn
 9      | &std::basic_streambuf<char,struct std::char_traits<char> >::xsputn
10      | &std::basic_streambuf<char,struct std::char_traits<char> >::seekoff
11      | &std::basic_streambuf<char,struct std::char_traits<char> >::seekpos
12      | &std::basic_streambuf<char,struct std::char_traits<char> >::setbuf
13      | &std::basic_streambuf<char,struct std::char_traits<char> >::sync
14      | &std::basic_streambuf<char,struct std::char_traits<char> >::imbue

std::basic_streambuf<char,struct std::char_traits<char> >::{dtor} this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::_Lock this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::_Unlock this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::overflow this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::pbackfail this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::showmanyc this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::underflow this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::uflow this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::xsgetn this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::xsputn this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::seekoff this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::seekpos this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::setbuf this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::sync this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::imbue this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::__delDtor this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::__vecDelDtor this adjustor: 0
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c.cpp(45) : warning C4700: 使用了未初始化的局部变量“dd”
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c.cpp(46) : warning C4700: 使用了未初始化的局部变量“a”
Microsoft (R) Incremental Linker Version 14.25.28610.4
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:c.exe
c.obj

## cl /d1 reportSingleClassLayoutB c.cpp

用于 x86 的 Microsoft (R) C/C++ 优化编译器 19.25.28610.4 版
版权所有(C) Microsoft Corporation。保留所有权利。

c.cpp

class _s__RTTIBaseClassDescriptor       size(28):
        +---
 0      | pTypeDescriptor
 4      | numContainedBases
 8      | _PMD where
20      | attributes
24      | pClassDescriptor
        +---

class _s__RTTIBaseClassArray    size(1):
        +---
 0      | arrayOfBaseClassDescriptors
        +---

class __vcrt_va_list_is_reference<wchar_t const * const>        size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<wchar_t const * const>    size(1):
        +---
        +---

class __vcrt_va_list_is_reference<wchar_t const *>      size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<wchar_t const *>  size(1):
        +---
        +---

class __vcrt_va_list_is_reference<char const * const>   size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<char const * const>       size(1):
        +---
        +---

class std::_Basic_container_proxy_ptr12 size(4):
        +---
 0      | _Ptr
        +---

class std::_String_val<`template-type-parameter-1'>::_Bxty      size(0):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<char> >::_Bxty size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<wchar_t> >::_Bxty      size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<char16_t> >::_Bxty     size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<char32_t> >::_Bxty     size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class B size(8):
        +---
 0      | +--- (base class A)
 0      | | dataA
        | +---
 4      | dataB
        +---
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.25.28610\include\ostream(743): warning C4530: 使用了 C++ 异常处理程序，但未启用展开语义。请指定 /EHsc
c.cpp(16): note: 查看对正在编译的函数 模板 实例化“std::basic_ostream<char,std::char_traits<char>> &std::operator <<<std::char_traits<char>>(std::basic_ostream<char,std::char_traits<char>> &,const char *)”的引用
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c.cpp(45) : warning C4700: 使用了未初始化的局部变量“dd”
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c.cpp(46) : warning C4700: 使用了未初始化的局部变量“a”
Microsoft (R) Incremental Linker Version 14.25.28610.4
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:c.exe
c.obj

## cl /d1 reportSingleClassLayoutC c.cpp

用于 x86 的 Microsoft (R) C/C++ 优化编译器 19.25.28610.4 版
版权所有(C) Microsoft Corporation。保留所有权利。

c.cpp

class _s__CatchableType size(28):
        +---
 0      | properties
 4      | pType
 8      | _PMD thisDisplacement
20      | sizeOrOffset
24      | copyFunction
        +---

class _s__CatchableTypeArray    size(4):
        +---
 0      | nCatchableTypes
 4      | arrayOfCatchableTypes
        +---

class _s__RTTIBaseClassDescriptor       size(28):
        +---
 0      | pTypeDescriptor
 4      | numContainedBases
 8      | _PMD where
20      | attributes
24      | pClassDescriptor
        +---

class _s__RTTIBaseClassArray    size(1):
        +---
 0      | arrayOfBaseClassDescriptors
        +---

class _s__RTTIClassHierarchyDescriptor  size(16):
        +---
 0      | signature
 4      | attributes
 8      | numBaseClasses
12      | pBaseClassArray
        +---

class _s__RTTICompleteObjectLocator     size(20):
        +---
 0      | signature
 4      | offset
 8      | cdOffset
12      | pTypeDescriptor
16      | pClassDescriptor
        +---

class _CrtMemState      size(52):
        +---
 0      | pBlockHeader
 4      | lCounts
24      | lSizes
44      | lHighWaterCount
48      | lTotalCount
        +---

class _Combined_type<float,double>      size(1):
        +---
        +---

class _Combined_type<float,long double> size(1):
        +---
        +---

class std::numeric_limits<signed char>  size(1):
        +---
 0      | +--- (base class std::_Num_int_base)
 0      | | +--- (base class std::_Num_base)
        | | +---
        | +---
        +---

class std::_Is_character<signed char>   size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::_Container_base0     size(1):
        +---
        +---

class std::_Container_proxy     size(8):
        +---
 0      | _Mycont
 4      | _Myfirstiter
        +---

class std::_Container_base12    size(4):
        +---
 0      | _Myproxy
        +---

class std::_WChar_traits<char16_t>      size(1):
        +---
        +---

class std::_Char_traits<char32_t,unsigned int>  size(1):
        +---
        +---

class std::_WChar_traits<wchar_t>       size(1):
        +---
        +---

class std::_WChar_traits<unsigned short>        size(1):
        +---
        +---

class std::_Compressed_pair<class std::allocator<char>,class std::_String_val<struct std::_Simple_types<char> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@D@std@@ _Myval2
        +---

class std::_Compressed_pair<class std::allocator<wchar_t>,class std::_String_val<struct std::_Simple_types<wchar_t> >,1>        size(24):
        +---
 0      | +--- (base class std::allocator<wchar_t>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@_W@std@@ _Myval2
        +---

class std::_Compressed_pair<class std::allocator<char16_t>,class std::_String_val<struct std::_Simple_types<char16_t> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char16_t>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@_S@std@@ _Myval2
        +---

class std::_Compressed_pair<class std::allocator<char32_t>,class std::_String_val<struct std::_Simple_types<char32_t> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char32_t>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@_U@std@@ _Myval2
        +---

class std::_Conditionally_enabled_hash<int,1>   size(1):
        +---
        +---

class _Collvec  size(8):
        +---
 0      | _Page
 4      | _LocaleName
        +---

class _Ctypevec size(16):
        +---
 0      | _Page
 4      | _Table
 8      | _Delfl
12      | _LocaleName
        +---

class _Cvtvec   size(44):
        +---
 0      | _Page
 4      | _Mbcurmax
 8      | _Isclocale
12      | _Isleadbyte
        +---

class std::_Crt_new_delete      size(1):
        +---
        +---

class C size(8):
        +---
 0      | +--- (base class A)
 0      | | dataA
        | +---
 4      | dataC
        +---

class std::_Compressed_pair<struct std::default_delete<class std::_Facet_base>,class std::_Facet_base *,1>      size(4):
        +---
 0      | +--- (base class std::default_delete<class std::_Facet_base>)
        | +---
 0      | _Myval2
        +---
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.25.28610\include\ostream(743): warning C4530: 使用了 C++ 异常处理程序，但未启用展开语义。请指定 /EHsc
c.cpp(16): note: 查看对正在编译的函数 模板 实例化“std::basic_ostream<char,std::char_traits<char>> &std::operator <<<std::char_traits<char>>(std::basic_ostream<char,std::char_traits<char>> &,const char *)”的引用
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c.cpp(45) : warning C4700: 使用了未初始化的局部变量“dd”
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c.cpp(46) : warning C4700: 使用了未初始化的局部变量“a”
Microsoft (R) Incremental Linker Version 14.25.28610.4
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:c.exe
c.obj

## cl /d1 reportSingleClassLayoutD c1.cpp

用于 x86 的 Microsoft (R) C/C++ 优化编译器 19.25.28610.4 版
版权所有(C) Microsoft Corporation。保留所有权利。

c1.cpp

class _PMD      size(12):
        +---
 0      | mdisp
 4      | pdisp
 8      | vdisp
        +---

class _TypeDescriptor   size(8):
        +---
 0      | pVFTable
 4      | spare
 8      | name
        +---

class _s__RTTIBaseClassDescriptor       size(28):
        +---
 0      | pTypeDescriptor
 4      | numContainedBases
 8      | _PMD where
20      | attributes
24      | pClassDescriptor
        +---

class _s__RTTIClassHierarchyDescriptor  size(16):
        +---
 0      | signature
 4      | attributes
 8      | numBaseClasses
12      | pBaseClassArray
        +---

class __s_GUID  size(16):
        +---
 0      | Data1
 4      | Data2
 6      | Data3
 8      | Data4
        +---

class __vcrt_va_list_is_reference<char const * const>   size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<char const * const>       size(1):
        +---
        +---

class std::numeric_limits<char> size(1):
        +---
 0      | +--- (base class std::_Num_int_base)
 0      | | +--- (base class std::_Num_base)
        | | +---
        | +---
        +---

class std::_Distance_unknown    size(1):
        +---
        +---

class std::_Default_sentinel    size(1):
        +---
        +---

class std::_Is_character<char>  size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::_Default_allocate_traits     size(1):
        +---
        +---

class std::_Narrow_char_traits<char,int>        size(1):
        +---
        +---

class std::char_traits<char>    size(1):
        +---
 0      | +--- (base class std::_Narrow_char_traits<char,int>)
        | +---
        +---

class std::allocator<char>      size(1):
        +---
        +---

class std::_Default_allocator_traits<class std::allocator<char> >       size(1):
        +---
        +---

class std::allocator_traits<class std::allocator<char> >        size(1):
        +---
 0      | +--- (base class std::_Default_allocator_traits<class std::allocator<char> >)
        | +---
        +---

class std::_Simple_types<char>  size(1):
        +---
        +---

class std::_String_val<struct std::_Simple_types<char> >        size(24):
        +---
 0      | +--- (base class std::_Container_base0)
        | +---
 0      | _Bxty _Bx
16      | _Mysize
20      | _Myres
        +---

class std::_Compressed_pair<class std::allocator<char>,class std::_String_val<struct std::_Simple_types<char> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@D@std@@ _Myval2
        +---

class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > size(24):
        +---
 0      | ?$_Compressed_pair@V?$allocator@D@std@@V?$_String_val@U?$_Simple_types@D@std@@@2@$00 _Mypair
        +---

class std::initializer_list<char>       size(8):
        +---
 0      | _First
 4      | _Last
        +---

class std::_Default_allocator_traits<class std::allocator<wchar_t> >    size(1):
        +---
        +---

class std::_Default_allocator_traits<class std::allocator<char16_t> >   size(1):
        +---
        +---

class std::_Default_allocator_traits<class std::allocator<char32_t> >   size(1):
        +---
        +---

class std::_Yarn<char>  size(8):
        +---
 0      | _Myptr
 4      | _Nul
        | <alignment member> (size=3)
        +---

class std::codecvt<char16_t,char,struct _Mbstatet>      size(16):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Maxcode
12      | _Codecvt_mode _Mode
        +---

std::codecvt<char16_t,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@_SDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<char16_t,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<char16_t,char,struct _Mbstatet>::do_length

std::codecvt<char16_t,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<char16_t,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::codecvt<char32_t,char,struct _Mbstatet>      size(16):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Maxcode
12      | _Codecvt_mode _Mode
        +---

std::codecvt<char32_t,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@_UDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<char32_t,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<char32_t,char,struct _Mbstatet>::do_length

std::codecvt<char32_t,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<char32_t,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::codecvt<wchar_t,char,struct _Mbstatet>       size(52):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Cvtvec _Cvt
        +---

std::codecvt<wchar_t,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@_WDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<wchar_t,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<wchar_t,char,struct _Mbstatet>::do_length

std::codecvt<wchar_t,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<wchar_t,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::codecvt<unsigned short,char,struct _Mbstatet>        size(52):
        +---
 0      | +--- (base class std::codecvt_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Cvtvec _Cvt
        +---

std::codecvt<unsigned short,char,struct _Mbstatet>::$vftable@:
        | &?$codecvt@GDU_Mbstatet@@_meta
        |  0
 0      | &std::codecvt<unsigned short,char,struct _Mbstatet>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_always_noconv
 4      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_max_length
 5      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_encoding
 6      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_in
 7      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_out
 8      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_unshift
 9      | &std::codecvt<unsigned short,char,struct _Mbstatet>::do_length

std::codecvt<unsigned short,char,struct _Mbstatet>::{dtor} this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_in this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_out this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_unshift this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_length this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_always_noconv this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_max_length this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::do_encoding this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::__delDtor this adjustor: 0
std::codecvt<unsigned short,char,struct _Mbstatet>::__vecDelDtor this adjustor: 0

class std::ctype<char>  size(24):
        +---
 0      | +--- (base class std::ctype_base)
 0      | | +--- (base class std::locale::facet)
 0      | | | +--- (base class std::_Facet_base)
 0      | | | | {vfptr}
        | | | +---
 4      | | | +--- (base class std::_Crt_new_delete)
        | | | +---
 4      | | | _Myrefs
        | | +---
        | +---
 8      | _Ctypevec _Ctype
        +---

std::ctype<char>::$vftable@:
        | &?$ctype@D_meta
        |  0
 0      | &std::ctype<char>::{dtor}
 1      | &std::locale::facet::_Incref
 2      | &std::locale::facet::_Decref
 3      | &std::ctype<char>::do_tolower
 4      | &std::ctype<char>::do_tolower
 5      | &std::ctype<char>::do_toupper
 6      | &std::ctype<char>::do_toupper
 7      | &std::ctype<char>::do_widen
 8      | &std::ctype<char>::do_widen
 9      | &std::ctype<char>::do_narrow
10      | &std::ctype<char>::do_narrow

std::ctype<char>::{dtor} this adjustor: 0
std::ctype<char>::do_tolower this adjustor: 0
std::ctype<char>::do_tolower this adjustor: 0
std::ctype<char>::do_toupper this adjustor: 0
std::ctype<char>::do_toupper this adjustor: 0
std::ctype<char>::do_widen this adjustor: 0
std::ctype<char>::do_widen this adjustor: 0
std::ctype<char>::do_narrow this adjustor: 0
std::ctype<char>::do_narrow this adjustor: 0
std::ctype<char>::__delDtor this adjustor: 0
std::ctype<char>::__vecDelDtor this adjustor: 0

class std::basic_ios<char,struct std::char_traits<char> >       size(72):
        +---
 0      | +--- (base class std::ios_base)
 0      | | {vfptr}
 8      | | +--- (base class std::_Iosb<int>)
        | | +---
 8      | | _Stdstr
12      | | _Mystate
16      | | _Except
20      | | _Fmtfl
24      | | _Prec
32      | | _Wide
40      | | _Arr
44      | | _Calls
48      | | _Ploc
        | | <alignment member> (size=4)
        | +---
56      | _Mystrbuf
60      | _Tiestr
64      | _Fillch
        | <alignment member> (size=7)
        +---

std::basic_ios<char,struct std::char_traits<char> >::$vftable@:
        | &?$basic_ios@DU?$char_traits@D@std@@_meta
        |  0
 0      | &std::basic_ios<char,struct std::char_traits<char> >::{dtor}

std::basic_ios<char,struct std::char_traits<char> >::{dtor} this adjustor: 0
std::basic_ios<char,struct std::char_traits<char> >::__delDtor this adjustor: 0
std::basic_ios<char,struct std::char_traits<char> >::__vecDelDtor this adjustor: 0

class std::basic_ostream<char,struct std::char_traits<char> >   size(80):
        +---
 0      | {vbptr}
        +---
4       | (vtordisp for vbase std::basic_ios<char,struct std::char_traits<char> >)
        +--- (virtual base std::basic_ios<char,struct std::char_traits<char> >)
 8      | +--- (base class std::ios_base)
 8      | | {vfptr}
16      | | +--- (base class std::_Iosb<int>)
        | | +---
16      | | _Stdstr
20      | | _Mystate
24      | | _Except
28      | | _Fmtfl
32      | | _Prec
40      | | _Wide
48      | | _Arr
52      | | _Calls
56      | | _Ploc
        | | <alignment member> (size=4)
        | +---
64      | _Mystrbuf
68      | _Tiestr
72      | _Fillch
        | <alignment member> (size=7)
        +---

std::basic_ostream<char,struct std::char_traits<char> >::$vbtable@:
 0      | 0
 1      | 8 (?$basic_ostream@DU?$char_traits@D@std@@d(?$basic_ostream@DU?$char_traits@D@std@@+0)?$basic_ios@DU?$char_traits@D@std@@)

std::basic_ostream<char,struct std::char_traits<char> >::$vftable@:
        | -8
 0      | &(vtordisp) std::basic_ostream<char,struct std::char_traits<char> >::{dtor}

std::basic_ostream<char,struct std::char_traits<char> >::{dtor} this adjustor: 8
std::basic_ostream<char,struct std::char_traits<char> >::__delDtor this adjustor: 8
std::basic_ostream<char,struct std::char_traits<char> >::__vecDelDtor this adjustor: 8
vbi:       class  offset o.vbptr  o.vbte fVtorDisp
std::basic_ios<char,struct std::char_traits<char> >       8       0       4 1

class std::is_lvalue_reference<class std::basic_ostream<char,struct std::char_traits<char> > &> size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class D size(28):
        +---
 0      | +--- (base class B)
 0      | | {vbptr}
 4      | | dataB
        | +---
 8      | +--- (base class C)
 8      | | {vbptr}
12      | | dataC
        | +---
16      | dataD
        +---
        +--- (virtual base A)
20      | {vfptr}
24      | dataA
        +---

D::$vbtable@B@:
 0      | 0
 1      | 20 (Dd(B+0)A)

D::$vbtable@C@:
 0      | 0
 1      | 12 (Dd(C+0)A)

D::$vftable@:
        | -20
 0      | &thunk: this-=12; goto B::test
vbi:       class  offset o.vbptr  o.vbte fVtorDisp
               A      20       0       4 0

class std::is_nothrow_constructible<class std::allocator<char>,class std::allocator<char> >     size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::is_nothrow_constructible<class std::_String_val<struct std::_Simple_types<char> > >  size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,0>)
        | +---
        +---

class std::is_nothrow_default_constructible<class std::allocator<char> >        size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::_Aligned<8,4,char,0> size(1):
        +---
        +---

class std::_Facetptr<class std::ctype<char> >   size(1):
        +---
        +---
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.25.28610\include\ostream(743): warning C4530: 使用了 C++ 异常处理程序，但未启用展开语义。请指定 /EHsc
c1.cpp(17): note: 查看对正在编译的函数 模板 实例化“std::basic_ostream<char,std::char_traits<char>> &std::operator <<<std::char_traits<char>>(std::basic_ostream<char,std::char_traits<char>> &,const char *)”的引用

class std::basic_streambuf<char,struct std::char_traits<char> > size(56):
        +---
 0      | {vfptr}
 4      | _Gfirst
 8      | _Pfirst
12      | _IGfirst
16      | _IPfirst
20      | _Gnext
24      | _Pnext
28      | _IGnext
32      | _IPnext
36      | _Gcount
40      | _Pcount
44      | _IGcount
48      | _IPcount
52      | _Plocale
        +---

std::basic_streambuf<char,struct std::char_traits<char> >::$vftable@:
        | &?$basic_streambuf@DU?$char_traits@D@std@@_meta
        |  0
 0      | &std::basic_streambuf<char,struct std::char_traits<char> >::{dtor}
 1      | &std::basic_streambuf<char,struct std::char_traits<char> >::_Lock
 2      | &std::basic_streambuf<char,struct std::char_traits<char> >::_Unlock
 3      | &std::basic_streambuf<char,struct std::char_traits<char> >::overflow
 4      | &std::basic_streambuf<char,struct std::char_traits<char> >::pbackfail
 5      | &std::basic_streambuf<char,struct std::char_traits<char> >::showmanyc
 6      | &std::basic_streambuf<char,struct std::char_traits<char> >::underflow
 7      | &std::basic_streambuf<char,struct std::char_traits<char> >::uflow
 8      | &std::basic_streambuf<char,struct std::char_traits<char> >::xsgetn
 9      | &std::basic_streambuf<char,struct std::char_traits<char> >::xsputn
10      | &std::basic_streambuf<char,struct std::char_traits<char> >::seekoff
11      | &std::basic_streambuf<char,struct std::char_traits<char> >::seekpos
12      | &std::basic_streambuf<char,struct std::char_traits<char> >::setbuf
13      | &std::basic_streambuf<char,struct std::char_traits<char> >::sync
14      | &std::basic_streambuf<char,struct std::char_traits<char> >::imbue

std::basic_streambuf<char,struct std::char_traits<char> >::{dtor} this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::_Lock this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::_Unlock this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::overflow this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::pbackfail this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::showmanyc this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::underflow this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::uflow this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::xsgetn this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::xsputn this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::seekoff this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::seekpos this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::setbuf this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::sync this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::imbue this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::__delDtor this adjustor: 0
std::basic_streambuf<char,struct std::char_traits<char> >::__vecDelDtor this adjustor: 0
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c1.cpp(47) : warning C4700: 使用了未初始化的局部变量“a”
Microsoft (R) Incremental Linker Version 14.25.28610.4
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:c1.exe
c1.obj

## cl /d1 reportSingleClassLayoutB c1.cpp

用于 x86 的 Microsoft (R) C/C++ 优化编译器 19.25.28610.4 版
版权所有(C) Microsoft Corporation。保留所有权利。

c1.cpp

class _s__RTTIBaseClassDescriptor       size(28):
        +---
 0      | pTypeDescriptor
 4      | numContainedBases
 8      | _PMD where
20      | attributes
24      | pClassDescriptor
        +---

class _s__RTTIBaseClassArray    size(1):
        +---
 0      | arrayOfBaseClassDescriptors
        +---

class __vcrt_va_list_is_reference<wchar_t const * const>        size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<wchar_t const * const>    size(1):
        +---
        +---

class __vcrt_va_list_is_reference<wchar_t const *>      size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<wchar_t const *>  size(1):
        +---
        +---

class __vcrt_va_list_is_reference<char const * const>   size(1):
        +---
        +---

class __vcrt_assert_va_start_is_not_reference<char const * const>       size(1):
        +---
        +---

class std::_Basic_container_proxy_ptr12 size(4):
        +---
 0      | _Ptr
        +---

class std::_String_val<`template-type-parameter-1'>::_Bxty      size(0):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<char> >::_Bxty size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<wchar_t> >::_Bxty      size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<char16_t> >::_Bxty     size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class std::_String_val<struct std::_Simple_types<char32_t> >::_Bxty     size(16):
        +---
 0      | _Buf
 0      | _Ptr
 0      | _Alias
        +---

class B size(16):
        +---
 0      | {vbptr}
 4      | dataB
        +---
        +--- (virtual base A)
 8      | {vfptr}
12      | dataA
        +---

B::$vbtable@:
 0      | 0
 1      | 8 (Bd(B+0)A)

B::$vftable@:
        | -8
 0      | &B::test

B::test this adjustor: 8
vbi:       class  offset o.vbptr  o.vbte fVtorDisp
               A       8       0       4 0
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.25.28610\include\ostream(743): warning C4530: 使用了 C++ 异常处理程序，但未启用展开语义。请指定 /EHsc
c1.cpp(17): note: 查看对正在编译的函数 模板 实例化“std::basic_ostream<char,std::char_traits<char>> &std::operator <<<std::char_traits<char>>(std::basic_ostream<char,std::char_traits<char>> &,const char *)”的引用
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c1.cpp(47) : warning C4700: 使用了未初始化的局部变量“a”
Microsoft (R) Incremental Linker Version 14.25.28610.4
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:c1.exe
c1.obj

## cl /d1 reportSingleClassLayoutC c1.cpp

用于 x86 的 Microsoft (R) C/C++ 优化编译器 19.25.28610.4 版
版权所有(C) Microsoft Corporation。保留所有权利。

c1.cpp

class _s__CatchableType size(28):
        +---
 0      | properties
 4      | pType
 8      | _PMD thisDisplacement
20      | sizeOrOffset
24      | copyFunction
        +---

class _s__CatchableTypeArray    size(4):
        +---
 0      | nCatchableTypes
 4      | arrayOfCatchableTypes
        +---

class _s__RTTIBaseClassDescriptor       size(28):
        +---
 0      | pTypeDescriptor
 4      | numContainedBases
 8      | _PMD where
20      | attributes
24      | pClassDescriptor
        +---

class _s__RTTIBaseClassArray    size(1):
        +---
 0      | arrayOfBaseClassDescriptors
        +---

class _s__RTTIClassHierarchyDescriptor  size(16):
        +---
 0      | signature
 4      | attributes
 8      | numBaseClasses
12      | pBaseClassArray
        +---

class _s__RTTICompleteObjectLocator     size(20):
        +---
 0      | signature
 4      | offset
 8      | cdOffset
12      | pTypeDescriptor
16      | pClassDescriptor
        +---

class _CrtMemState      size(52):
        +---
 0      | pBlockHeader
 4      | lCounts
24      | lSizes
44      | lHighWaterCount
48      | lTotalCount
        +---

class _Combined_type<float,double>      size(1):
        +---
        +---

class _Combined_type<float,long double> size(1):
        +---
        +---

class std::numeric_limits<signed char>  size(1):
        +---
 0      | +--- (base class std::_Num_int_base)
 0      | | +--- (base class std::_Num_base)
        | | +---
        | +---
        +---

class std::_Is_character<signed char>   size(1):
        +---
 0      | +--- (base class std::integral_constant<bool,1>)
        | +---
        +---

class std::_Container_base0     size(1):
        +---
        +---

class std::_Container_proxy     size(8):
        +---
 0      | _Mycont
 4      | _Myfirstiter
        +---

class std::_Container_base12    size(4):
        +---
 0      | _Myproxy
        +---

class std::_WChar_traits<char16_t>      size(1):
        +---
        +---

class std::_Char_traits<char32_t,unsigned int>  size(1):
        +---
        +---

class std::_WChar_traits<wchar_t>       size(1):
        +---
        +---

class std::_WChar_traits<unsigned short>        size(1):
        +---
        +---

class std::_Compressed_pair<class std::allocator<char>,class std::_String_val<struct std::_Simple_types<char> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@D@std@@ _Myval2
        +---

class std::_Compressed_pair<class std::allocator<wchar_t>,class std::_String_val<struct std::_Simple_types<wchar_t> >,1>        size(24):
        +---
 0      | +--- (base class std::allocator<wchar_t>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@_W@std@@ _Myval2
        +---

class std::_Compressed_pair<class std::allocator<char16_t>,class std::_String_val<struct std::_Simple_types<char16_t> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char16_t>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@_S@std@@ _Myval2
        +---

class std::_Compressed_pair<class std::allocator<char32_t>,class std::_String_val<struct std::_Simple_types<char32_t> >,1>      size(24):
        +---
 0      | +--- (base class std::allocator<char32_t>)
        | +---
 0      | ?$_String_val@U?$_Simple_types@_U@std@@ _Myval2
        +---

class std::_Conditionally_enabled_hash<int,1>   size(1):
        +---
        +---

class _Collvec  size(8):
        +---
 0      | _Page
 4      | _LocaleName
        +---

class _Ctypevec size(16):
        +---
 0      | _Page
 4      | _Table
 8      | _Delfl
12      | _LocaleName
        +---

class _Cvtvec   size(44):
        +---
 0      | _Page
 4      | _Mbcurmax
 8      | _Isclocale
12      | _Isleadbyte
        +---

class std::_Crt_new_delete      size(1):
        +---
        +---

class C size(16):
        +---
 0      | {vbptr}
 4      | dataC
        +---
        +--- (virtual base A)
 8      | {vfptr}
12      | dataA
        +---

C::$vbtable@:
 0      | 0
 1      | 8 (Cd(C+0)A)

C::$vftable@:
        | -8
 0      | &A::test
vbi:       class  offset o.vbptr  o.vbte fVtorDisp
               A       8       0       4 0

class std::_Compressed_pair<struct std::default_delete<class std::_Facet_base>,class std::_Facet_base *,1>      size(4):
        +---
 0      | +--- (base class std::default_delete<class std::_Facet_base>)
        | +---
 0      | _Myval2
        +---
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.25.28610\include\ostream(743): warning C4530: 使用了 C++ 异常处理程序，但未启用展开语义。请指定 /EHsc
c1.cpp(17): note: 查看对正在编译的函数 模板 实例化“std::basic_ostream<char,std::char_traits<char>> &std::operator <<<std::char_traits<char>>(std::basic_ostream<char,std::char_traits<char>> &,const char *)”的引用
D:\USTC\PrinciplesandTechniquesofCompilers\PrinciplesofCompilers_git\compiler\H10\c1.cpp(47) : warning C4700: 使用了未初始化的局部变量“a”
Microsoft (R) Incremental Linker Version 14.25.28610.4
Copyright (C) Microsoft Corporation.  All rights reserved.

/out:c1.exe
c1.obj

