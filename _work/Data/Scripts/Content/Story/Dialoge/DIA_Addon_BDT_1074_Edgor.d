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
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Miło mi cię poznać...
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
	description = "Jak leci?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Jak leci?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Chcesz wiedzieć, jak leci? Już ja ci powiem, jak leci!
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Pewnej sztormowej nocy przywieźli mnie tu piraci. Zarzygałem im cały statek.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //No a potem Kruk odciął kopalnię, bo jacyś durnie stali się zbyt chciwi.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //Franko został przywódcą myśliwych i zabije każdego, kto mu się przeciwstawi.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Czyli mówiąc ogólnie, leci dość marnie.

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
	description = "W jaki sposób Franko został przywódcą tej bandy?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //W jaki sposób Franko został przywódcą tej bandy?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Całkiem prosto: zabił Fletchera - poprzedniego przywódcę.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher był w porządku. Franko jednak oszukuje nas, jak tylko może.
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
	description = "Franko pytał mnie o tę kamienną tabliczkę. Udało ci się ją znaleźć?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franko pytał mnie o tę kamienną tabliczkę. Udało ci się ją znaleźć?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Chłopie, nawet jej nie szukałem. Wiem tylko, że podobno jest w starym budynku na bagnach.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //A mój wewnętrzny głos wciąż mi powtarza: Edgor, trzymaj się z daleka od starych budynków stojących gdzieś pośrodku bagna.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Nie będę nadstawiał karku dla tego aroganckiego durnia - Franka!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor nie pójdzie szukać kamiennej tablicy. Wspomniał, że znajduje się ona gdzieś w starym budynku na bagnach.");
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
	description = "Możesz powtórzyć, gdzie jest ten stary budynek?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Możesz powtórzyć, gdzie jest ten stary budynek?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Widzisz tę wielką skałę? Idź ścieżką, która znajduje się na lewo od niej. Kawałek dalej będzie następna wielka skała.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Tam pójdziesz ścieżką w lewo... Albo w prawo. Chłopie, nie pamiętam, to było dawno temu.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Ruina stoi na niewielkim wzgórzu, ukryta wśród roślin.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Może będziesz miał szczęście i jej nie znajdziesz...
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
	description = "Znalazłem kamienną tabliczkę!";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//Znalazłem kamienną tabliczkę!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//Naprawdę? Ale z ciebie zuch.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//Może dzięki temu pozwolą ci wejść do obozu.
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
	description = "Potrafisz mnie czegoś nauczyć?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Potrafisz mnie czegoś nauczyć?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Wiem co nieco o krwiopijcach. Nienawidzę tych bydlaków chyba nawet bardziej niż Franka!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Wiem, jak oderwać z ich trupów skrzydła i żądła. Taaak, oderwać...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Nie licząc tego, że wiem, jak uzyskać wydzielinę z żądła.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Jeśli chcesz, mogę cię tego wszystkiego nauczyć.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Oczywiście nie za darmo....
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor wie dużo na temat krwiopijców i ich oporządzania.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Załatw trochę złota. Przyjmuję tylko monety, żadnych kawałków ani okruchów.
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
	description = "A co do krwiopijców...";
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
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//A co do krwiopijców...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Co chcesz wiedzieć?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Wyciągnij żądło krwiopijcy. (Koszt: 1 PN, 100 szt. złota)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Oderwij skrzydła krwiopijcy. (Koszt: 1 PN, 100 szt. złota)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Wydobądź wydzielinę z krwiopijcy. (Koszt: 1 PN, 100 szt. złota)",DIA_Addon_Edgor_TrainStart_GIFT);
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Jak wydobyć żądło krwiopijcy?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Trzeba przewrócić truchło i je rozpłatać. A potem przebić się przez wnętrzności w okolicy ogona.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Wtedy łatwo będzie wyrwać żądło.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Jaki jest najlepszy sposób, żeby usunąć skrzydła?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//To dość proste. Złap jedną ręką za skrzydło, a drugą przetnij wierzchnią warstwę skóry.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Jak uzyskać wydzielinę krwiopijcy?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Trzeba rozciąć zewnętrzną warstwę żądła. Wtedy powinieneś zobaczyć, jak ścieka uzdrawiająca wydzielina.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Można wypić ten płyn albo wykorzystać go do sporządzenia mikstury.
			
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


