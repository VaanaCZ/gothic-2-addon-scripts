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
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Cosa posso fare per te?
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
	description = "Cosa vendi?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Cosa vendi?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Posso offrirti qualsiasi cosa per sopravvivere là fuori. Armi, torce, provviste... anche armature!
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Ho ancora un pezzo speciale a disposizione.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Armatura di pelle di squartatore rinforzata, mai usata. Ti interessa?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Il negozio di Matteo è al cancello sud della città. Vende equipaggiamento, armi e provviste.");
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
	description = "Mostrami la mercanzia.";
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
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Mostrami la mercanzia.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Da quando i mercenari hanno fatto fuori Lothar, le ispezioni dei paladini si sono fatte più intense.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Spero che la smetteranno, una volta che avranno impiccato l'assassino.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Sembra che i paladini facciano sul serio, questa volta, hanno addirittura ritirato le guardie della flotta navale.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //È saggio fare il pieno di scorte adesso. Chi può dire se la settimana prossima la città reggerà ancora?
	
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
	description	 = 	"Compra l’armatura di cuoio. Protezione: armi 25, frecce 20 (250 monete d’oro)";
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
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Ve bene, dammi l'armatura.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //L'amerai (ghigna).

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //L'armatura ha il suo prezzo e lo vale tutto. Perciò, torna quando avrai abbastanza oro.
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
	description = "Cosa sai sui paladini?";
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
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Cosa sai sui paladini?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Da quando quei bastardi sono arrivati in città non hanno portato altro che guai.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //L'ultima volta che stavo andando verso la parte alta della città, le guardie sono sbucate dal nulla, mi hanno fermato e mi hanno chiesto che cosa facevo lì!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //E allora?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Naturalmente mi hanno fatto entrare!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //Avevo il mio negozio in città da quando la maggior parte di questi animali rincorreva maiali con spade di legno.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //E ieri quei bastardi sono venuti e hanno confiscato metà dei miei beni!
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
	description = "I paladini hanno confiscato la tua merce?";
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

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //I paladini hanno confiscato la tua merce?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Qualunque cosa avessi nel magazzino sul retro.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Hanno messo un uomo di guardia all'ingresso.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Se sono fortunato, non prenderanno tutto quanto. Almeno potrebbero lasciare qui l'armatura.
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
	description = "Puoi aiutarmi a raggiungere il quartiere alto?";
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
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //Puoi aiutarmi a raggiungere il quartiere alto?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(sbalordito) Cosa? Che cosa stai facendo LÌ?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Ho un messaggio importante...
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //Bene, bene... Hai provato a superare le guardie?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(risata amara) Oh, non parliamone più!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(ride) È TIPICO di quei mendicanti!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Non vedo perché dovrei provarci.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Probabilmente hai ragione.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //Non so QUANTO sia importante il tuo messaggio e non sono affari miei.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Ma anche se dici loro che c'è una nave carica di orchi ancorata al porto, ti manderanno via.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Perché hanno i loro ORDINI.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Sembra essere molto importante per te.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(maliziosamente) La domanda è: QUANTO è importante per te?
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //Dove vuoi arrivare?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Posso aiutarti, dopo tutto sono una delle persone più influenti qui.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Ma ti costerà.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Allora, puoi aiutarmi a raggiungere il quartiere alto?";
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
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Allora, puoi aiutarmi a raggiungere il quartiere alto?
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
	description = "Aiutami a diventare apprendista di uno dei maestri.";
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
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Allora, puoi aiutarmi a raggiungere il quartiere alto?
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
	description = "Cosa chiedi in cambio del tuo aiuto?";
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
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Cosa chiedi in cambio del tuo aiuto?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 monete d’oro.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Stai chiedendo troppo...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Aguzzino!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Calma! Non è il TUO oro ciò a cui sono interessato.
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Ma?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //Sostanzialmente è il MIO oro.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Gritta, la nipote del carpentiere, non mi ha ancora pagato ciò che mi deve da tempo.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //Ma quella piccola peste continua ad andare in giro con vestiti nuovi, perciò vuol dire che ha i soldi.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //Vorrei darle una lezione, ma anche maestro Thorben, il carpentiere, è una personalità autorevole.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Portami i miei soldi e ti aiuterò.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Gritta, la nipote del carpentiere Thorben, deve 100 pezzi d'oro a Matteo. Se riesco a riportarglieli, mi aiuterà ad arrivare nei quartieri alti.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Aguzzino!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //Stai chiedendo troppo...
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
	description = "Dove si trova questo Gritta?";
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
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Dove si trova questa Gritta?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Come ho già detto, Gritta è la nipote del carpentiere, la sua casa si trova in fondo alla strada, l'ultima casa sulla destra prima del fabbro.
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
	description = "Ecco le tue 100 monete d’oro!";
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
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Eccoti le tue 100 monete d'oro!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //Questo oro è sporco del sangue di Gritta! Nessuno ti aveva detto di ucciderla!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //Non voglio entrare in questa faccenda, il nostro accordo è annullato! E non rivolgermi più la parola!
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
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //E? Ha creato qualche problema?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Niente di rilevante.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Bene! Hai fatto la tua parte.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Vuoi pagare al posto suo? Uhm, avrei preferito che tu riuscissi a farteli dare da lei!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Ma 100 pezzi d'oro sono 100 pezzi d'oro.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Hai fatto la tua parte.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //I conti non sono il tuo forte, vero? Non hai 100 pezzi d'oro.
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
	description = "Aiutami a diventare apprendista di uno dei maestri.";
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
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Aiutami a prendere servizio come apprendista presso uno dei maestri!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //Non preoccuparti. Rispetterò la mia parte dell'accordo.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Gli altri maestri sentiranno da parte mia solo lodi su di te.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Matteo darà la sua approvazione qualora dovessi fare l'apprendista da qualche parte.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Una cosa alla volta. Prima fai la tua parte e portami l'oro.
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
	description = "Come puoi aiutarmi, ESATTAMENTE?";
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
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Come puoi aiutarmi, ESATTAMENTE?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //Molto semplice. Userò la mia influenza per vedere se uno dei maestri artigiani di qui è interessato a te come apprendista.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Come tale, diventerai un cittadino a tutti gli effetti e avrai accesso ai quartieri alti. Inoltre, potrai guadagnare qualche spicciolo, già che ci sei.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo può aiutarmi a essere accettato come apprendista da uno dei mastri artigiani.");
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
	description = "Allora, dove posso prendere servizio come apprendista?";
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
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Allora, dove posso prendere servizio come apprendista?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Fondamentalmente con uno qualsiasi dei maestri sulla strada principale.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //Potrebbe essere Harald il fabbro, il fabbricante d'archi Bosper, Thorben il carpentiere o Constantino l'alchimista.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Uno di loro è destinato a prenderti con sé.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Ma è importante che gli altri maestri siano d'accordo. Qui a Khorinis ha sempre funzionato così.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Potrei cominciare a lavorare per Bosper il fabbricante d'archi, Harad il fabbro, Thorben il carpentiere o Constantino l'alchimista.");
	B_LogEntry (Topic_Lehrling,"Prima di poter diventare apprendista, devo ottenere l'approvazione degli altri mastri.");
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
	description = "Come faccio a ottenere l’approvazione degli altri maestri?";
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
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Come faccio a ottenere l’approvazione degli altri maestri?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Devi solamente convincerli. Vai e parla con loro.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Ma se più di uno di loro sarà contro di te, allora non hai possibilità! Perciò, comportati bene!
	
	B_LogEntry (Topic_Lehrling,"Posso ottenere l'approvazione semplicemente mostrandomi degno ai loro occhi.");
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
	description = "Perché non mi prendi TU come apprendista?";
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
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //Perché non mi prendi TU come apprendista?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Mi piacerebbe, ma gli altri maestri non sarebbero d'accordo.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Ho appena preso con me un nuovo apprendista.
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
	description = "C’è un altro modo per raggiungere il quartiere alto?";
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
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //C’è un altro modo per raggiungere il quartiere alto?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Forse... se mi viene in mente qualcosa ti farò sapere.
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

	description = "Hai delle azioni della miniera tra la tua mercanzia.";
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
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Tra la tua roba hai delle quote minerarie. Chi te le ha vendute?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(nervosamente) Quote minerarie? Oops. Da dove vengono? Non ho idea di dove le ho prese, in tutta onestà, vostro onore.
	B_GivePlayerXP (XP_Ambient);
};	





































