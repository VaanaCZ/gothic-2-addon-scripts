//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Was machst du hier?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Was machst du hier?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Suchst du irgendwas?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Pflanzen - ich suche Pflanzen.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Für gewöhnlich suche ich Pflanzen.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Das meiste Zeug, was hier wächst, lässt sich für irgendwas gebrauchen.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Viele Pflanzen haben Heilwirkung und Sumpfkrautstängel kannst du rauchen.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Vor meiner Zeit in der Barriere habe ich bei einem Alchemisten gearbeitet.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Warum haben sie dich in die Barriere gebracht? ";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Warum haben sie dich in die Barriere gebracht?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Ich habe viel mit Tränken gearbeitet, die den Verstand beeinflussen.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Mein Lehrmeister Ignaz hat eines Abends anstatt seinem Wein mein 'Experiment' getrunken.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//Das hat ihn zweitweise ... äh ... unberechenbar gemacht und seitdem ist er etwas verwirrt.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(abfällig) Die Magier haben mich daraufhin in die Barriere werfen lassen. 'Forschung an verbotenem Wissen' haben sie es genannt.
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Was kannst du mir über das Lager erzählen?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Was kannst du mir über das Lager erzählen?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Nicht viel. Ich war selber noch nicht drin.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Nur Ravens Leute waren von Anfang an dabei. Alle anderen, die später kamen, so wie ich, müssen warten, bis neue Leute angefordert werden.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Woher bist du gekommen?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Woher bist du gekommen?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Na, den selben Weg wie du, nehme ich an. Mit den Piraten. Übers Meer.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Das Tal hier ist komplett abgeschieden. Über Land gibt es keine Verbindung.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(bedächtig) Genau.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Wann werden neue Leute angefordert?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //Wann werden neue Leute angefordert?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //Na, wenn drinnen welche fehlen.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Wenn sich ein Buddler von 'nem Minecrawler fressen lässt, wird einer von uns reingelassen.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //Manchmal bringen sie sich auch gegenseitig um. Aber das ist in letzter Zeit besser geworden.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Raven hat den Zugang zur Mine irgendwie geregelt, so dass nicht alle gleichzeitig reinkommen.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Aber wie das genau funktioniert, weiß ich nicht. War ja noch nie drinnen.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "Wegen Fortuno ...";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno ist ziemlich verwirrt und könnte einen Trank vertragen, der ihm seine Erinnerung zurückgibt.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? Das ist doch der Diener von Raven.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Er war es. Jetzt ist er nur noch ein Wrack. Und das ist Ravens Schuld.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Raven? Ich habe bisher große Stücke auf ihn gehalten. Hm, gut. Aber hier im Sumpf kann ich keinen Trank brauen.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//ICH könnte den Trank brauen. Im Lager steht ein Labor- Tisch. Ich brauche nur das Rezept.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Sei vorsichtig mit diesem Rezept. Es ist gefährlich, diesen Trank zu brauen.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Wenn irgendwas beim Brauen schiefgeht, oder eine Zutat nicht stimmt, wirkt der Trank tödlich.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Ich werde vorsichtig sein.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel hat mir ein Rezept für einen Trank gegeben. Damit kann ich Fortuno helfen, sich wieder zu erinnern. Ich sollte den Trank nur brauen, wenn ich mich mit allen Zutaten auskenne. Sonst wirkt er tödlich. ");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Kannst du mir was beibringen?  ";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Kannst du mir was beibringen?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Keine Zeit. Ich bin hier, um an Gold zu kommen. Und solange ich nicht ins Lager komme, verdien' ich mir eben was mit meinen Kräutern.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Aber wenn du ein paar Tränke brauchst, ich hab noch welche dabei.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Bei Miguel kann ich Tränke und Pflanzen kaufen.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



