#ifndef CRC32CSO_CRC32C_H
#define CRC32CSO_CRC32C_H

#include "crossPlatformMacros.hpp"

#include <cstddef>
#include <cstdint>

/*
    Computes CRC-32C using Castagnoli polynomial of 0x82f63b78.
    This polynomial is better at detecting errors than the more common CRC-32 polynomial.
    CRC-32C is implemented in hardware on newer Intel processors.
    This function will use the hardware if available and fall back to fast software implementation.
*/
extern EXPIMP_CRC32CSO uint32_t crc32c_append(
    uint32_t crc,               // initial CRC, typically 0, may be used to accumulate CRC from multiple buffers
    const uint8_t*
    input,       // data to be put through the CRC algorithm
    size_t length);             // length of the data in the input buffer

//extern "C" CRC32C_API void crc32c_unittest();

#endif
