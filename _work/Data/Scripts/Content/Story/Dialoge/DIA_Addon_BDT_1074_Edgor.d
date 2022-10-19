var int Edgor_Exiteinmal;

INSTANCE DIA_Addon_Edgor_EXIT   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 999;
	condition   = DIA_Addon_Edgor_EXIT_Condition;
	information = DIA_Addon_Edgor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_MIS2)
	&& (Edgor_Exiteinmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Rád jsem tê poznal.
		Edgor_Exiteinmal = TRUE;
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Edgor_PICKPOCKET (C_INFO)
{
	npc			= BDT_1074_Addon_Edgor;
	nr			= 900;
	condition	= DIA_Addon_Edgor_PICKPOCKET_Condition;
	information	= DIA_Addon_Edgor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Edgor_PICKPOCKET_Condition()
{
	C_Beklauen (10, 7);
};
 
FUNC VOID DIA_Addon_Edgor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Edgor_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Edgor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Edgor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Edgor_PICKPOCKET_DoIt);
};

func void DIA_Addon_Edgor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	B_Say (self, self, "$AWAKE");
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
	
func void DIA_Addon_Edgor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Hi   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Hi_Condition;
	information = DIA_Addon_Edgor_Hi_Info;
	permanent   = FALSE;
	description = "Jak se vede?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Jak to jde?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Chceš vêdêt, jak to jde? Tak já ti to teda povím.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Napâed mê sem jedný bouâlivý noci pâivlekli piráti. Èoveèe, blil jsem jak Alík, to teda jo!
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Pak Havran zavâel dùl, protože àácí magoâi byli moc zlatachtiví.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //A pak se stal velitelem lovcù Franco - zabil každýho, kdo byl proti nêmu.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Âek bych, že pêknê blbê.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//---------------------------------------------------------------------
//	Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Franco (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 2;
	condition   = DIA_Addon_Edgor_Franco_Condition;
	information = DIA_Addon_Edgor_Franco_Info;
	permanent   = FALSE;
	description = "Jak se Franco stal velitelem?";
};
FUNC INT DIA_Addon_Edgor_Franco_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Franco_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //Jak se stal Franco velitelem?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Jednoduše – prostê zabil svýho pâedchùdce Fletchera.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher byl fajn, ale Franco si na nás furt vymejšlí pitomosti.
};	

//---------------------------------------------------------------------
//	Info MIS2
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_MIS2   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_MIS2_Condition;
	information = DIA_Addon_Edgor_MIS2_Info;
	permanent   = FALSE;
	description = "Franco mê poslal pro nêjakou kamennou tabulku.";
};
FUNC INT DIA_Addon_Edgor_MIS2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_MIS2_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franco mê sem poslal pro kamennou tabulku, našel jsi ji?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Èéèe, po tý jsem se ani nekoukal. Vím akorát, že má bejt v àáký starý budovê hluboko v bažinách.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //A vnitâní hlas mi âíká 'Edgore, drž se vod têch starejch budov v bažinách co nejdál'.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Rozhodnê nebudu riskovat krk pro takovou pijavici, jako je Franco.
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor se k té kamenné tabulce nikdy nedostal, ale podle nêj se nachází kdesi ve staré budovê v bažinê.");
};
//---------------------------------------------------------------------
//	Info Wegbeschreibung
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Weg   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Weg_Condition;
	information = DIA_Addon_Edgor_Weg_Info;
	permanent   = FALSE;
	description = "Kde pâesnê ta stará budova je?";
};
FUNC INT DIA_Addon_Edgor_Weg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Edgor_MIS2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Weg_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Kde pâesnê má ta stará budova být?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Bêž doleva pâes tady ten velkej kámen a za chvíli narazíš na další šutrák.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Za ním zaboè doleva. Víc nevím, už je to dêsnê dlouho.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Ale ty rozvaliny by mêly bejt nêkde vejš, akorát je to všecko zarostlý, takže to není vidêt.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Snad budeš mít štêstí a najdeš to.
};
//---------------------------------------------------------------------
//	Info Found
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Found   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 4;
	condition   = DIA_Addon_Edgor_Found_Condition;
	information = DIA_Addon_Edgor_Found_Info;
	permanent   = FALSE;
	description = "Našel jsem tu kamennou tabulku!";
};
FUNC INT DIA_Addon_Edgor_Found_Condition()
{	
	if (Npc_HasItems (other,ItMi_Addon_Stone_04) >= 1)
	&& !Npc_IsDead (Franco)
	&& (MIS_HlpEdgor == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Found_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//Našel jsem tu kamennou tabulku!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(znudênê) Vážnê? To seš teda fakt stateènej.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(znudênê) Tak to sis urèitê zasloužil cestu do tábora. (zívá)
};
//---------------------------------------------------------------------
//	Info Teach
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_Teach   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Teach_Condition;
	information = DIA_Addon_Edgor_Teach_Info;
	permanent   = FALSE;
	description = "Mùžeš mê nêèemu nauèit?";
};
FUNC INT DIA_Addon_Edgor_Teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Edgor_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Mùžeš mê nêco nauèit?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//O krvavejch mouchách vím fakt dost. Tu mizernou havêã snad nesnáším ještê víc než Franca!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Ale vím, jak z jejich têl vyndávat žihadla a kâídla. (šílenê) Jo, poâádnê je roztrhat!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Krom toho dokážu získat i výmêšek z jejich žihadel.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Jestli chceš, mùžu tê tyhle fígle nauèit.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Ale ani kuâe zadarmo nehrabe, to je ti doufám jasný.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor ví spoustu vêcí o krvavých mouchách a o tom, jak z nich získávat trofeje.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Napâed vysol zlato. A tím myslím poctivý mince, o nuggety nestojím.
};
//---------------------------------------------------------------------
//	Info Train (Bloodflys)
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Edgor_TrainStart   (C_INFO)
{
	npc         = BDT_1074_Addon_Edgor;
	nr          = 9;
	condition   = DIA_Addon_Edgor_Start_Condition;
	information = DIA_Addon_Edgor_Start_Info;
	permanent   = TRUE;
	description = "K têm krvavým mouchám...";
};
FUNC INT DIA_Addon_Edgor_Start_Condition()
{	
	if (Edgor_Teach == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Edgor_Start_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//K têm krvavým mouchám...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Co chceš vêdêt?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Vyjmutí žihadel krvavých much (Cena: 5 VB, 100 zlatých)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Vyjmutí kâídel krvavých much (Cena: 5 VB, 100 zlatých)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Získání jedu ze žihadla (Cena: 1 VB, 100 zlatých)",DIA_Addon_Edgor_TrainStart_GIFT);
	};
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_BACK()
{
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Sting()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFSting)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Jak vyjmu krvavým mouchám žihadla?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Obrátíš tu mrtvou mrchu na bâicho a kâížovým âezem ji otevâeš. Chytneš vnitânosti a proâízneš celou tkáà na zádech.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Pak staèí jen škubnout a žihadlo je venku.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};
FUNC VOID DIA_Addon_Edgor_TrainStart_Wing()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_BFWing)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Jak získám kâídla?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Jednou rukou popadni kâídla a druhou je odâízni podél svrchní vrstvy kùže.
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};	
FUNC VOID DIA_Addon_Edgor_TrainStart_GIFT()
{
	if B_GiveInvItems (other, self, ItmI_Gold, 100)
	{
		if (other.lp >= 1)
		{
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Jak získám výmêšek z žihadel krvavých much?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Shora žihadlo po délce naâízni a léèivý výmêšek hned vyteèe.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Tak mùžeš ze žihadla bezpeènê všecko vyslopnout – nebo to pâidat do nêjakýho lektvaru.
			
			other.lp = (other.lp - 1);
			Knows_Bloodfly = TRUE; 
			PrintScreen (PRINT_ADDON_KNOWSBF, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
		};
	}
	else
	{
		B_Edgor_NotEnoughGold();
	};
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
};		


