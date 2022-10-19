///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_PAL_298_EXIT   (C_INFO)
{
	npc         = PAL_298_Ritter;
	nr          = 999;
	condition   = DIA_PAL_298_EXIT_Condition;
	information = DIA_PAL_298_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_PAL_298_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_PAL_298_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Pass		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_Pass_Condition;
	information	 = 	DIA_PAL_298_Pass_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dok¹d prowadzi ta œcie¿ka?";
};
func int DIA_PAL_298_Pass_Condition ()
{	
	if (Kapitel == 1) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_Pass_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Pass_15_00");//Dok¹d prowadzi ta œcie¿ka?
	AI_Output (self, other, "DIA_PAL_298_Pass_09_01");//Za bram¹ le¿y prze³êcz prowadz¹ca do Górniczej Doliny.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_02");//Po tej stronie jesteœmy my - po drugiej zaœ okopa³a siê grupa orków.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_03");//Lepiej zawróæ - têdy nie przejdziesz.
};
///////////////////////////////////////////////////////////////////////
//	Info TRESPASS
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_TRESPASS		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	2;
	condition	 = 	DIA_PAL_298_TRESPASS_Condition;
	information	 = 	DIA_PAL_298_TRESPASS_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_PAL_298_TRESPASS_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING) 
	{	
		return TRUE;
	};
};
func void DIA_PAL_298_TRESPASS_Info ()
{
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//Jesteœ pewien, ¿e chcesz tam iœæ? Obawiam siê, ¿e daleko nie zajdziesz - po drugiej stronie stacjonuj¹ orkowie.
	AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//Jeœli istnieje droga prowadz¹ca do Górniczej Doliny, odnajdê j¹.
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//W porz¹dku, wiêc idŸ. Niech Innos ciê prowadzi.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm1		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm1_Condition;
	information	 = 	DIA_PAL_298_Perm1_Info;
	permanent	 = 	TRUE;
	description	 = 	"Wiêc jeœli pójdê, to na w³asne ryzyko?";
};
func int DIA_PAL_298_Perm1_Condition ()
{	
	if (Kapitel == 1)
	&& Npc_KnowsInfo (other, DIA_PAL_298_Pass)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm1_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm1_15_00");//Wiêc jeœli pójdê, to na w³asne ryzyko?
	AI_Output (self, other, "DIA_PAL_298_Perm1_09_01");//Jeœli pójdziesz, zginiesz. Dlatego w³aœnie tu jesteœmy. Staramy siê nie dopuœciæ do takiego aktu g³upoty.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm 
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_298_Perm2		(C_INFO)
{
	npc			 = 	PAL_298_Ritter;
	nr			 = 	3;
	condition	 = 	DIA_PAL_298_Perm2_Condition;
	information	 = 	DIA_PAL_298_Perm2_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak wygl¹da sytuacja?";
};
func int DIA_PAL_298_Perm2_Condition ()
{	
	if  (Kapitel >= 2)
	{		
		return TRUE;
	};
};
func void DIA_PAL_298_Perm2_Info ()
{
	AI_Output (other, self, "DIA_PAL_298_Perm2_15_00");//Jak wygl¹da sytuacja?
	AI_Output (self, other, "DIA_PAL_298_Perm2_09_01");//Wszystko jakby siê uspokoi³o. Sytuacja jest pod nasz¹ kontrol¹.
};


