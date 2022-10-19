// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information	= DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 							Hi
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Hi(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_TAL_BDT_13_Hi_Condition;
	information	= DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent	= TRUE;
	description = "Jak se vede?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Hi_15_00");//Jak se vede?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_01");//Bu� t� se�ere n�jak� potvora, nebo t� se�ere n�jak� potvora.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_02");//Tahle ba�ina bude na�e smrt.
};
// *************************************************************************
// 							Tal
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Tal(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_TAL_BDT_13_Tal_Condition;
	information	= DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent	= TRUE;
	description = "V� n�co zaj�mav�ho o tomhle �dol�?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Tal_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Tal_15_00");//Co bys mi �ekl o tomhle �dol�?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_01");//Je tu spousta starejch kr�m�. Havran n�m nak�zal, abysme to v�ecko nakupili na jednu hromadu.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_02");//Netu��m, co s t�m chce d�lat, ale nikdo, kdo m� v�ech p�t pohromad�, by pro p�r starejch �utr� neriskoval krk.
};
// *************************************************************************
// 							News
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_TAL_BDT_13_News_Condition;
	information	= DIA_Addon_TAL_BDT_13_News_Info;
	permanent	= TRUE;
	description = "Co je nov�ho?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_News_15_00");//Seb�hlo se tu n�co nov�ho?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_01");//P�kn� ty pir�ty vod�me za nos.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_02");//Z�sobujou n�s v�zn�ma, ale od n�s je�t� nevid�li ani vindru. Nediv�m se, �e jsou nakrknut�.
	
	if (BDT_13_einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_TAL_BDT_13_News_13_03");//Co ale m��ou d�lat? P�epadnout t�bor? (sm�je se) HAHAHA.
		BDT_13_einmal = TRUE;
	};
};


FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_HI.npc	   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_TAL.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_NEWS.npc  = Hlp_GetInstanceID (slf);
}; 


