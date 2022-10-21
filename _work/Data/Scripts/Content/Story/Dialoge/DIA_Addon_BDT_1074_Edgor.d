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
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Mi�o mi ci� pozna�...
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
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Chcesz wiedzie�, jak leci? Ju� ja ci powiem, jak leci!
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Pewnej sztormowej nocy przywie�li mnie tu piraci. Zarzyga�em im ca�y statek.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //No a potem Kruk odci�� kopalni�, bo jacy� durnie stali si� zbyt chciwi.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //Franko zosta� przyw�dc� my�liwych i zabije ka�dego, kto mu si� przeciwstawi.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Czyli m�wi�c og�lnie, leci do�� marnie.

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
	description = "W jaki spos�b Franko zosta� przyw�dc� tej bandy?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //W jaki spos�b Franko zosta� przyw�dc� tej bandy?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Ca�kiem prosto: zabi� Fletchera - poprzedniego przyw�dc�.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher by� w porz�dku. Franko jednak oszukuje nas, jak tylko mo�e.
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
	description = "Franko pyta� mnie o t� kamienn� tabliczk�. Uda�o ci si� j� znale��?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franko pyta� mnie o t� kamienn� tabliczk�. Uda�o ci si� j� znale��?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Ch�opie, nawet jej nie szuka�em. Wiem tylko, �e podobno jest w starym budynku na bagnach.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //A m�j wewn�trzny g�os wci�� mi powtarza: Edgor, trzymaj si� z daleka od starych budynk�w stoj�cych gdzie� po�rodku bagna.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Nie b�d� nadstawia� karku dla tego aroganckiego durnia - Franka!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor nie p�jdzie szuka� kamiennej tablicy. Wspomnia�, �e znajduje si� ona gdzie� w starym budynku na bagnach.");
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
	description = "Mo�esz powt�rzy�, gdzie jest ten stary budynek?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Mo�esz powt�rzy�, gdzie jest ten stary budynek?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Widzisz t� wielk� ska��? Id� �cie�k�, kt�ra znajduje si� na lewo od niej. Kawa�ek dalej b�dzie nast�pna wielka ska�a.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Tam p�jdziesz �cie�k� w lewo... Albo w prawo. Ch�opie, nie pami�tam, to by�o dawno temu.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Ruina stoi na niewielkim wzg�rzu, ukryta w�r�d ro�lin.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Mo�e b�dziesz mia� szcz�cie i jej nie znajdziesz...
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
	description = "Znalaz�em kamienn� tabliczk�!";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//Znalaz�em kamienn� tabliczk�!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//Naprawd�? Ale z ciebie zuch.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//Mo�e dzi�ki temu pozwol� ci wej�� do obozu.
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
	description = "Potrafisz mnie czego� nauczy�?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Potrafisz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Wiem co nieco o krwiopijcach. Nienawidz� tych bydlak�w chyba nawet bardziej ni� Franka!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Wiem, jak oderwa� z ich trup�w skrzyd�a i ��d�a. Taaak, oderwa�...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Nie licz�c tego, �e wiem, jak uzyska� wydzielin� z ��d�a.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Je�li chcesz, mog� ci� tego wszystkiego nauczy�.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Oczywi�cie nie za darmo....
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor wie du�o na temat krwiopijc�w i ich oporz�dzania.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Za�atw troch� z�ota. Przyjmuj� tylko monety, �adnych kawa�k�w ani okruch�w.
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
	description = "A co do krwiopijc�w...";
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
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//A co do krwiopijc�w...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Co chcesz wiedzie�?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Wyci�gnij ��d�o krwiopijcy. (Koszt: 1 PN, 100 szt. z�ota)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Oderwij skrzyd�a krwiopijcy. (Koszt: 1 PN, 100 szt. z�ota)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Wydob�d� wydzielin� z krwiopijcy. (Koszt: 1 PN, 100 szt. z�ota)",DIA_Addon_Edgor_TrainStart_GIFT);
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Jak wydoby� ��d�o krwiopijcy?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Trzeba przewr�ci� truch�o i je rozp�ata�. A potem przebi� si� przez wn�trzno�ci w okolicy ogona.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Wtedy �atwo b�dzie wyrwa� ��d�o.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Jaki jest najlepszy spos�b, �eby usun�� skrzyd�a?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//To do�� proste. Z�ap jedn� r�k� za skrzyd�o, a drug� przetnij wierzchni� warstw� sk�ry.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Jak uzyska� wydzielin� krwiopijcy?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Trzeba rozci�� zewn�trzn� warstw� ��d�a. Wtedy powiniene� zobaczy�, jak �cieka uzdrawiaj�ca wydzielina.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Mo�na wypi� ten p�yn albo wykorzysta� go do sporz�dzenia mikstury.
			
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


