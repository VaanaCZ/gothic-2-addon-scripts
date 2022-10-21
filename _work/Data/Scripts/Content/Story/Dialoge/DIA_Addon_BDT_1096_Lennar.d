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
	description = "Ich muss weiter ...";
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
	description	= "Hi.";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Hi.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Hi, ich bin Lennar. Willkommen im Lager der Buddler.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Buddler? Ich dachte, das w�r das Lager der Banditen ...
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//Richtig, aber die Banditen sind auch nur hier um zu buddeln. (Schulterzucken) Also ...
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
	description	= "Wegen des Attentats auf Esteban...";
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
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(naiv) Ja?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //Hast du 'ne Ahnung, wer dahinter steckt?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(begeistert) Klar!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(hektisch) Ich werd's dir sagen: Bestimmt steckt dieser Emilio dahinter!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(hektisch) Er ist immer wie ein Bescheuerter in die Mine gerannt. Er hat gesch�rft, was das Zeug h�lt.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(schlau) Aber seit das Attentat passiert ist, sitzt er auf seiner Bank und r�hrt sich nicht mehr weg.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(erkennt) Ist ja klar! Um in die Mine zu kommen, muss er sich von Esteban 'nen roten Stein abholen.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //(verschw�rerisch) Ich wette, er traut sich nicht mehr, ihm in die Augen zu sehen.

	B_LogEntry (Topic_Addon_Esteban, "Lennar verd�chtigt Emilio, weil der nicht mehr zu Esteban geht.");
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
	description	= "Was k�nnte Emilio von Estebans Tod haben?";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //Was k�nnte Emilio von Estebans Tod haben?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //Was wei� ich? Vielleicht hat er 'nen Kumpel in der Mine, der dann Estebans Platz einnehmen w�rde.
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(zu sich) Ja, das w�rde Sinn machen ...
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
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Du hast ja tats�chlich einen roten Stein f�r mich.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Ausgezeichnet. Jetzt werde ich diesen verdammten Fels zu Kr�meln verarbeiten - ich wei� auch schon genau, wo ich hingehe!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//Noch eine Sache - wenn du sch�rfen gehst, pass auf, dass du nicht zu FESTE draufhaust. Sonst verkeilt sich deine Spitzhacke im Gold!
	
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
	description = "Kannst du mir was �ber's Goldsch�rfen beibringen?";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //Kannst du mir was �ber das Goldsch�rfen beibringen?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Klar, aber wenn ich dir was beibringe, wirst du mehr Gold sch�rfen k�nnen.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //Darum frag ich ja.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Sicher. Aber wenn du mehr sch�rfen kannst, ist es doch nur fair, wenn ich einen Teil davon abbekomme.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //Nun ...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Am Besten, du gibst mir meinen Anteil im Voraus. Sagen wir ...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //F�nfzig Goldst�cke.
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
	description = "Bring mir was �ber's Goldhacken bei! (50 Gold)";
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
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Bring mir was �ber's Goldhacken bei!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Gut. Gleichm��iges Hacken bringt dich vorw�rts. Nichts �berst�rzen - aber auch nicht beim Hacken einschlafen.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //Und schlag nicht immer auf die gleiche Stelle - versuch, um ein sch�nes Nuggetst�ck herumzuarbeiten.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Befolge das und du bist auf dem Weg, ein wahrer Meister- Buddler zu werden.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //Erst will ich meinen Anteil sehen!
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
	Description = "Alles klar?"; 
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
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Alles klar?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Immer sch�n gleichm��ig - so kommst du an die dicken Nuggets!
};


