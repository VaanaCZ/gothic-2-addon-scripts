// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_1_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_BL_BDT_1_EXIT_Condition;
	information	= DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Chef(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_BL_BDT_1_Chef_Condition;
	information	= DIA_Addon_BL_BDT_1_Chef_Info;
	permanent	= TRUE;
	description = "Kto tu jest szefem?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_Chef_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Chef_15_00");//Kto tu jest szefem?
	
	if (RavenIsDead == TRUE)
	{
		if Npc_IsDead (Thorus)
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_01");//Przyw�dcy przychodz� i odchodz�... Trudno ich zliczy�.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_02");//Chyba naszym nowym szefem jest Thorus.
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_03");//Naszym nowym przyw�dc� jest Kruk. On nas tu doprowadzi� i za�o�y� nasz ob�z.
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Chef_01_04");//Sprawuje kontrol� nad kopalni�, bo inaczej te psy dawno pozabija�yby si� o z�oto.
	};
};
// *************************************************************************
// 									Lager (nicht perm!)
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager_Info;
	permanent	= FALSE;
	description = "Co wiesz o obozie?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager_Condition()
{	
	if ((Sklaven_Flucht == FALSE)
	|| !Npc_IsDead (Raven))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager_15_00");//Co wiesz o obozie?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_01");//Gdy sta�o si� jasne, �e jest tu kopalnia z�ota, te szczury wyrzyna�y si� a� mi�o.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_02");//Wtedy Kruk zabi� najgorszych z nich, a reszt� wyrzuci� z kopalni.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager_01_03");//Od tamtej pory nikomu nie wolno wchodzi� na g�rny obszar. A wi�ni�w zap�dzi� do pracy w kopalni.
	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};
// *************************************************************************
// 									Lager2
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager2(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_BL_BDT_1_Lager2_Condition;
	information	= DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent	= TRUE;
	description = "Co mo�esz mi powiedzie� o obozowisku?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_Lager2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Lager2_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Lager2_15_00");//Co wiesz o obozie?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_01");//Je�eli kogo� zaatakujesz, WSZYSCY b�d� ci� �ciga�.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Lager2_01_02");//No chyba �e masz dobry pow�d, �eby si� do kogo� dobra�. Wtedy nikt nie b�dzie si� wtr�ca�.
};
// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_1_News(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_BL_BDT_1_News_Condition;
	information	= DIA_Addon_BL_BDT_1_News_Info;
	permanent	= TRUE;
	description = "Co nowego?";
};                       

FUNC INT DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_BL_BDT_1_News_Info()
{	
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_News_15_00");//Co nowego?
	
	if (RavenIsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_01");//Kruk nie �yje. Co my teraz zrobimy?
	};
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_02");//Piraci nie chc� ju� wozi� nas na sta�y l�d, bo nie dostali wynagrodzenia za ostatnie wycieczki.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_News_01_03");//Powinni�my wbi� jednego czy dw�ch na pal, wtedy reszta na pewno zmieni zdanie.
};
// *************************************************************************
// 									Sklaven
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Sklaven(C_INFO)
{
	nr			= 5;
	condition	= DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information	= DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent	= TRUE;
	description = "Co wiesz o wi�niach?";
};  
FUNC INT DIA_Addon_BL_BDT_1_Sklaven_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BL_BDT_1_Lager)
	&& ((Sklaven_Flucht == FALSE)
	|| (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_BL_BDT_1_Sklaven_Info()
{	
	 
	AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_00");//Co wiesz o wi�niach?
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_01");//Kruk chce, �eby co� wykopali. Najpierw zmusi� do tego bandyt�w, ale zbyt wielu z nich oszala�o.
	AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_02");//Dlatego zaprz�g� wi�ni�w - nawet gdy zgin�, nie ma to znaczenia.
	
	if (BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_03");//Co Kruk chce wykopa�?
		AI_Output (self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_04");//Nie mam poj�cia, ale wygl�da na to, �e to co� wi�cej ni� z�oto.
		BDT_1_Ausbuddeln = TRUE;
	};
};
FUNC VOID B_AssignAmbientInfos_Addon_BL_BDT_1 (var c_NPC slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc					= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc				= Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc				= Hlp_GetInstanceID(slf);
};




