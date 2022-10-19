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
	description	 = 	"Dok�d prowadzi ta �cie�ka?";
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
	AI_Output (other, self, "DIA_PAL_298_Pass_15_00");//Dok�d prowadzi ta �cie�ka?
	AI_Output (self, other, "DIA_PAL_298_Pass_09_01");//Za bram� le�y prze��cz prowadz�ca do G�rniczej Doliny.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_02");//Po tej stronie jeste�my my - po drugiej za� okopa�a si� grupa ork�w.
	AI_Output (self, other, "DIA_PAL_298_Pass_09_03");//Lepiej zawr�� - t�dy nie przejdziesz.
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
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_00");//Jeste� pewien, �e chcesz tam i��? Obawiam si�, �e daleko nie zajdziesz - po drugiej stronie stacjonuj� orkowie.
	AI_Output (other, self, "DIA_PAL_298_TRESPASS_15_01");//Je�li istnieje droga prowadz�ca do G�rniczej Doliny, odnajd� j�.
	AI_Output (self, other, "DIA_PAL_298_TRESPASS_09_02");//W porz�dku, wi�c id�. Niech Innos ci� prowadzi.
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
	description	 = 	"Wi�c je�li p�jd�, to na w�asne ryzyko?";
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
	AI_Output (other, self, "DIA_PAL_298_Perm1_15_00");//Wi�c je�li p�jd�, to na w�asne ryzyko?
	AI_Output (self, other, "DIA_PAL_298_Perm1_09_01");//Je�li p�jdziesz, zginiesz. Dlatego w�a�nie tu jeste�my. Staramy si� nie dopu�ci� do takiego aktu g�upoty.
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
	description	 = 	"Jak wygl�da sytuacja?";
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
	AI_Output (other, self, "DIA_PAL_298_Perm2_15_00");//Jak wygl�da sytuacja?
	AI_Output (self, other, "DIA_PAL_298_Perm2_09_01");//Wszystko jakby si� uspokoi�o. Sytuacja jest pod nasz� kontrol�.
};


