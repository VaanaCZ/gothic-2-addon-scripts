//---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_EXIT   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 999;
	condition   = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Scatty_EXIT_Condition()	
	{
		return TRUE;
	};
FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine (self, "START");
		Scatty_Start = TRUE;
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Scatty_PICKPOCKET (C_INFO)
{
	npc			= BDT_1086_Addon_Scatty;
	nr			= 900;
	condition	= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information	= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen (60, 90);
};
 
FUNC VOID DIA_Addon_Scatty_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
	
func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Hi   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent   = FALSE;
	description = "Wie läuft das Geschäft?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Wie läuft das Geschäft?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Seitdem die Gruft offen ist, werde ich nicht mehr viel los.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Raven hat keine Verwendung mehr für die Sklaven, deshalb hacken sie jetzt das Gold. Auf Anordnung von Bloodwyn.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//Und die Buddler ruhen sich aus. (murmelt) Buddler, die sich ausruhen, sind nicht gut für's Geschäft.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty handelt mit verschiedenen Waren.");
};
/*
	Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln. 
	(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf-  oder ein Abstieg? 
*/
//---------------------------------------------------------------------
//	Info last
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_last   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent   = FALSE;
	description = "Bloodwyn? Hat der hier was zu sagen? ";
};
FUNC INT DIA_Addon_Scatty_last_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_last_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//Bloodwyn? Hat der hier was zu sagen?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Er hat die Aufsicht über die Mine. Aber er ist so gut wie nie hier unten. Die meiste Zeit verbringt er bei Raven im Tempel.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Was genau bedeutet 'so gut wie nie'?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//Das letzte Mal habe ich ihn gesehen, als er aus der Gruft kam ...
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(eilig) ... Nein, warte! Das letzte Mal war er hier, als er die Sklaven zum Goldhacken geschickt hat.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//Im Gegensatz zu Raven hat ER ein großes Interesse an Gold.
};
//---------------------------------------------------------------------
//	Info Gruft
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gruft   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent   = FALSE;
	description = "Was ist das für eine Gruft?";
};
FUNC INT DIA_Addon_Scatty_Gruft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//Was ist das für eine Gruft?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//Eine verfluchte Unglücksgruft. Die Wächter der Gruft haben viele Männer getötet!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Wächter? Redest du von Wesen aus Stein? Ziemlich flach mit rundem Kopf?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//Genau die meine ich! Zu Dutzenden kamen sie aus den Tiefen des Steins.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Ich wusste von Anfang an, dass es nicht gut ist, die Gruft auszubuddeln.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Aber Raven war wie besessen von der Idee dort zu graben. Und als die Gruft endlich freigelegt war, ist er mit seiner Garde dort reinmarschiert.
};
//---------------------------------------------------------------------
//	Info GruftAgain
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_GruftAgain   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent   = FALSE;
	description = "Was wollte Raven in der Gruft?";
};
FUNC INT DIA_Addon_Scatty_GruftAgain_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gruft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Was wollte Raven in der Gruft?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(stutzt) Hm ... du bist ziemlich neugierig. Erinnerst mich an einen Kerl, den ich mal kannte.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Der war genau so neugierig. Und das ist ihm irgendwann zum Verhängnis geworden.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Komm zur Sache. Was ist in der Gruft passiert?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//Nun ... Ähm ... ich habe 'ne ziemlich trockene Kehle ...
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Hey Scatty, NICHT JETZT. Das hier ist wichtig, also was hat Raven dort gemacht?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//Na schön. (atmet tief durch) Er ... er hat etwas gerufen ... beschworen. Er rief immer wieder Worte in einer fremden Sprache.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Helles Licht drang aus der Gruft und dann hörte ich einen Schrei, der mir durch Mark und Bein ging - ein dämonischer Schrei.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//Und weiter?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//Mehr weiß ich nicht. In dem Augenblick kam Bloodwyn aus der Gruft und hat mir gesagt ich soll verschwinden. Und das habe ich dann auch getan.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Es hat auch gar nicht solange gedauert, und Raven ist mit seinen Jungs wieder im Tempel verschwunden. Seitdem hat sich Raven nicht mehr blicken lassen.
};
//---------------------------------------------------------------------
//	Info Trinken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Trinken   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent   = FALSE;
	description = "Willst du was trinken?";
};
FUNC INT DIA_Addon_Scatty_Trinken_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Scatty_GruftAgain)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Willst du was trinken?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Wenn du ein Bier hast, das wäre jetzt genau das Richtige. Bier gibt's nämlich kaum hier im Lager.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Aber vielleicht hat Lucia noch 'ne Flasche ...
};
//---------------------------------------------------------------------
//	Info Bier geben
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Bier   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent   = FALSE;
	description = "Wohl bekommt's. (Bier geben)";
};
FUNC INT DIA_Addon_Scatty_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems (other, ItFo_beer) 
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Bier_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Wohl bekomm's.
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Oh, schmeckt das gut. Danke Mann. Du bist mein Held.
	
	B_GivePlayerXP (XP_Ambient* 5);
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gold   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Scatty_Gold_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Eine Spitzhacke in die Hand nehmen und auf 'nen Goldklumpen draufschlagen, das kann jeder.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Aber dabei zersplittern viele Nuggets. Deshalb sollten nur Leute hacken, die was davon verstehen.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Ich kann dir noch mehr erzählen, wenn du etwas Erfahrung mitbringst.

	B_Upgrade_Hero_HackChance(5);
};
//---------------------------------------------------------------------
//	Info teach
//---------------------------------------------------------------------
var int Scatty_teach_perm;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_teach   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent   = TRUE;
	description = "Goldhacken lernen (Kosten: 2 LP/10 Prozent)";
};
FUNC INT DIA_Addon_Scatty_teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Erzähl mir mehr über's Goldhacken.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Als vor allem solltest du wissen, dass Gold kein Erz ist. Es ist weich wie Butter. Wenn du zu hart schlägst, zersplittert dir alles.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Jeder Buddler hat seine eigenen Tricks, um ein paar schöne Nuggets aus dem Fels zu kloppen.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//Diese Tricks sind es, die letztendlich den Unterschied zwischen einem Buddler und einem guten Buddler ausmachen.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//Außerdem: Übung macht den Meister. Wenn du erst mal 'ne Weile gehackt hast, wirst du auch besser.
		
		other.lp = (other.lp -1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};

//---------------------------------------------------------------------
//	Info tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_tot   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent   = FALSE;
	description = "Bloodwyn ist tot.";
};
FUNC INT DIA_Addon_Scatty_tot_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_tot_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn ist tot.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hm, gibt ja nicht viele, denen ich das wünsche - aber Bloodwyn ist besser dran, wenn er tot ist.
};
//---------------------------------------------------------------------
//	Info trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_trade   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Scatty_trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};


