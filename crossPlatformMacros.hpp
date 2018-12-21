//because windows sucks...

#ifndef CRC32CSO_CROSSPLATFORMMACROS_HPP
#define CRC32CSO_CROSSPLATFORMMACROS_HPP

#include <QtCore/QtGlobal>

//remember to define this variable in the .pro file
#if defined(CRC32CSO_LIBRARY)
#  define EXPIMP_CRC32CSO Q_DECL_EXPORT
#else
#  define EXPIMP_CRC32CSO Q_DECL_IMPORT
#endif

#endif // CRC32CSO_CROSSPLATFORMMACROS_HPP
