---
layout: post
title:  "Variables are the spice of life"
date:   2015-09-16 19:56:24
---

## DN: What is the smallest variable type that could be used to store the following values

1. 5             => byte
2. -30,000       => short
3. 255           => short (or unsigned byte)
4. 5,000,000,000 => long :'(

## Numeric types

All C primitive types are numeric

- differences are only floating vs. integer and size
    - => missing `bool` and `char`
- size can be platform dependent
    - `sizeof(<TYPE>)` can be used to find size in bytes

Type    | Standard Size (bytes)
--------|-----------------------
int     | 4
short   | 2
long    | 8
float   | 4
double  | 8
char    | 1

## Booleans
0             => false
anything else =>

```c
// wrong!
if ( x = 6 )  {...}
// okay
if ( x == 6 ) {...}
// but be careful
if ( 6 == x ) {...}
```
