/*
 * @(#)clock_dll.h    generated by: makeheader    Mon Dec  3 23:07:52 2007
 *
 *		built from:	dll.ifc
 */

#ifndef clock_dll_h
#define clock_dll_h


#if defined(RTI_WIN32) || defined(RTI_WINCE)
  #if defined(RTI_clock_DLL_EXPORT)
    #define RTIClockDllExport __declspec( dllexport )
  #else
    #define RTIClockDllExport
  #endif /* RTI_clock_DLL_EXPORT */

  #if defined(RTI_clock_DLL_VARIABLE) 
    #if defined(RTI_clock_DLL_EXPORT)
      #define RTIClockDllVariable __declspec( dllexport )
    #else
      #define RTIClockDllVariable __declspec( dllimport )
    #endif /* RTI_clock_DLL_EXPORT */
  #else 
    #define RTIClockDllVariable
    #endif /* RTI_clock_DLL_VARIABLE */
#else
  #define RTIClockDllExport
  #define RTIClockDllVariable
#endif /* RTI_WIN32 || RTI_WINCE */


#endif /* clock_dll_h */
