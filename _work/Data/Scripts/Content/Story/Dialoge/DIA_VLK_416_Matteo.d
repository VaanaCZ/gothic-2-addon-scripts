// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Matteo_EXIT(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 999;
	condition	= DIA_Matteo_EXIT_Condition;
	information	= DIA_MAtteo_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Matteo_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Matteo_PICKPOCKET (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 900;
	condition	= DIA_Matteo_PICKPOCKET_Condition;
	information	= DIA_Matteo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Matteo_PICKPOCKET_Condition()
{
	C_Beklauen (80, 150);
};
 
FUNC VOID DIA_Matteo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Matteo_PICKPOCKET);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_BACK 		,DIA_Matteo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Matteo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Matteo_PICKPOCKET_DoIt);
};

func void DIA_Matteo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
	
func void DIA_Matteo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Matteo_PICKPOCKET);
};
// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Matteo_Hallo(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_Hallo_Condition;
	information	= DIA_MAtteo_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Matteo_Hallo_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Was kann ich für dich tun?
};

// ************************************************************
// 			  				   Sell What 
// ************************************************************
INSTANCE DIA_Matteo_SellWhat(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 1;
	condition	= DIA_Matteo_SellWhat_Condition;
	information	= DIA_MAtteo_SellWhat_Info;
	permanent	= FALSE;
	description = "Was verkaufst du?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Was verkaufst du?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Ich kann dir alles anbieten, was du brauchst, um in der Wildnis zu überleben. Waffen, Fackeln, Proviant ... und sogar Rüstungen.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Ich habe da noch ein ganz besonderes Stück auf Lager.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Eine doppelt gehärtete Rüstung aus Snapperleder - noch ungetragen. Interessiert?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matteo hat seinen Laden am Südtor der Stadt. Er handelt mit Ausrüstung, Waffen und Proviant.");
		Knows_Matteo = TRUE;
	};
};

// *********************************************************
// 		  					TRADE 				
// *********************************************************
INSTANCE DIA_Matteo_TRADE (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 800;
	condition	= DIA_Matteo_TRADE_Condition;
	information	= DIA_Matteo_TRADE_Info;
	permanent	= TRUE;
	description = "Zeig mir Deine Ware.";
	Trade		= TRUE;
};                       
FUNC INT DIA_Matteo_TRADE_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};	
};

var int Matteo_TradeNewsPermanent;

FUNC VOID DIA_Matteo_TRADE_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Zeig mir deine Ware.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Seit die Söldner den Paladin Lothar umgebracht haben, sind die Kontrollen der Paladine noch schärfer geworden.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Ich hoffe, dass sich das legen wird, sobald sie den Mörder gehängt haben.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Es scheint, dass die Paladine diesmal wirklich ernst machen wollen, sie haben sogar ihre Schiffswachen abgezogen.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Es ist gut, dass du deine Vorräte noch mal auffrischst, wer weiß, ob die Stadt nächste Woche noch steht.
	
		Matteo_TradeNewsPermanent = 2;
	};
};

// *********************************************************
// 		  					ARMOR 				
// *********************************************************

//-------------------------------------
	var int Matteo_LeatherBought;
//-------------------------------------

instance DIA_Matteo_LEATHER		(C_INFO)
{
	npc			 = 	VLK_416_Matteo;
	nr			 =  850;
	condition	 = 	DIA_Matteo_LEATHER_Condition;
	information	 = 	DIA_Matteo_LEATHER_Info;
	permanent	 = 	TRUE;
	description	 = 	"Lederrüstung kaufen. Schutz: Waffen 25, Pfeile 20. (250 Gold)";
};

func int DIA_Matteo_LEATHER_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	&& (Matteo_LeatherBought == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Matteo_LEATHER_Info ()
{
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Okay, gib mir die Rüstung.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Du wirst sie lieben. (grinst)

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Die Rüstung hat ihren Preis - und den ist sie auch wert. Also, komm wieder, wenn du genug Gold hast.
	};
};

// ************************************************************
// 			  				Paladine 			E1
// ************************************************************
INSTANCE DIA_Matteo_Paladine(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Paladine_Condition;
	information	= DIA_MAtteo_Paladine_Info;
	permanent	= FALSE;
	description = "Was weißt du über Paladine?";
};                       
FUNC INT DIA_Matteo_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Matteo_Paladine_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Was weißt du über Paladine?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Seit die Kerle in der Stadt sind, hab ich nichts als Ärger!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //Als ich letztens ins obere Viertel wollte, halten mich doch glatt die Wachen auf und fragen mich, was ich da zu suchen habe!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //Und?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Natürlich haben sie mich reingelassen!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //Ich hab meinen Laden schon in der Stadt gehabt, da haben die meisten von diesen Wichtigtuern noch mit Holzschwertern Schweine gejagt!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //Und gestern kommen die Mistkerle zu mir und beschlagnahmen die Hälfte meiner Ware!
};

// ************************************************************
// 			  				Confiscated 			E2
// ************************************************************
INSTANCE DIA_Matteo_Confiscated(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_Confiscated_Condition;
	information	= DIA_MAtteo_Confiscated_Info;
	permanent	= FALSE;
	description = "Die Paladine haben deine Ware beschlagnahmt?";
};                       
FUNC INT DIA_Matteo_Confiscated_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Confiscated_Info()
{	

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //Die Paladine haben deine Ware beschlagnahmt?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Alles, was ich bei mir im Hinterhof gelagert hatte.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Sie haben einfach eine Wache vorm Hofeingang platziert.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Wenn ich Glück habe, nehmen sie nicht alles mit. Zumindest die Rüstungen werden sie wohl da lassen.
};

// ************************************************************
// 			  				HelpMeToOV 			E2
// ************************************************************
INSTANCE DIA_Matteo_HelpMeToOV(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeToOV_Condition;
	information	= DIA_MAtteo_HelpMeToOV_Info;
	permanent	= FALSE;
	description = "Kannst du mir helfen, ins obere Viertel zu kommen?";
};                       
FUNC INT DIA_Matteo_HelpMeToOV_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_Paladine))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeToOV_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //Kannst du mir helfen, ins obere Viertel zu kommen?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(verblüfft) Was? Was willst du denn DA?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Ich habe eine wichtige Nachricht ...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //So so ... Hast du schon versucht, an den Wachen vorbeizukommen?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(lacht bitter) Oh Mann, vergiss es!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(lacht) Das ist TYPISCH für die Penner!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Ich glaube, den Versuch kann ich mir sparen.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Da hast du vermutlich Recht.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //Ich weiß ja nicht WIE wichtig deine Nachricht ist - und es geht mich auch wohl nichts an.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Aber selbst, wenn du ihnen erzählen wolltest, dass im Hafen gerade ein Schiff voller Orks anlegt, würden sie dich wegschicken.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Weil sie ihre BEFEHLE haben.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Scheint dir ja echt wichtig zu sein.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(lauernd) Die Frage ist: WIE wichtig ist es dir?
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //Wie meinst du das?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Ich kann dir schon helfen - immerhin bin ich einer der einflussreichsten Leute hier.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Aber das hat seinen Preis.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Also, kannst du mir jetzt helfen, ins obere Viertel zu kommen?";
};                       
FUNC INT DIA_Matteo_HelpMeNow_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeToOV))
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HelpMeNow_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Also, kannst du mir jetzt helfen, ins obere Viertel zu kommen?
	B_Matteo_Preis();
};

// ************************************************************
// 			  		LEHRLING als GILDE X
// ************************************************************
INSTANCE DIA_Matteo_LehrlingLater(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_LehrlingLater_Condition;
	information	= DIA_MAtteo_LehrlingLater_Info;
	permanent	= FALSE;
	description = "Hilf mir, bei einem der Meister als Lehrling aufgenommen zu werden!";
};                       
FUNC INT DIA_Matteo_LehrlingLater_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func VOID DIA_Matteo_LehrlingLater_Info()
{	
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Hilf mir, bei einem der Meister als Lehrling aufgenommen zu werden!
	B_Matteo_Preis();
};
	
// ************************************************************
// 			  		PriceOfHelp  (MISSION)			E4
// ************************************************************
INSTANCE DIA_Matteo_PriceOfHelp(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_PriceOfHelp_Condition;
	information	= DIA_MAtteo_PriceOfHelp_Info;
	permanent	= FALSE;
	description = "Was verlangst du für deine Hilfe?";
};                       
FUNC INT DIA_Matteo_PriceOfHelp_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_PriceOfHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Was verlangst du für deine Hilfe?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 Goldstücke.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Das ist aber eine verdammte Menge...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Du Halsabschneider!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Reg dich ab! Es ist ja nicht DEIN Gold, das ich im Sinn habe.
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Sondern?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //Im Grunde ist es MEIN Gold.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Gritta, die Nichte des Tischlers, hat seit Ewigkeiten ihre Schulden bei mir nicht bezahlt.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //Aber die kleine Göre rennt ständig in neuen Kleidern rum - das heißt, sie hat das Geld.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //Ich würde es ja aus ihr rausprügeln, aber Meister Thorben - der Tischler - ist auch ein sehr einflussreicher Mann.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Beschaff mir das Geld und ich werde dir helfen.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Gritta, die Nichte des Tischlers Thorben, hat schuldet Matteo 100 Goldstücke. Wenn ich sie ihm wiederbeschaffe, hilft er mir, in's obere Veirtel zu kommen.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Du Halsabschneider!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //Das ist aber eine verdammte Menge ...
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

// ************************************************************
// 			  				WoGritta 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoGritta(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 2;
	condition	= DIA_Matteo_WoGritta_Condition;
	information	= DIA_MAtteo_WoGritta_Info;
	permanent	= FALSE;
	description = "Wo finde ich diese Gritta?";
};                       
FUNC INT DIA_Matteo_WoGritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (Gritta.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoGritta_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Wo finde ich diese Gritta?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Wie gesagt - sie ist die Nichte des Tischlers - sein Haus ist die Straße runter, das letzte Haus rechts vorm Schmied.
};

// ************************************************************
// 			  				GoldRunning 			E5
// ************************************************************
INSTANCE DIA_Matteo_GoldRunning(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 500;
	condition	= DIA_Matteo_GoldRunning_Condition;
	information	= DIA_MAtteo_GoldRunning_Info;
	permanent	= TRUE;
	description = "Hier hast du deine 100 Goldstücke!";
};                       
FUNC INT DIA_Matteo_GoldRunning_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& ( Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) || Npc_IsDead(Gritta) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_GoldRunning_Info()
{	
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Hier hast du deine 100 Goldstücke!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //An dem Gold klebt Grittas Blut! Ich habe nichts davon gesagt, dass du sie umbringen sollst!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //Ich will nichts mit der Sache zu tun haben. Unsere Abmachung kannst du vergessen! Und sprich mich ja nie wieder darauf an!
		MIS_Matteo_Gold = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos	(self);
		return;
	};
	
	// FUNC

	if (B_GiveInvItems (other, self, itmi_gold, 100))
	{
		if (Npc_HasItems(Gritta, itmi_gold) < 100)
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //Und? Hat sie Probleme gemacht?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Keine nennenswerten.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Gut! Damit hast du deinen Teil der Abmachung gehalten.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Du willst also für sie bezahlen? Hm - lieber wär mir gewesen, du hättest es aus ihr rausgequetscht!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Wie auch immer - 100 Goldstücke sind 100 Goldstücke.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Damit hast du deinen Teil der Abmachung gehalten.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //Zählen ist nicht deine Stärke, was? Du hast keine 100 Goldstücke.
	};
};

// ************************************************************
// 		  				Stimme abgeben		E5 - PERM
// ************************************************************

instance DIA_Matteo_Zustimmung(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_Zustimmung_Condition;
	information	= DIA_MAtteo_Zustimmung_Info;
	permanent	= TRUE;
	description = "Hilf mir, bei einem der Meister als Lehrling aufgenommen zu werden!";
};          
var int   DIA_Matteo_Zustimmung_perm;          
FUNC INT DIA_Matteo_Zustimmung_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& ( (MIS_Matteo_Gold == LOG_RUNNING) || (MIS_Matteo_Gold == LOG_SUCCESS) )
	&& (Player_IsApprentice == APP_NONE)
	&& (DIA_Matteo_Zustimmung_perm == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_Zustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Hilf mir, bei einem der Meister als Lehrling aufgenommen zu werden!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //Mach dir keine Sorgen. Ich werde mich an meinen Teil der Abmachung halten.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Die anderen Meister werden von mir nur das Beste über dich zu hören bekommen.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Matteo gibt mir seine Zustimmung, wenn ich irgendwo als Lehrling anfangen will.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Eins nach dem anderen. Erfülle du erst mal deinen Teil der Abmachung und bring mir das Gold!
	};
};

// ************************************************************
// 			  				HowCanYouHelp 			E4
// ************************************************************
INSTANCE DIA_Matteo_HowCanYouHelp (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_HowCanYouHelp_Condition;
	information	= DIA_MAtteo_HowCanYouHelp_Info;
	permanent	= FALSE;
	description = "Wie GENAU kannst du mir helfen?";
};                       
FUNC INT DIA_Matteo_HowCanYouHelp_Condition()
{	
	if ((Npc_KnowsInfo (other,DIA_Matteo_HelpMeNow))
	|| (Npc_KnowsInfo (other,DIA_Matteo_LehrlingLater)))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_HowCanYouHelp_Info()
{	
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Wie GENAU kannst du mir helfen?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //Ganz einfach. Ich werde meinen Einfluss dafür einsetzen, dass du bei einem der Handwerksmeister hier als Lehrling aufgenommen wirst.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Als solcher bist du praktisch Bürger der Stadt und kommst ins obere Viertel. Außerdem verdienst du noch was dabei.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo kann sich dafür einsetzen, das ich bei einem Handwerksmeister als Lehrling aufgenommen werde.");
};	

// ************************************************************
// 			  				WoAlsLehrling 			E5
// ************************************************************
INSTANCE DIA_Matteo_WoAlsLehrling (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 4;
	condition	= DIA_Matteo_WoAlsLehrling_Condition;
	information	= DIA_MAtteo_WoAlsLehrling_Info;
	permanent	= FALSE;
	description = "Bei wem könnte ich denn als Lehrling anfangen?";
};                       
FUNC INT DIA_Matteo_WoAlsLehrling_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WoAlsLehrling_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Bei wem könnte ich denn als Lehrling anfangen?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Im Grunde bei jedem der Meister hier an der Hauptstraße.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //Da wäre Harad, der Schmied, Bosper, der Bogner, Thorben, der Tischler oder Constantino, der Alchemist.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Irgendwer wird dich schon nehmen.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Aber es ist wichtig, dass die anderen Meister zustimmen. Das ist seit jeher Brauch hier in Khorinis.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"ALs Lehrling könnte ich anfangen, bei: Bosper dem Bogner, Harad dem Schmied, Thorben dem Tischler oder Constantino dem Alchemisten.");
	B_LogEntry (Topic_Lehrling,"Um als Lehrling aufgenommen zu werden, brauche ich auch die Zustimmung der anderen Meister.");
};
// ************************************************************
// 			  				WieZustimmung 			E6
// ************************************************************
INSTANCE DIA_Matteo_WieZustimmung (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 5;
	condition	= DIA_Matteo_WieZustimmung_Condition;
	information	= DIA_MAtteo_WieZustimmung_Info;
	permanent	= FALSE;
	description = "Wie bekomme ich die Zustimmung der anderen Meister?";
};                       
FUNC INT DIA_Matteo_WieZustimmung_Condition()
{	
	if ( Npc_KnowsInfo (other,DIA_Matteo_WoAlsLehrling) || Npc_KnowsInfo (other,DIA_Matteo_WarumNichtBeiDir) )
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WieZustimmung_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Wie bekomme ich die Zustimmung der anderen Meister?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Du musst sie einfach von dir überzeugen. Geh hin und rede mit ihnen.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Aber wenn mehr als einer von ihnen gegen dich ist, hast du keine Chance! Also benimm dich!
	
	B_LogEntry (Topic_Lehrling,"Um die Zustimmung der anderen Meister zu bekommen, muss ich sie von mir überzeugen.");
};	

// ************************************************************
// 			  				WarumNichtBeiDir 			E5
// ************************************************************
INSTANCE DIA_Matteo_WarumNichtBeiDir (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_WarumNichtBeiDir_Condition;
	information	= DIA_MAtteo_WarumNichtBeiDir_Info;
	permanent	= FALSE;
	description = "Warum nimmst DU mich nicht als Lehrling auf?";
};                       
FUNC INT DIA_Matteo_WarumNichtBeiDir_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_WarumNichtBeiDir_Info()
{	
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //Warum nimmst DU mich nicht als Lehrling auf?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Würde ich - aber die anderen Meister würden nicht zustimmen.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Ich habe nämlich erst kürzlich einen anderen Lehrling aufgenommen.
};	

// ************************************************************
// 			  				Andere Möglichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "Gibt es noch einen anderen Weg, ins obere Viertel zu kommen? ";
};                       
FUNC INT DIA_Matteo_OtherWay_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Matteo_HowCanYouHelp))
	&& (Mil_305_schonmalreingelassen == FALSE)
	&& (Player_IsApprentice == APP_NONE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Matteo_OtherWay_Info()
{	
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //Gibt es noch einen anderen Weg, ins obere Viertel zu kommen?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Vielleicht ... Wenn mir was einfällt, lasse ich es dich wissen.
};	

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Matteo_Minenanteil (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_Minenanteil_Condition;
	information	= DIA_MAtteo_Minenanteil_Info;

	description = "Du hast Minenanteile in deinem Sortiment.";
};   
                    
FUNC INT DIA_Matteo_Minenanteil_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Matteo_SellWhat))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Matteo_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Du hast Minenanteile in deinem Sortiment. Wer hat sie dir verkauft?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(nervös) Minenanteile? Ups. Wo kommen die denn her? Keine Ahnung, wie ich daran gekommen bin. Ehrlich nicht, Ehrwürdiger.
	B_GivePlayerXP (XP_Ambient);
};	





































