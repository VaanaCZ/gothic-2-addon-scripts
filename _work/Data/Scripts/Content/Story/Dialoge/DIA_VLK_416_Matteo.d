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
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Co pro tebe mohu udÏlat?
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
	description = "Co prod·v·ö?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Co prod·v·ö?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Mohu ti nabÌdnout vöechno, co pot¯ebujeö pro p¯eûitÌ v divoËinÏ. ZbranÏ, pochodnÏ, z·soby - dokonce i zbroj.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //TakÈ tu m·m i nÏjakÈ zvl·ötnÌ zboûÌ.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Dvojn·sob tvrzenou zbroj z chÚapavËÌ k˘ûe - nepouûitou. Nem·ö z·jem?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matte˘v obchod leûÌ u jiûnÌ mÏstskÈ br·ny. NakoupÌm tam vybavenÌ, zbranÏ i potraviny.");
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
	description = "Ukaû mi svÈ zboûÌ.";
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
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Ukaû mi svÈ zboûÌ.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Od tÈ doby, co ûold·ci oddÏlali paladina Lothara, to tu ti jeho kamar·dÌËkovÈ proöùour·vajÌ mnohem p¯ÌsnÏji.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Douf·m, ûe aû vraha povÏsÌ, tak se to zlepöÌ.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Vypad· to, ûe paladinovÈ to tentokr·t myslÌ v·ûnÏ - dokonce odvolali i str·ûe z lodÌ.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //JeötÏ ûe n·m zase obnovujeö z·soby. Kdo vÌ, jestli p¯ÌötÌ t˝den bude naöe mÏsto jeötÏ st·t.
	
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
	description	 = 	"Koupit koûenou zbroj. Ochrana: zbranÏ 25, öÌpy 20. (250 zlaù·k˘)";
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
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Dob¯e, tak mi tu zbroj dej.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Bude se ti moc lÌbit. (uöklÌbne se)

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Zbroj m· svou cenu - a opravdu za to stojÌ. Takûe se vraù, aû d·ö dohromady dost zlata.
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
	description = "Co vÌö o paladinech?";
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
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Co vÌö o paladinech?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Od chvÌle, kdy ti bastardi dorazili do mÏsta, nezn·m nic jinÈho neû samÈ trampoty.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //PoslednÏ jsem zamÌ¯il do hornÌ Ë·sti mÏsta, ale str·ûe mi zastoupily cestu a chtÏly vÏdÏt, co tam pohled·v·m!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //A?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Samoz¯ejmÏ mÏ pak pustily dovnit¯!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //M˘j obchod ve mÏstÏ st·l jeötÏ d¯Ìv, neû se ti nabub¯elÌ hejhulovÈ nauËili zapichovali podsvinËata d¯evÏn˝m meËem!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //A vËera sem ti bastardi jen tak mÌrnyx-t˝rnyx p¯iöli a zabavili mi p˘lku zboûÌ!
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
	description = "PaladinovÈ ti zabavili zboûÌ?";
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

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //PaladinovÈ ti zabavili zboûÌ?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Vöecko, co jsem mÏl uskladnÏnÈ vzadu na dvorku.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //ProstÏ ke vchodu na dv˘r postavili str·û.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //M·m kliku, ûe mi nesebrali ˙plnÏ vöecko - aspoÚ tu zbroj tu mohli nechat.
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
	description = "M˘ûeö mi pomoci proniknout do hornÌ Ëtvrti?";
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
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //M˘ûeö mi pomoci proniknout do hornÌ Ëtvrti?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(udivenÏ) Coûe? A co TAM chceö dÏlat?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Nesu nÏjakou d˘leûitou zpr·vu.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //No, vÌö... Uû ses zkouöel dostat p¯es str·ûe?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(ho¯k˝ ˙smÏv) ZapomeÚ na to, chlape!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(usmÏje se) To je pro ty manÌky TYPICK…!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Nech·pu, proË bych to mÏl v˘bec zkouöet.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //NejspÌö m·ö pravdu.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //NevÌm, JAK d˘leûit· ta tvoje zpr·va je, a vlastnÏ mi do toho ani nic nenÌ.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Ale i kdyû jim ¯ekneö, ûe v p¯Ìstavu pr·vÏ zakotvila loÔ pln· sk¯et˘, stejnÏ tÏ poölou pryË.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Protoûe majÌ svÈ ROZKAZY.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Zd· se, ûe ti na tom opravdu z·leûÌ.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(potutelnÏ) Ot·zka znÌ, JAK MOC ti na tom z·leûÌ.
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //O co ti jde?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Mohu ti pomoci - koneckonc˘ tu pat¯Ìm k nejvlivnÏjöÌm lidem.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Ale nebude to zadarmo.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Takûe mi m˘ûeö pomoci proniknout do hornÌ Ëtvrti?";
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
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Takûe mi m˘ûeö pomoci proniknout do hornÌ Ëtvrti?
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
	description = "Pomoz mi st·t se uËednÌkem u nÏkterÈho z ostatnÌch mistr˘.";
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
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Takûe mi m˘ûeö pomoci proniknout do hornÌ Ëtvrti?
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
	description = "Co za svou pomoc chceö?";
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
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Co za svou pomoc chceö?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 zlat˝ch.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "To je zatracenÏ hodnÏ...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Ty chamtivËe!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //KlÌdek - nemyslÌm zrovna TVOJE zlato!
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Ale?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //V z·sadÏ jde o MOJE zlato.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Tesa¯ova nete¯ Gritta mi totiû uû celÈ vÏky nezaplatila, co mi dluûÌ.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //A p¯itom se tu ten mal˝ spratek producÌruje kaûdou chvÌli v nov˝ch hadrech - to znamen·, ûe penÏz m· dost.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //R·d bych to z nÌ vyml·til, ale mistr Thorben - tesa¯ - tu m· taky dost velk˝ vliv.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Kdyû mi d·ö ty penÌze, pom˘ûu ti.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Gritta, nete¯ tesa¯e Thorbena, dluûÌ Matteovi 100 zlaù·k˘. Kdyû mu je vr·tÌm, pom˘ûe mi proniknout do hornÌ Ëtvrti.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Ty chamtivËe!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //To je zatracenÏ hodnÏ...
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
	description = "Kde bych tu Grittu naöel?";
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
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Kde bych tu Grittu naöel?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Jak jsem ¯ekl, je to tesa¯ova nete¯. Jeho d˘m najdeö dole v ulici, poslednÌ stavenÌ napravo p¯ed kov·rnou.
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
	description = "Tady m·ö tÏch 100 zlaù·k˘!";
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
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Tady m·ö tÏch 100 zlaù·k˘!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //Na tom zlatÏ je Grittina krev! J· ti p¯ece ani v nejmenöÌm nenak·zal, abys ji zabil!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //S tÌm nechci nic mÌt - a na naöi ˙mluvu rovnou zapomeÚ! A uû na mÏ vÌckr·t nemluv!
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
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //Tak co? DÏlala nÏjakÈ problÈmy?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Nic, co by st·lo za zmÌnku.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Dob¯e. Svou Ë·st ˙mluvy jsi tedy dodrûel.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Ty to za ni chceö zaplatit? Hmm, dal bych spÌö p¯ednost tomu, kdybys to vym·Ëkl p¯Ìmo z nÌ!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Ale - 100 zlaù·k˘ je po¯·d 100 zlaù·k˘.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Svou Ë·st ˙mluvy jsi tÌm dodrûel.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //PoËÌt·nÌ nenÌ zrovna tvoje siln· str·nka, co? Vûdyù ty tÏch 100 zlaù·k˘ nem·ö.
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
	description = "Pomoz mi st·t se uËednÌkem u nÏkterÈho z ostatnÌch mistr˘.";
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
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Pomoz mi vstoupit do uËenÌ k nÏkterÈmu z ostatnÌch mistr˘!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //é·dnÈ strachy - j· svou Ë·st dohody dodrûÌm.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //OstatnÌm mistr˘m budu o tobÏ vykl·dat jenom to nejlepöÌ.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Matteo bude souhlasit, budu-li chtÌt vstoupit do uËenÌ u nÏkoho jinÈho.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Jedno po druhÈm. Nejd¯Ìv splÚ svou Ë·st dohody a p¯ines mi zlato!
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
	description = "Co KONKR…TNÃ pro mne m˘ûeö udÏlat?";
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
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Co KONKR…TNÃ pro mne m˘ûeö udÏlat?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //To je jednoduchÈ. Vyuûiju sv˘j vliv a p¯esvÏdËÌm jednoho z mÌstnÌch ¯emeslnÌk˘, aby tÏ p¯ijal jako uËednÌka.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Tak se prakticky staneö mÏöùanem a budeö moci vstoupit i do hornÌ Ëtvrti. A krom toho si i trochu p¯ivydÏl·ö.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo mi m˘ûe pomoci, aby mÏ nÏkter˝ z ¯emeslnick˝ch mistr˘ p¯ijal do uËenÌ.");
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
	description = "Kde bych tedy mohl vstoupit do uËenÌ?";
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
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Kde bych tedy mohl vstoupit do uËenÌ?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //VlastnÏ ke komukoliv z mistr˘ tady na hlavnÌ ulici.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //M˘ûe to b˝t kov·¯ Harad, v˝robce luk˘ Bosper, tesa¯ Thorben nebo alchymista Constantino.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Jeden z nich tÏ musÌ p¯ijmout.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Ale d˘leûitÈ je, aby s tÌm souhlasili i ostatnÌ mist¯i. Tak je to tady v Khorinidu zvykem.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Mohu vstoupit do uËenÌ k v˝robci luk˘ Bosperovi, kov·¯i Haradovi, tesa¯i Thorbenovi nebo k alchymistovi Constantinovi.");
	B_LogEntry (Topic_Lehrling,"JeötÏ neû k nÏkomu vstoupÌm do uËenÌ, musÌm zÌskat svolenÌ ostatnÌch mistr˘.");
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
	description = "Jak zÌsk·m souhlas ostatnÌch mistr˘?";
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
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Jak zÌsk·m souhlas ostatnÌch mistr˘?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //ProstÏ je musÌö nÏjak p¯esvÏdËit. Zastav se u nich a promluv si s nimi.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Ale jestli si proti sobÏ popudÌö vÌc jak jednoho, nebudeö mÌt öanci! Tak se koukej chovat sluönÏ!
	
	B_LogEntry (Topic_Lehrling,"OstatnÌ mist¯i mi dajÌ svÈ doporuËenÌ pouze za p¯edpokladu, ûe jim dok·ûu svou cenu.");
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
	description = "A proË mÏ do uËenÌ nep¯ijmeö TY?";
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
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //A proË mÏ do uËenÌ nep¯ijmeö TY?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //R·d bych - ale museli by s tÌm souhlasit i ostatnÌ mist¯i.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Ned·vno jsem p¯ijal jinÈho uËednÌka.
};	

// ************************************************************
// 			  				Andere Mˆglichkeie 			E5
// ************************************************************
INSTANCE DIA_Matteo_OtherWay (C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 6;
	condition	= DIA_Matteo_OtherWay_Condition;
	information	= DIA_MAtteo_OtherWay_Info;
	permanent	= FALSE;
	description = "Existuje i jin˝ zp˘sob, jak se dostat do hornÌ Ëtvrti?";
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
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //Existuje i jin˝ zp˘sob, jak se dostat do hornÌ Ëtvrti?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Snad ano - jestli na nÏco p¯ijdu, d·m ti vÏdÏt.
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

	description = "Ve tvÈm zboûÌ vidÌm i nÏjakÈ d˘lnÌ akcie.";
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
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Mezi tv˝m zboûÌm vidÌm i nÏjakÈ d˘lnÌ akcie. Kdo ti je prodal?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(nervÛznÏ) D˘lnÌ akcie? Jejda, kde se tu vzaly? Nem·m ponÏtÌ, jak jsem k nim p¯iöel. »estnÈ slovo, na mou duöi.
	B_GivePlayerXP (XP_Ambient);
};	





































