/*------------------------------------------------------------------------
    File        : trigfn.i
    Description : Trigonometric function Windows API calls

    Author(s)   : David Zadrozny
    Created     : 11/19/2013
    Notes       : These function expect an input in radians. Conversion is 
                  required if the application handles angles using a 
                  different unit of measurement (degrees or grads).
  ----------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/


PROCEDURE sin EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate sine.
  Notes:       
------------------------------------------------------------------------------*/   

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE cos EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate cosine.
  Notes:       
------------------------------------------------------------------------------*/   

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE tan EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate tangent.
  Notes:       
------------------------------------------------------------------------------*/   

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE asin EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate arcsine.
  Notes:       
------------------------------------------------------------------------------*/   

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE acos EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate arccosine.
  Notes:       
------------------------------------------------------------------------------*/   

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE atan EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate arctangent.
  Notes:       
------------------------------------------------------------------------------*/

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE sinh EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate hyperbolic sine.
  Notes:       
------------------------------------------------------------------------------*/   

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE cosh EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate hyperbolic cosine.
  Notes:       
------------------------------------------------------------------------------*/  

    DEFINE INPUT  PARAMETER dblValue  AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.


PROCEDURE tanh EXTERNAL "MSVCRT40.DLL" CDECL:
/*------------------------------------------------------------------------------
  Purpose: Calculate hyperbolic tangent.
  Notes:       
------------------------------------------------------------------------------*/   

    DEFINE INPUT PARAMETER dblValue AS DOUBLE NO-UNDO.
    DEFINE RETURN PARAMETER dblResult AS DOUBLE NO-UNDO.

END PROCEDURE.

