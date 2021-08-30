&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12
&ANALYZE-RESUME
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Procedure 
/*------------------------------------------------------------------------
    File        : calcdistance.p
    Description : Calculate distances between latitude/longitude points

    Author(s)   : David Zadrozny
    Created     : 11/19/2013
    Notes       :
  ----------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE VARIABLE dSLat AS DECIMAL NO-UNDO.
DEFINE VARIABLE dSLon AS DECIMAL NO-UNDO.
DEFINE VARIABLE dELat AS DECIMAL NO-UNDO.
DEFINE VARIABLE dELon AS DECIMAL NO-UNDO.
DEFINE VARIABLE cUnit AS CHARACTER NO-UNDO.
DEFINE VARIABLE dDistance AS DECIMAL NO-UNDO.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Procedure
&Scoped-define DB-AWARE no



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Procedure
   Allow: 
   Frames: 0
   Add Fields to: Neither
   Other Settings: CODE-ONLY COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW Procedure ASSIGN
         HEIGHT             = 15
         WIDTH              = 60.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Procedure 


/* ***************************  Main Block  *************************** */

{trigfn.i}
    
    /* Example */
    ASSIGN
        dSLat = 40.7128
        dSLon = -74.006
        dELat = 40.2206
        dELon = -74.7597
        cUnit = "mi".
        
    RUN calcDistance (INPUT dSLat, INPUT dSLon, INPUT dELat, INPUT dELon, INPUT cUnit, OUTPUT dDistance).

    MESSAGE dDistance cUnit VIEW-AS ALERT-BOX INFO BUTTONS OK.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&IF DEFINED(EXCLUDE-calcDistance) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE calcDistance Procedure 
PROCEDURE calcDistance :
/*------------------------------------------------------------------------------
  Purpose: Calculate distance between specified coordinates.    
  Notes: This calculation uses the Haversine formula.
------------------------------------------------------------------------------*/     
  
    DEFINE INPUT PARAMETER pdSLat AS DECIMAL NO-UNDO.
    DEFINE INPUT PARAMETER pdSLon AS DECIMAL NO-UNDO.
    DEFINE INPUT PARAMETER pdELat AS DECIMAL NO-UNDO.
    DEFINE INPUT PARAMETER pdELon AS DECIMAL NO-UNDO.
    DEFINE INPUT PARAMETER pcDistUnit AS CHARACTER NO-UNDO.
    DEFINE OUTPUT PARAMETER pdDist AS DECIMAL NO-UNDO.

    /* Constants */
    DEFINE VARIABLE dDegToRad AS DECIMAL NO-UNDO INITIAL 0.0174532925.  /* Convert degrees to radians. */
    DEFINE VARIABLE dEarthRadius AS DECIMAL NO-UNDO INITIAL 3959.       /* Earth mean radius in miles. */

    DEFINE VARIABLE dDiffLat AS DECIMAL NO-UNDO.
    DEFINE VARIABLE dDiffLon AS DECIMAL NO-UNDO.
    DEFINE VARIABLE dSinDiffLat AS DECIMAL NO-UNDO.
    DEFINE VARIABLE dSinDiffLon AS DECIMAL NO-UNDO.
    DEFINE VARIABLE dCosSLat AS DECIMAL NO-UNDO.
    DEFINE VARIABLE dCosELat AS DECIMAL NO-UNDO.
    DEFINE VARIABLE dASin AS DECIMAL NO-UNDO.
    DEFINE VARIABLE dHalfChordSq AS DECIMAL NO-UNDO.


    dDiffLat = (pdELat - pdSLat) * dDegToRad.
    dDiffLon = (pdELon - pdSLon) * dDegToRad.

    IF dDiffLat = ? OR dDiffLon = ? THEN
    DO:
        pdDist = ?.
        RETURN.
    END.

    RUN sin (INPUT dDiffLat / 2, OUTPUT dSinDiffLat).  /* trigfn.i */
    RUN sin (INPUT dDiffLon / 2, OUTPUT dSinDiffLon).
    RUN cos (INPUT (pdSLat * dDegToRad), OUTPUT dCosSLat).
    RUN cos (INPUT (pdELat * dDegToRad), OUTPUT dCosELat).

    dHalfChordSq = (dSinDiffLat * dSinDiffLat) + dCosSLat * dCosELat * (dSinDiffLon * dSinDiffLon).

    RUN asin (INPUT SQRT(dHalfChordSq), OUTPUT dASin).  /* trigfn.i */

    pdDist = 2 * dASin * dEarthRadius.

    CASE pcDistUnit:
        WHEN "Mi" THEN pdDist = pdDist * 1.
        WHEN "Km" THEN pdDist = pdDist * 1.60934.
    END CASE.
    
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

