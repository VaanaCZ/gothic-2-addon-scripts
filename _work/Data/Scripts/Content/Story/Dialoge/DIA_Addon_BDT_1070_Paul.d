//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_EXIT   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 999;
	condition   = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Paul_PICKPOCKET (C_INFO)
{
	npc			= BDT_1070_Addon_Paul;
	nr			= 900;
	condition	= DIA_Addon_Paul_PICKPOCKET_Condition;
	information	= DIA_Addon_Paul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Paul_PICKPOCKET_Condition()
{
	C_Beklauen (22, 19);
};
 
FUNC VOID DIA_Addon_Paul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
	
func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Hi   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 1;
	condition   = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent   = FALSE;
	description = "Prodáváš kováâské vybavení?";
};
FUNC INT DIA_Addon_Paul_Hi_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Paul_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Hi_15_00"); //Prodáváš i kováâské vybavení?
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_01"); //Ocel má Huno. Já tu mám jen pár kouskù rudy.
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_02"); //Ale já se jí nevzdám. Je to jediná cenná vêc, kterou mám.
};
//---------------------------------------------------------------------
//	Info Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Huno   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent   = FALSE;
	description	= "Pracuješ pro Huna?";
};
FUNC INT DIA_Addon_Paul_Huno_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Paul_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Huno_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Huno_15_00"); //Ty pracuješ pro Huna?
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_01"); //Chtêl jsem si vydêlat trochu zlata, a tak jsem se pâidal k Hunovi. Jenže od tý doby mi Esteban nedal ani floka.
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_02"); //Prej už mê nepotâebuje.
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_03"); //Co jinýho teda mùžu dêlat než dál otroèit pro Huna?
};

//---------------------------------------------------------------------
//	Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Attentat   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 3;
	condition   = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Paul_Attentat_03_00"); //Prostê nic! Nemoh jsem s tím vùbec nic dêlat! Co po mnê chceš?
};
	
//---------------------------------------------------------------------
//	HunoVerdacht
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoVerdacht   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 4;
	condition   = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent   = FALSE;
	description	= "Huno má prý prsty v tom útoku.";
};
FUNC INT DIA_Addon_Paul_HunoVerdacht_Condition()
{	
	if ( (Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoVerdacht_15_00"); //Huno prý má nêco spoleèného s tím útokem.
	AI_Output (self, other, "DIA_Addon_Paul_HunoVerdacht_03_01"); //O tom nic nevím!
};
	
//---------------------------------------------------------------------
//	Arbeitest für Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoArbeit (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent   = FALSE;
	description	= "Ale vždyã pro Huna pracuješ, tak musíš nêco vêdêt!";
};
FUNC INT DIA_Addon_Paul_HunoArbeit_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_Huno))
	&& (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoVerdacht))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoArbeit_15_00"); //Ale vždyã pracuješ pro Huna! Tak nêco musíš vêdêt!
	AI_Output (self, other, "DIA_Addon_Paul_HunoArbeit_03_01"); //(zoufale) Nevím nic – èestnê! A teë už musím jít!
	Npc_ExchangeRoutine(self, "AWAY");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	Angst vor Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_FearEsteban (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent   = FALSE;
	description	= "Víš, co udêlá Esteban, až zjistí, že Huna kryješ?";
};
FUNC INT DIA_Addon_Paul_FearEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoArbeit))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_FearEsteban_15_00"); //Víš, co ti Esteban udêlá, až zjistí, že kryješ Huna?
	AI_Output (self, other, "DIA_Addon_Paul_FearEsteban_03_01"); //Nech mê bejt, èéèe! S tou vêcí nemám nic spoleènýho!
	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	MaulPaul
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_MaulPaul (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent   = FALSE;
	description	= "Tak vyklop, co víš, a to hned!";
};
FUNC INT DIA_Addon_Paul_MaulPaul_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_FearEsteban))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_00"); //(pâátelsky) Jestli mi teë hned nevyklopíš, co víš, rozmáznu tê tady o tu zeë, Paule!
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_01"); //Nemùžeš mê zmlátit, páè pracuješ pro šéfa.
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_02"); //(mile) Ale mùžu.
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_03"); //Nech si ty kecy!
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_04"); //(netrpêlivê) Paule...
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_05"); //(horeènatê) Jediný, co vím, je, že Huno má s Estebanem àáký nevyâízený úèty.
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_06"); //(horeènatê) Furt mê s tím Estebanem otravuje. Že mu úplnê znièil živnost a tak dále.
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_07"); //Vždycky jsem to jenom poslouchal, ale nic jsem neâíkal.
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_08"); //Pâesnê tak! No vidíš, že to nebylo tak zlý.
	
	Npc_ExchangeRoutine(self, "START");
	
	Paul_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Paul se domnívá, že Huno Estebana nenávidí, protože mu kazí obchody.");
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1070_Paul_Mine   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_1070_Paul_Mine_03_00");//Koneènê! Tumáš, za tohle ti dám svou rudu.
	B_GiveInvItems (self, other, ItMi_Nugget,2);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//----------------------------------------------------------------------
//	PERM
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_PERM (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 99;
	condition   = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent   = TRUE;
	description = "Všecko ostatní je v pohodê?";
};
FUNC INT DIA_Addon_Paul_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,  DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Paul_PERM_15_00"); //Jinak jsi v pohodê?
	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output (self, other, "DIA_Addon_Paul_PERM_03_01"); //Jo, z tohohle kamene jsem vykutal hromadu zlata!
	}
	else 
	{
		if (Paul_TellAll == TRUE)
		&& (Huno_zuSnaf == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_02"); //Âeknu ti všecko, co vím!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_03"); //Jen si chci dêlat svou práci!
		};
	};
};




