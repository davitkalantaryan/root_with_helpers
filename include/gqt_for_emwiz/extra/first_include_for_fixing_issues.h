//  
// file:			first_include_for_fixing_issues.h
// path:			${repositoryRoot}/include/gqt_for_emwiz/extra/first_include_for_fixing_issues.h  
// created on:		2021 Apr 08  
// created by:		Davit Kalantaryan (davit.kalantaryan@desy.de)  
//

#ifndef ROOT_WITH_HELPERS_INCLUDE_GQT_FE_FIRST_INCLUDE_H
#define ROOT_WITH_HELPERS_INCLUDE_GQT_FE_FIRST_INCLUDE_H

#if 0

#include <Rtypes.h>

#ifdef ClassImpUnique
#undef ClassImpUnique
#endif

#ifdef ClassImp
#undef  ClassImp
#endif


#define ClassImpUnique(name,key)
#define ClassImp(name)

#define NO_NEED_FOR_GenerateInitInstance


#endif



#endif  // #ifndef ROOT_WITH_HELPERS_INCLUDE_GQT_FE_FIRST_INCLUDE_H
