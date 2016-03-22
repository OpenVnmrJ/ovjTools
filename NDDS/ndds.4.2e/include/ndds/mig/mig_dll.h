/*
 * @(#)mig_dll.h    generated by: makeheader    Mon Dec  3 23:08:07 2007
 *
 *		built from:	dll.ifc
 */

#ifndef mig_dll_h
#define mig_dll_h



#if defined(RTI_WIN32) || defined(RTI_WINCE)
  #if defined(RTI_mig_DLL_EXPORT)
    #define MIGDllExport __declspec( dllexport )
  #else
    #define MIGDllExport
  #endif /* RTI_mig_DLL_EXPORT */

  #if defined(RTI_mig_DLL_VARIABLE) 
    #if defined(RTI_mig_DLL_EXPORT)
      #define MIGDllVariable __declspec( dllexport )
    #else
      #define MIGDllVariable __declspec( dllimport )
    #endif /* RTI_mig_DLL_EXPORT */
  #else 
    #define MIGDllVariable
  #endif /* RTI_mig_DLL_VARIABLE */
#else
  #define MIGDllExport
  #define MIGDllVariable
#endif /* RTI_WIN32 || RTI_WINCE */


#endif /* mig_dll_h */
