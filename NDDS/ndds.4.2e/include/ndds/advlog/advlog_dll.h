/*
 * @(#)advlog_dll.h    generated by: makeheader    Mon Dec  3 23:07:58 2007
 *
 *		built from:	dll.ifc
 */

#ifndef advlog_dll_h
#define advlog_dll_h



#if defined(RTI_WIN32) || defined(RTI_WINCE)
  #if defined(RTI_advlog_DLL_EXPORT)
    #define ADVLOGDllExport __declspec( dllexport )
  #else
    #define ADVLOGDllExport
  #endif /* RTI_advlog_DLL_EXPORT */

  #if defined(RTI_advlog_DLL_VARIABLE) 
    #if defined(RTI_advlog_DLL_EXPORT)
      #define ADVLOGDllVariable __declspec( dllexport )
    #else
      #define ADVLOGDllVariable __declspec( dllimport )
    #endif /* RTI_advlog_DLL_EXPORT */
  #else 
    #define ADVLOGDllVariable
  #endif /* RTI_advlog_DLL_VARIABLE */
#else
  #define ADVLOGDllExport
  #define ADVLOGDllVariable
#endif /* RTI_WIN32 || RTI_WINCE */


#endif /* advlog_dll_h */