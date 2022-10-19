///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fellan_EXIT   (C_INFO)
{
	npc         = VLK_480_Fellan;
	nr          = 999;
	condition   = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fellan_PICKPOCKET (C_INFO)
{
	npc			= VLK_480_Fellan;
	nr			= 900;
	condition	= DIA_Fellan_PICKPOCKET_Condition;
	information	= DIA_Fellan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fellan_PICKPOCKET_Condition()
{
	C_Beklauen (40, 40);
};
 
FUNC VOID DIA_Fellan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fellan_PICKPOCKET);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_BACK 		,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fellan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
	
func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fellan_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Tough Guy News 
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_News		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  1;
	condition	 = 	DIA_Fellan_News_Condition;
	information	 = 	DIA_Fellan_News_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Fellan_News_Condition ()
{	
	if  Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_News_Info ()
{
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_00"); //No dobrze, pokona³eœ mnie. Brawo, bohaterze.
	
		 if (MIS_AttackFellan == LOG_RUNNING)
		 && (FellanGeschlagen == FALSE)
		 {
		 	AI_Output (other, self, "DIA_Fellan_News_15_01"); //Przestaniesz waliæ tym m³otkiem, czy mam ci jeszcze raz spuœciæ lanie?
		 	AI_Output (self, other, "DIA_Fellan_News_06_02"); //Nie, proszê, nie bij mnie. Ale jeœli cokolwiek siê zawali, to bêdzie to twoja wina!
		 	
		 	FellanGeschlagen = TRUE;
		 	Npc_ExchangeRoutine (self,"OHNEHAMMER");
		 	AI_StopProcessInfos (self);
		 	
		 };
	}; 
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output (self, other, "DIA_Fellan_News_06_03");  //Co z tob¹! Chcesz znowu oberwaæ?
	};
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		 AI_Output (self, other, "DIA_Fellan_News_06_04"); //O co ci w³aœciwie chodzi? Chcesz siê biæ? Chcesz rozmawiaæ? Mo¿e chcesz siê wreszcie na coœ zdecydowaæ?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_HALLO		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  2;
	condition	 = 	DIA_Fellan_HALLO_Condition;
	information	 = 	DIA_Fellan_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Co tam przybijasz?";
};
func int DIA_Fellan_HALLO_Condition ()
{	
	if (FellanGeschlagen == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Fellan_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Fellan_HALLO_15_00"); //Co tam przybijasz?
	AI_Output (self, other, "DIA_Fellan_HALLO_06_01"); //Od wielu dni próbujê naprawiaæ uszkodzenia dachu.
	AI_Output (self, other, "DIA_Fellan_HALLO_06_02"); //Krokwie dos³ownie rozpadaj¹ siê po ostatnich deszczach. Wkrótce to wszystko zawali mi siê na g³owê!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_Stop		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr 			 =  3;
	condition	 = 	DIA_Fellan_Stop_Condition;
	information	 = 	DIA_Fellan_Stop_Info;
	permanent	 =  FALSE;
	description	 = 	"Mo¿esz na moment przestaæ przybijaæ?";
};

func int DIA_Fellan_Stop_Condition ()
{
	if (MIS_AttackFellan == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fellan_Stop_Info ()
{
	AI_Output (other, self, "DIA_Fellan_Stop_15_00"); //Mo¿esz na moment przestaæ przybijaæ?
	AI_Output (self, other, "DIA_Fellan_Stop_06_01"); //Nie, muszê, MUSZÊ to skoñczyæ.
	
	Info_ClearChoices (DIA_Fellan_Stop);
	Info_AddChoice (DIA_Fellan_Stop,"Przestañ przybijaæ albo po³amiê ci wszystkie koœci.",DIA_Fellan_Stop_Bones);
	Info_AddChoice (DIA_Fellan_Stop,"Dam ci 10 sztuk z³ota, jeœli choæ na chwilê przestaniesz waliæ tym m³otkiem.",DIA_Fellan_Stop_Gold);
	Info_AddChoice (DIA_Fellan_Stop,"Po prostu przestañ t³uc tym m³otkiem, zrozumiano?",DIA_Fellan_Stop_Just);
};
FUNC VOID DIA_Fellan_Stop_Bones()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Bones_15_00"); //Przestañ przybijaæ albo po³amiê ci wszystkie koœci.
	AI_Output (self, other, "DIA_Fellan_Stop_Bones_06_01"); //Zapomnij o tym. Chyba ¿e twoja g³owa równie¿ potrzebuje niewielkiej naprawy moim m³otkiem.
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Fellan_Stop_Gold()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Gold_15_00"); //Dam ci 10 sztuk z³ota, jeœli choæ na chwilê przestaniesz waliæ tym m³otkiem.
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_01"); //O, ho... To bardzo hojnie z twojej strony. Ale jeœli chodzi o twoje z³oto, to mo¿esz je sobie...
	AI_Output (self, other, "DIA_Fellan_Stop_Gold_06_02"); //...no, wiesz, co mo¿esz z nim zrobiæ.
};
FUNC VOID DIA_Fellan_Stop_Just()
{
	AI_Output (other, self, "DIA_Fellan_Stop_Just_15_00"); //Po prostu przestañ t³uc tym m³otkiem, zrozumiano?
	AI_Output (self, other, "DIA_Fellan_Stop_Just_06_01"); //Po prostu przestañ mnie wkurzaæ, zrozumiano?
};
///////////////////////////////////////////////////////////////////////
//	Info Alles klar?
///////////////////////////////////////////////////////////////////////
instance DIA_Fellan_klar		(C_INFO)
{
	npc			 = 	VLK_480_Fellan;
	nr			 =  5;
	condition	 = 	DIA_Fellan_klar_Condition;
	information	 = 	DIA_Fellan_klar_Info;
	permanent	 =  TRUE;
	description	 = 	"Hej - wszystko w porz¹dku?";
};
func int DIA_Fellan_klar_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Fellan_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Fellan_klar_Info ()
{
	AI_Output (other, self, "DIA_Fellan_klar_15_00"); //Hej - wszystko w porz¹dku?
	
	if (FellanGeschlagen == FALSE) 
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_01"); //Taaa, muszê to tylko zreperowaæ na czas.
	}
	else
	{
		AI_Output (self, other, "DIA_Fellan_klar_06_02"); //Stan dachu ci¹gle siê pogarsza. Jak tak dalej pójdzie, to nastêpnym razem bêdê brodzi³ w wodzie po kolana. I to wszystko przez ciebie!
	};
	AI_StopProcessInfos (self);
};
//Kapitel 2 Miliz Kandidat 





