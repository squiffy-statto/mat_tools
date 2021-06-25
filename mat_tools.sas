/*******************************************************************************
| Name       : mat_tools.sas
| Purpose    : FCMP Functions for matrix algebra with datastep arrays
| SAS Version: 9.4
| Created By : Thomas Drury
| Date       : 21JUN21 
|-------------------------------------------------------------------------------
| Licence: MIT: Copyright (c) 2021 Thomas Drury (github: squiffystatto)
|
| Permission is hereby granted, free of charge, to any person obtaining a copy
| of this software and associated documentation files (the "Software"), to deal
| in the Software without restriction, including without limitation the rights
| to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
| copies of the Software, and to permit persons to whom the Software is
| furnished to do so, subject to the following conditions:
|
| The above copyright notice and this permission notice shall be included in all
| copies or substantial portions of the Software.
|
| the software is provided "as is", without warranty of any kind, express or
| implied, including but not limited to the warranties of merchantability,
| fitness for a particular purpose and noninfringement. in no event shall the
| authors or copyright holders be liable for any claim, damages or other
| liability, whether in an action of contract, tort or otherwise, arising from,
| out of or in connection with the software or the use or other dealings in the
| software.
|
|--------------------------------------------------------------------------------
| FCMP Call Routine List:
|--------------------------------------------------------------------------------
|
| Name     : mat_add(x,y,z) 
| Purpose  : Matrix addition  
| Arguments: x [REQ] = n by m dim defined array 
|            y [REQ] = n by m dim defined array 
|            z [REQ] = n by m dim defined array  
|
| Name     : mat_sub(x,y,z) 
| Purpose  : Matrix subtraction  
| Arguments: x [REQ] = n by m dim defined array 
|            y [REQ] = n by m dim defined array 
|            z [REQ] = n by m dim defined array  
|
| Name     : mat_mult(x,y,z) 
| Purpose  : Matrix multiplication  
| Arguments: x [REQ] = n by m dim defined array 
|            y [REQ] = m by n dim defined array 
|            z [REQ] = n by n dim defined array  
|
| Name     : mat_inv(x,z) 
| Purpose  : Matrix inversion  
| Arguments: x [REQ] = n by n dim defined array 
|            z [REQ] = n by n dim defined array
|
| Name     : mat_root(x,z) 
| Purpose  : Matrix cholesky root  
| Arguments: x [REQ] = n by n dim defined array 
|            z [REQ] = n by n dim defined array
|
| Name     : mat_power(x,a,z) 
| Purpose  : Matrix power  
| Arguments: x [REQ] = n by n dim defined array
|            a [REQ] = power exponent 
|            z [REQ] = n by n dim defined array
|
| Name     : mat_trans(x,z) 
| Purpose  : Matrix transpose  
| Arguments: x [REQ] = n by m dim defined array 
|            z [REQ] = m by n dim defined array
|
|--------------------------------------------------------------------------------
| FCMP Function List:
|--------------------------------------------------------------------------------
|
| Name     : mat_det(x) 
| Purpose  : Matrix determinant  
| Arguments: x [REQ] = n by n dim defined array 
| Returns  : Scalar variable value;
|
***********************************************************************************/;

%*** WRITE MAT_TOOLS TO LOG ***;
%let toolset = MAT_TOOLS;
%put NO%upcase(te:) &toolset. included.;

proc fcmp outlib = work.functions.mat_tools;

  *** MAT_ADD ***;
  subroutine mat_add(x[*,*],y[*,*],z[*,*]);   
    outargs z;
    call addmatrix(x,y,z);
  endsub;

  *** MAT_SUB ***;
  subroutine mat_sub(x[*,*],y[*,*],z[*,*]);   
    outargs z;
    call subtractmatrix(x,y,z);
  endsub;

  *** MAT_MULT ***;
  subroutine mat_mult(x[*,*],y[*,*],z[*,*]);   
    outargs z;
    call mult(x,y,z);
  endsub;

  *** MAT_INV ***;
  subroutine mat_inv(x[*,*],z[*,*]);   
    outargs z;
    call inv(x,z);
  endsub;

  *** MAT_ROOT ***;
  subroutine mat_root(x[*,*],z[*,*]);   
    outargs z;
    call chol(x,z);
  endsub;

  *** MAT_POWER ***;
  subroutine mat_power(x[*,*],a,z[*,*]);   
    outargs z;
    call power(x,a,z);
  endsub;

  *** MAT_TRANS ***;
  subroutine mat_trans(x[*,*],z[*,*]);   
    outargs z;
    call transpose(x,z);
  endsub;

  *** MAT_DET ***;
  function mat_det(x[*,*]);  *** RESULT IS A SCALAR SO FUNCTION USED ***;    
    call det(x,a);
	return (a);
  endsub;

quit;
  
options cmplib = work.functions; 




