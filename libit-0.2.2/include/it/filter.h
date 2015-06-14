/*
   libit - Library for basic source and channel coding functions
   Copyright (C) 2005-2005 Vivien Chappelier, Herve Jegou

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

/*
  Filtering
  Copyright (C) 2005 Vivien Chappelier
*/

#ifndef __it_filter_h
#define __it_filter_h

#include <it/types.h>
#include <it/mat.h>

#ifdef __cplusplus
extern "C" {
#endif

  mat  mat_filter_fir (mat input, mat filter, int px, int py);

#ifdef __cplusplus
}
#endif				/* extern "C" */
#endif
