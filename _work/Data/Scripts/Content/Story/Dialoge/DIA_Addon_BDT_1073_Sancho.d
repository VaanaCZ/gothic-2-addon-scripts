///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Sancho_EXIT   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 999;
	condition   = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Sancho_PICKPOCKET (C_INFO)
{
	npc			= BDT_1073_Addon_Sancho;
	nr			= 900;
	condition	= DIA_Addon_Sancho_PICKPOCKET_Condition;
	information	= DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	C_Beklauen (50, 40);
};
 
FUNC VOID DIA_Addon_Sancho_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
	
func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_HI   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Sancho_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_HI_Info()
{	
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //Cholera, znowu kto� nowy. Te� chcesz z�ota, co?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //Z�ota?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //Nie pr�buj si� ze mn� przekomarza�!
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //Wszyscy nowi chc� wej�� do kopalni.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //Nie oczekuj jednak, �e b�dzie to �atwe!

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	
	SC_KnowsRavensGoldmine = TRUE;
};

//---------------------------------------------------------------------
//	Lager
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Lager   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent   = FALSE;
	description = "Jak mog� si� dosta� do obozu?";
};
FUNC INT DIA_Addon_Sancho_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_Lager_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Lager_15_00"); //Jak mog� si� dosta� do obozu?
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //Id� po prostu mostem!
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Je�li jednak chcesz si� dosta� do kopalni, b�dziesz musia� przej�� ko�o Franka.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //On oczekuje od nowych, �e przez jaki� czas b�d� pracowa� poza obozem.
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Wszyscy nowoprzybyli musz� pracowa� na bagnie, zanim dostan� pozwolenie wej�cia do kopalni.");
};

//---------------------------------------------------------------------
//	Mine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Mine   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 3;
	condition   = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent   = FALSE;
	description = "Powiedz mi co� wi�cej o kopalni.";
};
FUNC INT DIA_Addon_Sancho_Mine_Condition()
{	
	if (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Mine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //Powiedz mi co� wi�cej o kopalni.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //Chcesz dosta� si� do �rodka? Spr�buj zaprzyja�ni� si� z Frankiem. On jest tu szefem.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //To on decyduje, kto wejdzie do obozu.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Jak b�dziesz siedzia� na ty�ku, to nie masz �adnych szans na wej�cie.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //Porozmawiaj z nim, niech ci wyznaczy jak�� robot�.
	
	B_LogEntry (Topic_Addon_Franco,"FRANKO decyduje o tym, kto mo�e wej�� do obozu. Rozdziela tak�e prac�.");
};

//---------------------------------------------------------------------
// Wo Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Franco (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 4;
	condition   = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent   = FALSE;
	description = "Gdzie znajd� tego Franka?";
};
FUNC INT DIA_Addon_Sancho_Franco_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Mine))
	&& (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Franco_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Franco_15_00"); //Gdzie znajd� tego Franka?
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //Zwykle kr�ci si� przed wej�ciem do obozu.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //No i zachowuj si�, bo inaczej dostaniesz tak� g�wnian� robot�, jak ja.
	
	B_LogEntry (Topic_Addon_Franco,"Franko kr�ci si� przy wej�ciu do obozu.");
};

//---------------------------------------------------------------------
//	Spitzel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Spitzel (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 5;
	condition   = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent   = FALSE;
	description = "Musisz tu siedzie� przez ca�y czas?";
};
FUNC INT DIA_Addon_Sancho_Spitzel_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Franco))
	|| (Npc_IsDead(Franco))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Spitzel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Spitzel_15_00");//Musisz tu siedzie� przez ca�y czas?
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//Mam sprawdza�, czy w�r�d nowych ludzi nie ma szpieg�w.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Jakby kto� zna� to zapomniane miejsce. To koniec �wiata - �rodek bagna.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Nikt nie mo�e nas tu znale�� i nie znajdzie. Po co kto� mia�by przysy�a� do nas szpieg�w?
};

//---------------------------------------------------------------------
//	Info Perm
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Perm   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 99;
	condition   = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent   = TRUE;
	description = "Co nowego?";
};
FUNC INT DIA_Addon_Sancho_Perm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Sancho_Spitzel)
	{	
		return TRUE;
	};
};
var int Comment_Franco;
var int Comment_Esteban;
FUNC VOID DIA_Addon_Sancho_Perm_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Perm_15_00");//Co nowego?
	
	if Npc_IsDead (Franco)
	&& (Comment_Franco == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//S�ysza�em, �e wys�a�e� Franka do piek�a. Dobra robota...
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//...ale teraz szarog�si si� tutaj Carlos. A z nim nie ma �art�w...
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//Carlosa te� wys�a�e� na cmentarz? Ch�opie, lepiej trzymaj si� ode mnie z daleka.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//S�ysza�em, �e ukatrupi�e� Estebana. Ch�opie, do czego ty zmierzasz, co?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//Nie, w tej chwili nic nowego.
	};
	
};





