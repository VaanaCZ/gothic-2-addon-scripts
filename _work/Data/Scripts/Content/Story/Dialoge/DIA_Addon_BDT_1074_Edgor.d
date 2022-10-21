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
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //Mi³o mi ciê poznaæ...
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
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Chcesz wiedzieæ, jak leci? Ju¿ ja ci powiem, jak leci!
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Pewnej sztormowej nocy przywieŸli mnie tu piraci. Zarzyga³em im ca³y statek.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //No a potem Kruk odci¹³ kopalniê, bo jacyœ durnie stali siê zbyt chciwi.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //Franko zosta³ przywódc¹ myœliwych i zabije ka¿dego, kto mu siê przeciwstawi.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Czyli mówi¹c ogólnie, leci doœæ marnie.

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
	description = "W jaki sposób Franko zosta³ przywódc¹ tej bandy?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //W jaki sposób Franko zosta³ przywódc¹ tej bandy?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Ca³kiem prosto: zabi³ Fletchera - poprzedniego przywódcê.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher by³ w porz¹dku. Franko jednak oszukuje nas, jak tylko mo¿e.
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
	description = "Franko pyta³ mnie o tê kamienn¹ tabliczkê. Uda³o ci siê j¹ znaleŸæ?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franko pyta³ mnie o tê kamienn¹ tabliczkê. Uda³o ci siê j¹ znaleŸæ?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Ch³opie, nawet jej nie szuka³em. Wiem tylko, ¿e podobno jest w starym budynku na bagnach.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //A mój wewnêtrzny g³os wci¹¿ mi powtarza: Edgor, trzymaj siê z daleka od starych budynków stoj¹cych gdzieœ poœrodku bagna.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Nie bêdê nadstawia³ karku dla tego aroganckiego durnia - Franka!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor nie pójdzie szukaæ kamiennej tablicy. Wspomnia³, ¿e znajduje siê ona gdzieœ w starym budynku na bagnach.");
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
	description = "Mo¿esz powtórzyæ, gdzie jest ten stary budynek?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Mo¿esz powtórzyæ, gdzie jest ten stary budynek?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Widzisz tê wielk¹ ska³ê? IdŸ œcie¿k¹, która znajduje siê na lewo od niej. Kawa³ek dalej bêdzie nastêpna wielka ska³a.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Tam pójdziesz œcie¿k¹ w lewo... Albo w prawo. Ch³opie, nie pamiêtam, to by³o dawno temu.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Ruina stoi na niewielkim wzgórzu, ukryta wœród roœlin.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Mo¿e bêdziesz mia³ szczêœcie i jej nie znajdziesz...
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
	description = "Znalaz³em kamienn¹ tabliczkê!";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//Znalaz³em kamienn¹ tabliczkê!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//Naprawdê? Ale z ciebie zuch.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//Mo¿e dziêki temu pozwol¹ ci wejœæ do obozu.
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
	description = "Potrafisz mnie czegoœ nauczyæ?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Potrafisz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Wiem co nieco o krwiopijcach. Nienawidzê tych bydlaków chyba nawet bardziej ni¿ Franka!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Wiem, jak oderwaæ z ich trupów skrzyd³a i ¿¹d³a. Taaak, oderwaæ...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Nie licz¹c tego, ¿e wiem, jak uzyskaæ wydzielinê z ¿¹d³a.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Jeœli chcesz, mogê ciê tego wszystkiego nauczyæ.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Oczywiœcie nie za darmo....
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor wie du¿o na temat krwiopijców i ich oporz¹dzania.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Za³atw trochê z³ota. Przyjmujê tylko monety, ¿adnych kawa³ków ani okruchów.
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
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Co chcesz wiedzieæ?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Wyci¹gnij ¿¹d³o krwiopijcy. (Koszt: 1 PN, 100 szt. z³ota)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Oderwij skrzyd³a krwiopijcy. (Koszt: 1 PN, 100 szt. z³ota)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Wydob¹dŸ wydzielinê z krwiopijcy. (Koszt: 1 PN, 100 szt. z³ota)",DIA_Addon_Edgor_TrainStart_GIFT);
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Jak wydobyæ ¿¹d³o krwiopijcy?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Trzeba przewróciæ truch³o i je rozp³ataæ. A potem przebiæ siê przez wnêtrznoœci w okolicy ogona.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Wtedy ³atwo bêdzie wyrwaæ ¿¹d³o.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Jaki jest najlepszy sposób, ¿eby usun¹æ skrzyd³a?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//To doœæ proste. Z³ap jedn¹ rêk¹ za skrzyd³o, a drug¹ przetnij wierzchni¹ warstwê skóry.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Jak uzyskaæ wydzielinê krwiopijcy?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Trzeba rozci¹æ zewnêtrzn¹ warstwê ¿¹d³a. Wtedy powinieneœ zobaczyæ, jak œcieka uzdrawiaj¹ca wydzielina.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//Mo¿na wypiæ ten p³yn albo wykorzystaæ go do sporz¹dzenia mikstury.
			
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


