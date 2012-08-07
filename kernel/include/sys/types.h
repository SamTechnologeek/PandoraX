#ifndef __TYPES_H__
#define __TYPES_H__
/* Signed and unsigned 8 bit integers */
typedef signed char int8;
typedef unsigned char Uint8;
/* Signed and unsigned 16 bit integers */
typedef signed short int16;
typedef unsigned short Uint16;
/* Signed and unsigned 32 bit integers */
typedef signed int32;
typedef unsigned Uint32;
/* Signed and unsigned 64 bit integers */
typedef signed long long int64;
typedef unsigned long long Uint64;
/* String implementation */
typedef char* string;
/* 2D point */
typedef struct
{
  int32 x;
  int32 y;
} point2d;
/* Unsigned 2D point */
typedef struct
{
  Uint32 x;
  Uint32 y;
} Upoint2d;
/* 3D point */
typedef struct
{
  int32 x;
  int32 y;
  int32 z;
} point3d;
/* Unsigned 2D point. */
typedef struct
{
  Uint32 x;
  Uint32 y;
  Uint32 z;
} Upoint3d;

#endif /* types.h */
