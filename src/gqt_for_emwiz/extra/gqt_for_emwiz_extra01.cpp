
#include <gqt_for_emwiz/extra/first_include_for_fixing_issues.h>
#include "Rtypes.h"
#include "TGQt.h"
#include "TQtApplication.h"
#include "TQtWidget.h"
#include "TQtClientFilter.h"
#include "TQMimeTypes.h"
#include "TQtTimer.h"
#include "TQtBrush.h"
#include "TQtMarker.h"
#include "TQtPadFont.h"
#include "TQtClientWidget.h"
#include <typeinfo>
#include <iostream>

#ifndef ROOT_TGenericClassInfo
#include "TGenericClassInfo.h"
#endif

namespace _impl{

// All job done by these template function

#ifndef NO_NEED_FOR_GenerateInitInstance

template <class T>
static ::ROOT::TGenericClassInfo* GenerateInitInstanceT(const T* a_pArg)
{
	const std::type_info& tiT = typeid(T);
	
	::std::cout << "type is:" << tiT.name()<< ", val="<<a_pArg << ::std::endl;
		
	return new ::ROOT::TGenericClassInfo(tiT.name(),(std::string(tiT.name())+".h").c_str(),
								  100,tiT,nullptr,nullptr,nullptr,0,sizeof(T));
	
}


#endif  // #ifndef NO_NEED_FOR_GenerateInitInstance


template <class T>
static ::TClass* ClassImplClass(void)
{
	return nullptr;
}


template <class T>
static void ClassImplStreamer(T*, ::TBuffer&)
{
}

}  // namespace _impl{


#ifndef NO_NEED_FOR_GenerateInitInstance

namespace ROOT {


//template <class T> TGenericClassInfo *GenerateInitInstance(const T*);
//
//template <> TGenericClassInfo *GenerateInitInstance<TGQt>(const TGQt*)
//{
//	return nullptr;
//}



TGenericClassInfo *GenerateInitInstance(const TQtMarker* a_pMemb)
{
	return ::_impl::GenerateInitInstanceT(a_pMemb);
}

TGenericClassInfo *GenerateInitInstance(const TQtBrush* a_pMemb)
{
	return ::_impl::GenerateInitInstanceT(a_pMemb);
}

TGenericClassInfo *GenerateInitInstance(const TQtTimer* a_pMemb)
{
	return ::_impl::GenerateInitInstanceT(a_pMemb);
}

TGenericClassInfo *GenerateInitInstance(const TGQt* a_pMemb)
{
	return ::_impl::GenerateInitInstanceT(a_pMemb);
}

TGenericClassInfo *GenerateInitInstance(const TQtApplication* a_pMemb)
{
	return ::_impl::GenerateInitInstanceT(a_pMemb);
}

TGenericClassInfo *GenerateInitInstance(const TQtWidget* a_pMemb)
{
	return ::_impl::GenerateInitInstanceT(a_pMemb);
}

TGenericClassInfo *GenerateInitInstance(const TQtClientFilter* a_pMemb)
{
	return ::_impl::GenerateInitInstanceT(a_pMemb);
}


}  // namespace ROOT {

#else 


#endif  // #ifndef NO_NEED_FOR_GenerateInitInstance


class RtIniter{
public:
	RtIniter() : m_pGt(nullptr){}
	~RtIniter(){Cleanup();}
	void Initialize(){
		if(!m_pGt){
			//m_pGt = new TGQt;
			//m_pGt->Init();
			m_pGt = new TGQt("ta","tt");
		}
	}
	void Cleanup(){
		if(m_pGt){
			delete m_pGt;
			m_pGt = nullptr;
		}
	}
private:
	TGQt* m_pGt;
}static s_RtIniter;

void GQt_for_emwiz_initialize(void)
{
	s_RtIniter.Initialize();
}

void GQt_for_emwiz_clean(void)
{
	s_RtIniter.Cleanup();
}



#define ClassImplNew(_className)								\
TClass* _className::Class(){									\
	return ::_impl::ClassImplClass< _className >();				\
}																\
																\
void _className::Streamer(TBuffer& a_buffer){					\
	::_impl::ClassImplStreamer< _className >(this,a_buffer);	\
}


ClassImplNew(TGQt)
ClassImplNew(TQtApplication)
ClassImplNew(TQtBrush)
ClassImplNew(TQtMarker)
ClassImplNew(TQtPadFont)
ClassImplNew(TQtWidget)
ClassImplNew(TQtTimer)
ClassImplNew(TQtClientFilter)
ClassImplNew(TQtClientWidget)
