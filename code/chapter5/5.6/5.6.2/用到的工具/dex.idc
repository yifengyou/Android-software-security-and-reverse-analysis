#define UNLOADED_FILE   1
#include <idc.idc>

static main(void)
{
  Enums();              // enumerations
  Structures();         // structure types
	LowVoids(0x401000);
	HighVoids(0x409000);
}

//------------------------------------------------------------------------
// Information about enum types

static Enums(void) {
        auto id;
        BeginTypeUpdating(UTP_ENUM);
        EndTypeUpdating(UTP_ENUM);
}

static Structures_0(id) {
        auto mid;

	id = AddStrucEx(-1,"DexMapList",0);
	id = AddStrucEx(-1,"DexMapItem",0);
	id = AddStrucEx(-1,"DexStringId",0);
	id = AddStrucEx(-1,"DexFieldId",0);
	id = AddStrucEx(-1,"DexAnnotationItem",0);
	id = AddStrucEx(-1,"DexTypeId",0);
	id = AddStrucEx(-1,"DexClassLookup",0);
	id = AddStrucEx(-1,"DexOptHeader",0);
	id = AddStrucEx(-1,"DexAnnotationSetRefItem",0);
	id = AddStrucEx(-1,"DexAnnotationSetItem",0);
	id = AddStrucEx(-1,"DexEncodedArray",0);
	id = AddStrucEx(-1,"DexParameterAnnotationsItem",0);
	id = AddStrucEx(-1,"DexMethodAnnotationsItem",0);
	id = AddStrucEx(-1,"DexFieldAnnotationsItem",0);
	id = AddStrucEx(-1,"DexAnnotationsDirectoryItem",0);
	id = AddStrucEx(-1,"DexLink",0);
	id = AddStrucEx(-1,"DexTry",0);
	id = AddStrucEx(-1,"DexCode",0);
	id = AddStrucEx(-1,"DexTypeList",0);
	id = AddStrucEx(-1,"DexTypeItem",0);
	id = AddStrucEx(-1,"DexClassDef",0);
	id = AddStrucEx(-1,"DexProtoId",0);
	id = AddStrucEx(-1,"DexMethodId",0);
	id = AddStrucEx(-1,"DexAnnotationSetRefList",0);
	id = AddStrucEx(-1,"DexHeader",0);
	
	id = GetStrucIdByName("DexMapItem");
	mid = AddStrucMember(id,"type",	0,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"unused",	0X2,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"size",	0X4,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"offset",	0X8,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexMapList");
	mid = AddStrucMember(id,"size",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"list",	0X4,	0x60000400,	GetStrucIdByName("DexMapItem"),	12);
	
	id = GetStrucIdByName("DexStringId");
	mid = AddStrucMember(id,"stringDataOff",	0,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexFieldId");
	mid = AddStrucMember(id,"classIdx",	0,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"typeIdx",	0X2,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"nameIdx",	0X4,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexAnnotationItem");
	mid = AddStrucMember(id,"visibility",	0,	0x000400,	-1,	1);
	mid = AddStrucMember(id,"annotation",	0X1,	0x000400,	-1,	1);
	
	id = GetStrucIdByName("DexTypeId");
	mid = AddStrucMember(id,"descriptorIdx",	0,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexClassLookup");
	mid = AddStrucMember(id,"size",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"numEntries",	0X4,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexOptHeader");
	mid = AddStrucMember(id,"magic",	0,	0x000400,	-1,	8);
	mid = AddStrucMember(id,"dexOffset",	0X8,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"dexLength",	0XC,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"depsOffset",	0X10,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"depsLength",	0X14,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"optOffset",	0X18,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"optLength",	0X1C,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"flags",	0X20,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"checksum",	0X24,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexAnnotationSetItem");
	mid = AddStrucMember(id,"size",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"entries",	0X4,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexEncodedArray");
	mid = AddStrucMember(id,"array",	0,	0x000400,	-1,	1);
	
	id = GetStrucIdByName("DexParameterAnnotationsItem");
	mid = AddStrucMember(id,"methodIdx",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"annotationsOff",	0X4,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexMethodAnnotationsItem");
	mid = AddStrucMember(id,"methodIdx",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"annotationsOff",	0X4,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexFieldAnnotationsItem");
	mid = AddStrucMember(id,"fieldIdx",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"annotationsOff",	0X4,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexAnnotationsDirectoryItem");
	mid = AddStrucMember(id,"classAnnotationsOff",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"fieldsSize",	0X4,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"methodsSize",	0X8,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"parametersSize",	0XC,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexLink");
	mid = AddStrucMember(id,"bleargh",	0,	0x000400,	-1,	1);
	
	id = GetStrucIdByName("DexTry");
	mid = AddStrucMember(id,"startAddr",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"insnCount",	0X4,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"handlerOff",	0X6,	0x10000400,	-1,	2);
	
	id = GetStrucIdByName("DexCode");
	mid = AddStrucMember(id,"registersSize",	0,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"insSize",	0X2,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"outsSize",	0X4,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"triesSize",	0X6,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"debugInfoOff",	0X8,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"insnsSize",	0XC,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"insns",	0X10,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"_padding",	0X12,	0x000400,	-1,	2);
	
	id = GetStrucIdByName("DexTypeItem");
	mid = AddStrucMember(id,"typeIdx",	0,	0x10000400,	-1,	2);
	
	id = GetStrucIdByName("DexTypeList");
	mid = AddStrucMember(id,"size",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"list",	0X4,	0x60000400,	GetStrucIdByName("DexTypeItem"),	2);
	mid = AddStrucMember(id,"_padding",	0X6,	0x000400,	-1,	2);
	
	id = GetStrucIdByName("DexClassDef");
	mid = AddStrucMember(id,"classIdx",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"accessFlags",	0X4,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"superclassIdx",	0X8,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"interfacesOff",	0XC,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"sourceFileIdx",	0X10,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"annotationsOff",	0X14,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"classDataOff",	0X18,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"staticValuesOff",	0X1C,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexProtoId");
	mid = AddStrucMember(id,"shortyIdx",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"returnTypeIdx",	0X4,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"parametersOff",	0X8,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexMethodId");
	mid = AddStrucMember(id,"classIdx",	0,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"protoIdx",	0X2,	0x10000400,	-1,	2);
	mid = AddStrucMember(id,"nameIdx",	0X4,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexAnnotationSetRefItem");
	mid = AddStrucMember(id,"annotationsOff",	0,	0x20000400,	-1,	4);
	
	id = GetStrucIdByName("DexAnnotationSetRefList");
	mid = AddStrucMember(id,"size",	0,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"list",	0X4,	0x60000400,	GetStrucIdByName("DexAnnotationSetRefItem"),	4);
	
	id = GetStrucIdByName("DexHeader");
	mid = AddStrucMember(id,"magic",	0,	0x000400,	-1,	8);
	mid = AddStrucMember(id,"checksum",	0X8,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"signature",	0XC,	0x000400,	-1,	20);
	mid = AddStrucMember(id,"fileSize",	0X20,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"headerSize",	0X24,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"endianTag",	0X28,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"linkSize",	0X2C,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"linkOff",	0X30,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"mapOff",	0X34,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"stringIdsSize",	0X38,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"stringIdsOff",	0X3C,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"typeIdsSize",	0X40,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"typeIdsOff",	0X44,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"protoIdsSize",	0X48,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"protoIdsOff",	0X4C,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"fieldIdsSize",	0X50,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"fieldIdsOff",	0X54,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"methodIdsSize",	0X58,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"methodIdsOff",	0X5C,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"classDefsSize",	0X60,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"classDefsOff",	0X64,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"dataSize",	0X68,	0x20000400,	-1,	4);
	mid = AddStrucMember(id,"dataOff",	0X6C,	0x20000400,	-1,	4);
	return id;
}

//------------------------------------------------------------------------
// Information about structure types

static Structures(void) {
        auto id;
        BeginTypeUpdating(UTP_STRUCT);	id = Structures_0(id);
        EndTypeUpdating(UTP_STRUCT);
}

// End of file.
