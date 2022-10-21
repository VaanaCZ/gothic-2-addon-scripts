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
		AI_Output (self, other, "DIA_Addon_Edgor_EXIT_06_00"); //War schön, dich gekannt zu haben ...
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
	description = "Wie läuft's?";
};
FUNC INT DIA_Addon_Edgor_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Edgor_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Edgor_Hi_15_00"); //Wie läuft's?
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_01"); //Du willst wissen, wie es läuft? Ich sage dir, wie es läuft.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_02"); //Zuerst haben mich irgendwelche Piraten in stürmischer Nacht hergebracht. Mann, ich hab die ganze Nussschale vollgekotzt.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_03"); //Dann lässt Raven die Mine absperren, weil irgendwelche Idioten zu gierig auf das Gold sind.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_04"); //Und dann wird Franco Anführer der Jäger und bringt jeden um, der dagegen ist.
	AI_Output (self, other, "DIA_Addon_Edgor_Hi_06_05"); //Ich würde sagen, es läuft ziemlich mies.

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
	description = "Wie ist Franco zum Anführer geworden?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Franco_15_00"); //Wie ist Franco zum Anführer geworden?
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_01"); //Ganz einfach. Er hat Fletcher umgelegt. Der war vorher Anführer der Jäger.
	AI_Output (self, other, "DIA_Addon_Edgor_Franco_06_02"); //Fletcher war okay. Franco verarscht uns doch alle nur.
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
	description = "Franco schickt mich wegen dieser Steintafel..";
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
	AI_Output (other, self, "DIA_Addon_Edgor_MIS2_15_00"); //Franco schickt mich wegen dieser Steintafel. Hast du sie gefunden?
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_01"); //Mann, ich hab sie nicht mal gesucht. Alles was ich weiß ist, sie soll in diesem alten Gebäude tief im Sumpf liegen.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_02"); //Und meine innere Stimme sagt mir - Edgor, halte dich fern von alten Gebäuden, die tief im Sumpf liegen.
	AI_Output (self, other, "DIA_Addon_Edgor_MIS2_06_03"); //Ich werde meinen Arsch bestimmt nicht für diesen Penner Franco riskieren!
	
	B_LogEntry (Topic_Addon_Stoneplate,"Edgor wird niemals losziehen, um die Steintafel zu suchen. Er sagt, sie liegt irgendwo in einem alten Gebäude im Sumpf.");
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
	description = "Wo ist dieses alte Gebäude noch gleich?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Weg_15_00"); //Wo ist dieses alte Gebäude noch gleich?
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_01"); //Geh einfach links an dem großen Felsen hier vorbei. Nach einer Weile kommst du zu 'nem weiteren großen Felsen.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_02"); //Da musst du dann links oder rechts dran vorbei - ich weiß es nicht mehr, das ist schon zu lange her.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_03"); //Aber die Ruine soll auf einer Art Anhöhe liegen. Ziemlich versteckt zwischen Pflanzen.
	AI_Output (self, other, "DIA_Addon_Edgor_Weg_06_04"); //Vielleicht hast du Glück, und du findest sie nicht ...
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
	description = "Ich habe die Steintafel gefunden!";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Found_15_00");//(erfreut) Ich habe die Steintafel gefunden!
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_01");//(gelangweilt) Wirklich? Du bist ja ein mutiger Kerl.
	AI_Output (self, other, "DIA_Addon_Edgor_Found_06_02");//(gelangweilt) Damit hast du dir bestimmt deinen Eintritt in's Lager verdient. (gähnt)
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
	description = "Kannst du mir was beibringen?";
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
	AI_Output (other, self, "DIA_Addon_Edgor_Teach_15_00");//Kannst du mir was beibringen?
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_01");//Ich kenne mich mit Blutfliegen aus. Ich hasse diesen miesen Biester noch mehr als Franco!
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_02");//Aber ich weiß, wie ich ihren toten Körpern die Stacheln und Flügel entreißen kann. (irre) Ja, entreißen ...
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_03");//Außerdem weiß ich, wie man das Sekret aus dem Stachel entfernt.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_04");//Wenn du willst, kann ich dir den ganzen Kram beibringen.
	AI_Output (self, other, "DIA_Addon_Edgor_Teach_06_05");//Umsonst ist hier draußen allerdings nichts ...
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Edgor weiß 'ne Menge über Blutfliegen und ihre Trophäen.");	
	Edgor_Teach = TRUE;
};
FUNC VOID B_Edgor_NotEnoughGold()
{
	AI_Output (self, other, "DIA_Addon_Edgor_NotEnoughGold_06_00");//Besorg mir das Gold. Ich will nur Münzen, keine Brocken.
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
	description = "Wegen den Blutfliegen ...";
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
	AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_SEKRET_15_00");//Wegen der Blutfliegen ...
	AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_SEKRET_06_01");//Was willst du wissen?
	
	Info_ClearChoices (DIA_Addon_Edgor_TrainStart);
	Info_AddChoice    (DIA_Addon_Edgor_TrainStart,DIALOG_BACK,DIA_Addon_Edgor_TrainStart_BACK);
	
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice    (DIA_Addon_Edgor_TrainStart, "Blutfliegen Stachel ziehen. (Kosten: 1 LP, 100 Gold)",DIA_Addon_Edgor_TrainStart_Sting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart, "Blutfliegen Flügel reißen. (Kosten: 1 LP, 100 Gold)",DIA_Addon_Edgor_TrainStart_Wing);
	};
	if (Knows_Bloodfly == FALSE)
	{
		Info_AddChoice 	  (DIA_Addon_Edgor_TrainStart,"Sekret aus dem Stachel entnehmen (Kosten: 1 LP, 100 Gold)",DIA_Addon_Edgor_TrainStart_GIFT);
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Sting_15_00");//Wie komme ich an den Stachel der Blutfliegen?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_01");//Dreh die toten Viecher auf den Bauch und schneide sie quer auf. Greif in die Innereien und durchtrenne das komplette Gewebe am Hinterteil.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Sting_06_02");//Dann kannst du den Stachel mit einem Ruck entfernen.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_Wing_15_00");//Wie kann ich mir die Flügel nehmen?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_Wing_06_01");//Greif dir die Flügel mit einer Hand. Mit der anderen schneidest du sie mit der obersten Hautschicht einfach raus.
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
			AI_Output (other, self, "DIA_Addon_Edgor_TrainStart_GIFT_15_00");//Wie kann ich das Sekret der Blutfliegen entnehmen?
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_01");//Schneide die oberste Schicht des Stachels längs auf - dann läuft das heilende Sekret schon raus.
			AI_Output (self, other, "DIA_Addon_Edgor_TrainStart_GIFT_06_02");//So ist es völlig ungefährlich, einen Stachel auszulutschen - oder ihn für irgendwelche Tränke zu verwenden.
			
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


