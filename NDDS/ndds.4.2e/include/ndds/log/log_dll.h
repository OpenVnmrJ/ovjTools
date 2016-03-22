/*
 * @(#)log_dll.h    generated by: makeheader    Mon Dec  3 23:07:43 2007
 *
 *		built from:	dll.ifc
 */

#ifndef log_dll_h
#define log_dll_h



#if defined(RTI_WIN32) || defined(RTI_WINCE)
  #if defined(RTI_log_DLL_EXPORT)
    #define RTILogDllExport _declspec( dllexport )
  #else
    #define RTILogDllExport
  #endif /* RTI_log_DLL_EXPORT */

  #if defined(RTI_log_DLL_VARIABLE) 
    #if defined(RTI_log_DLL_EXPORT)
      #define RTILogDllVariable _declspec( dllexport )
    #else
      #define RTILogDllVariable _declspec( dllimport )
    #endif /* RTI_log_DLL_EXPORT */
  #else 
    #define RTILogDllVariable
  #endif /* RTI_log_DLL_VARIABLE */
#else
  #define RTILogDllExport
  #define RTILogDllVariable
#endif /* RTI_WIN32 || RTI_WINCE */


#endif /* log_dll_h */
