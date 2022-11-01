//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_EXIT   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 999;
	condition   = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent   = TRUE;
	description = "Muszę iść...";
};
FUNC INT DIA_Addon_Lennar_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_EXIT_Info()
{		
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lennar_PICKPOCKET (C_INFO)
{
	npc			= BDT_1096_Addon_Lennar;
	nr			= 900;
	condition	= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information	= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen (65, 100);
};
 
FUNC VOID DIA_Addon_Lennar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
	
func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hi   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 1;
	condition   = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent   = FALSE;
	description	= "Czołem!";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Czołem!
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Czołem, jestem Lennar. Witaj w Obozie Kopacza.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Kopacza? Myślałem, że to obozowisko bandytów...
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//Jasne, ale bandyci też zajmują się tu kopaniem.
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Attentat   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 2;
	condition   = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent   = FALSE;
	description	= "A co do próby zabójstwa Estebana...";
};
FUNC INT DIA_Addon_Lennar_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //Tak?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //Wiesz, kto stoi za próbą zabójstwa?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //Oczywiście!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //To na pewno sprawka Emilia.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //Jak szalony biegał do kopalni i rył tam niczym kret.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //Ale od czasu próby zabójstwa siedzi na ławce i wcale się z niej nie rusza.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //To jasne! Aby wejść do kopalni, musi mieć czerwony kamień Estebana.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //Ale pewnie już nie śmie spojrzeć mu prosto w oczy.

	B_LogEntry (Topic_Addon_Esteban, "Lennar podejrzewa Emilia, ponieważ ten unika Estebana.");
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Inspektor (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 3;
	condition   = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent   = FALSE;
	description	= "Ale dlaczego Emilio życzyłby śmierci Estebanowi?";
};
FUNC INT DIA_Addon_Lennar_Inspektor_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //Ale dlaczego Emilio życzyłby śmierci Estebanowi?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //A skąd mam to wiedzieć? Może ma koleżkę, który chciałby zająć miejsce Estebana?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //Tak, to miałoby sens...
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Mine   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 4;
	condition   = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Lennar_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Rzeczywiście masz dla mnie czerwony kamień.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Doskonale. Teraz rozkruszę ten przeklęty kamień – wiem, jak się do tego zabrać!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//I jeszcze jedno – jeśli będziesz kopać, pamiętaj, żeby za mocno nie uderzać. Kilof może zaklinować się w złocie!
	
	B_Upgrade_Hero_HackChance(10);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Gold   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 5;
	condition   = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent   = FALSE;
	description = "Nauczysz mnie wydobywać złoto?";
};
FUNC INT DIA_Addon_Lennar_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lennar_Hi)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //Nauczysz mnie wydobywać złoto?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Jasne, ale wtedy będziesz go mieć więcej.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //Właśnie o to chodzi.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Dobra, ale powinieneś oddać mi część złota, które wykopiesz.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //Cóż....
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Najlepiej od razu oddaj mi moją część. Potrzebuję...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //Pięćdziesiąt sztuk złota.
};

//---------------------------------------------------------------------
//	Train
//---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
INSTANCE DIA_Addon_Lennar_Train   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 6;
	condition   = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent   = TRUE;
	description = "Naucz mnie, jak wydobywać złoto! (50 sztuk złota)";
};
FUNC INT DIA_Addon_Lennar_Train_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Train_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Naucz mnie, jak wydobywać złoto!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //No dobra. Trzeba uderzać spokojnie i jednostajnie. Nie spiesz się – ale uważaj, żeby nie zasnąć przy pracy.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //Nie wal ciągle w jedno miejsce – spróbuj wyciąć ładny złoty samorodek.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Postępuj zgodnie z moimi wskazówkami, a zostaniesz prawdziwym mistrzem wśród kopaczy.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Najpierw chcę zobaczyć moją część.
	};
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hacker   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 9;
	condition   = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent   = TRUE;
	Description = "Wszystko w porządku?"; 
};
FUNC INT DIA_Addon_Lennar_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Wszystko w porządku?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Cały czas jednym rytmem – dzięki temu będziesz mieć same duże samorodki!
};


