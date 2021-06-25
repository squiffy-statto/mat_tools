/*******************************************************************************
| Name       : mat_tools_example1.sas
| Purpose    : Example calls for mat_tools.
| SAS Version: 9.4
| Created By : Thomas Drury
| Date       : 21JUN21 
*******************************************************************************/;

*** CHECK EXAMPLES ***;
data test1;

  array matrix1 [3,3] (3 2 1  2 3 2  1 2 3);
  array matrix2 [3,3] (3 2 1  2 3 2  1 2 3);
  array result1 [3,3];

  call mat_add(matrix1, matrix2, result1);
  put "MAT_ADD: CHECK";
  put "SHOULD BE: [6 4 2 4 6 4 2 4 6 ]";
  put "RESULT IS: [" result1[*] "]" / ;

  call mat_sub(matrix1, matrix2, result1);
  put "MAT_SUB: CHECK";
  put "SHOULD BE: [0 0 0 0 0 0 0 0 0 ]";
  put "RESULT IS: [" result1[*] "]" / ;

  call mat_mult(matrix1, matrix2, result1);
  put "MAT_MULT: CHECK";
  put "SHOULD BE: [14 14 10 14 17 14 10 14 14 ]";
  put "RESULT IS: [" result1[*] "]" / ;

  call mat_inv(matrix1, result1);
  put "MAT_INV: CHECK";
  put "SHOULD BE: [0.625 -0.5 0.125 -0.5 1 -0.5 0.125 -0.5 0.625 ]";
  put "RESULT IS: [" result1[*] "]" / ;

  call mat_root(matrix1, result1);
  put "MAT_ROOT: CHECK";
  put "SHOULD BE: [1.73 0 0 1.15 1.29 0 0.58 1.03 1.26]";
  put "RESULT IS: [" result1[*] "]" / ;

  call mat_power(matrix1, 2, result1);
  put "MAT_POWER: CHECK";
  put "SHOULD BE: [14 14 10 14 17 14 10 14 14 ]";
  put "RESULT IS: [" result1[*] "]" / ;

  array matrix3[3,3] (1 2 3  4 5 6  7 8 9);
  array result2[3,3];

  call mat_trans(matrix3, result2);
  put "MAT_TRANS: CHECK";
  put "SHOULD BE: [1 4 7 2 5 8 3 6 9 ]";
  put "RESULT IS: [" result2[*] "]" / ;

  det1 = mat_det(matrix1);
  put "MAT_DET: CHECK";
  put "SHOULD BE: 8";
  put "RESULT IS: " det1 / ;

run;
