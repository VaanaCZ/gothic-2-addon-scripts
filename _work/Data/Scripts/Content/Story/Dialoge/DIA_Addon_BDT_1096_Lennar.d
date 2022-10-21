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
	description = "Muszê iœæ...";
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
	description	= "Czo³em!";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Czo³em!
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Czo³em, jestem Lennar. Witaj w Obozie Kopacza.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Kopacza? Myœla³em, ¿e to obozowisko bandytów...
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//Jasne, ale bandyci te¿ zajmuj¹ siê tu kopaniem.
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
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //Wiesz, kto stoi za prób¹ zabójstwa?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //Oczywiœcie!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //To na pewno sprawka Emilia.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //Jak szalony biega³ do kopalni i ry³ tam niczym kret.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //Ale od czasu próby zabójstwa siedzi na ³awce i wcale siê z niej nie rusza.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //To jasne! Aby wejœæ do kopalni, musi mieæ czerwony kamieñ Estebana.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //Ale pewnie ju¿ nie œmie spojrzeæ mu prosto w oczy.

	B_LogEntry (Topic_Addon_Esteban, "Lennar podejrzewa Emilia, poniewa¿ ten unika Estebana.");
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
	description	= "Ale dlaczego Emilio ¿yczy³by œmierci Estebanowi?";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //Ale dlaczego Emilio ¿yczy³by œmierci Estebanowi?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //A sk¹d mam to wiedzieæ? Mo¿e ma kole¿kê, który chcia³by zaj¹æ miejsce Estebana?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //Tak, to mia³oby sens...
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
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Rzeczywiœcie masz dla mnie czerwony kamieñ.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Doskonale. Teraz rozkruszê ten przeklêty kamieñ – wiem, jak siê do tego zabraæ!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//I jeszcze jedno – jeœli bêdziesz kopaæ, pamiêtaj, ¿eby za mocno nie uderzaæ. Kilof mo¿e zaklinowaæ siê w z³ocie!
	
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
	description = "Nauczysz mnie wydobywaæ z³oto?";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //Nauczysz mnie wydobywaæ z³oto?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Jasne, ale wtedy bêdziesz go mieæ wiêcej.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //W³aœnie o to chodzi.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Dobra, ale powinieneœ oddaæ mi czêœæ z³ota, które wykopiesz.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //Có¿....
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Najlepiej od razu oddaj mi moj¹ czêœæ. Potrzebujê...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //Piêædziesi¹t sztuk z³ota.
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
	description = "Naucz mnie, jak wydobywaæ z³oto! (50 sztuk z³ota)";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Naucz mnie, jak wydobywaæ z³oto!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //No dobra. Trzeba uderzaæ spokojnie i jednostajnie. Nie spiesz siê – ale uwa¿aj, ¿eby nie zasn¹æ przy pracy.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //Nie wal ci¹gle w jedno miejsce – spróbuj wyci¹æ ³adny z³oty samorodek.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Postêpuj zgodnie z moimi wskazówkami, a zostaniesz prawdziwym mistrzem wœród kopaczy.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Najpierw chcê zobaczyæ moj¹ czêœæ.
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
	Description = "Wszystko w porz¹dku?"; 
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
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Wszystko w porz¹dku?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Ca³y czas jednym rytmem – dziêki temu bêdziesz mieæ same du¿e samorodki!
};


