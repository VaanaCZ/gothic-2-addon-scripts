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
	AI_Output (self, other, "DIA_Matteo_Hallo_09_00"); //Co pro tebe mohu udęlat?
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
	description = "Co prodáváš?";
};                       
FUNC INT DIA_Matteo_SellWhat_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Matteo_SellWhat_Info()
{	
	AI_Output (other, self, "DIA_Matteo_SellWhat_15_00"); //Co prodáváš?
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_01"); //Mohu ti nabídnout všechno, co potâebuješ pro pâežití v divočinę. Zbranę, pochodnę, zásoby - dokonce i zbroj.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_02"); //Také tu mám i nęjaké zvláštní zboží.
	AI_Output (self, other, "DIA_Matteo_SellWhat_09_03"); //Dvojnásob tvrzenou zbroj z chŕapavčí kůže - nepoužitou. Nemáš zájem?
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"Matteův obchod leží u jižní męstské brány. Nakoupím tam vybavení, zbranę i potraviny.");
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
	description = "Ukaž mi své zboží.";
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
	AI_Output (other,self ,"DIA_Matteo_TRADE_15_00"); //Ukaž mi své zboží.
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (Matteo_TradeNewsPermanent == FALSE)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_01"); //Od té doby, co žoldáci oddęlali paladina Lothara, to tu ti jeho kamarádíčkové prošăourávají mnohem pâísnęji.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_02"); //Doufám, že až vraha povęsí, tak se to zlepší.
	
		Matteo_TradeNewsPermanent = 1;
	};
	if (Kapitel == 5)
	&& (Matteo_TradeNewsPermanent < 2)
	{
		AI_Output (self,other,"DIA_Matteo_TRADE_09_03"); //Vypadá to, že paladinové to tentokrát myslí vážnę - dokonce odvolali i stráže z lodí.
		AI_Output (self,other,"DIA_Matteo_TRADE_09_04"); //Ještę že nám zase obnovuješ zásoby. Kdo ví, jestli pâíští týden bude naše męsto ještę stát.
	
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
	description	 = 	"Koupit koženou zbroj. Ochrana: zbranę 25, šípy 20. (250 zlaăáků)";
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
	AI_Output (other, self, "DIA_Matteo_LEATHER_15_00"); //Dobâe, tak mi tu zbroj dej.
	
	if B_GiveInvItems (other, self, ItMi_Gold, 250)
	{	
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_01"); //Bude se ti moc líbit. (ušklíbne se)

		B_GiveInvItems 	(self, other, ItAr_Leather_L, 1);
		Matteo_LeatherBought = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Matteo_LEATHER_09_02"); //Zbroj má svou cenu - a opravdu za to stojí. Takže se vraă, až dáš dohromady dost zlata.
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
	description = "Co víš o paladinech?";
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
	AI_Output (other, self, "DIA_Matteo_Paladine_15_00"); //Co víš o paladinech?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_01"); //Od chvíle, kdy ti bastardi dorazili do męsta, neznám nic jiného než samé trampoty.
	AI_Output (self, other, "DIA_Matteo_Paladine_09_02"); //Poslednę jsem zamíâil do horní části męsta, ale stráže mi zastoupily cestu a chtęly vędęt, co tam pohledávám!
	AI_Output (other, self, "DIA_Matteo_Paladine_15_03"); //A?
	AI_Output (self, other, "DIA_Matteo_Paladine_09_04"); //Samozâejmę mę pak pustily dovnitâ!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_05"); //Můj obchod ve męstę stál ještę dâív, než se ti nabubâelí hejhulové naučili zapichovali podsvinčata dâevęným mečem!
	AI_Output (self, other, "DIA_Matteo_Paladine_09_06"); //A včera sem ti bastardi jen tak mírnyx-týrnyx pâišli a zabavili mi půlku zboží!
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
	description = "Paladinové ti zabavili zboží?";
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

	AI_Output (other, self, "DIA_Matteo_Confiscated_15_00"); //Paladinové ti zabavili zboží?
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_01"); //Všecko, co jsem męl uskladnęné vzadu na dvorku.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_02"); //Prostę ke vchodu na dvůr postavili stráž.
	AI_Output (self, other, "DIA_Matteo_Confiscated_09_03"); //Mám kliku, že mi nesebrali úplnę všecko - aspoŕ tu zbroj tu mohli nechat.
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
	description = "Můžeš mi pomoci proniknout do horní čtvrti?";
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
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_00"); //Můžeš mi pomoci proniknout do horní čtvrti?
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_01"); //(udivenę) Cože? A co TAM chceš dęlat?
	AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_02"); //Nesu nęjakou důležitou zprávu.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_03"); //No, víš... Už ses zkoušel dostat pâes stráže?

	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_04"); //(hoâký úsmęv) Zapomeŕ na to, chlape!
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_05"); //(usmęje se) To je pro ty maníky TYPICKÉ!
	}
	else
	{
		AI_Output (other, self, "DIA_Matteo_HelpMeToOV_15_06"); //Nechápu, proč bych to męl vůbec zkoušet.
		AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_07"); //Nejspíš máš pravdu.
	};
	
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_08"); //Nevím, JAK důležitá ta tvoje zpráva je, a vlastnę mi do toho ani nic není.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_09"); //Ale i když jim âekneš, že v pâístavu právę zakotvila loë plná skâetů, stejnę tę pošlou pryč.
	AI_Output (self, other, "DIA_Matteo_HelpMeToOV_09_10"); //Protože mají své ROZKAZY.
};

// ************************************************************
// 			  				HelpMeNow 			E3
// ************************************************************

func void B_Matteo_Preis()
{
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_01"); //Zdá se, že ti na tom opravdu záleží.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_02"); //(potutelnę) Otázka zní, JAK MOC ti na tom záleží.
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_03"); //O co ti jde?
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_04"); //Mohu ti pomoci - koneckonců tu patâím k nejvlivnęjším lidem.
	AI_Output (self, other, "DIA_Matteo_HelpMeNow_09_05"); //Ale nebude to zadarmo.
};


INSTANCE DIA_Matteo_HelpMeNow(C_INFO)
{
	npc			= VLK_416_Matteo;
	nr			= 3;
	condition	= DIA_Matteo_HelpMeNow_Condition;
	information	= DIA_MAtteo_HelpMeNow_Info;
	permanent	= FALSE;
	description = "Takže mi můžeš pomoci proniknout do horní čtvrti?";
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
	AI_Output (other, self, "DIA_Matteo_HelpMeNow_15_00"); //Takže mi můžeš pomoci proniknout do horní čtvrti?
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
	description = "Pomoz mi stát se učedníkem u nękterého z ostatních mistrů.";
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
	AI_Output (other, self, "DIA_Matteo_LehrlingLater_15_00"); //Takže mi můžeš pomoci proniknout do horní čtvrti?
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
	description = "Co za svou pomoc chceš?";
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
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_15_00"); //Co za svou pomoc chceš?
	AI_Output (self, other, "DIA_Matteo_PriceOfHelp_09_01"); //100 zlatých.
	
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "To je zatracenę hodnę...", DIA_Matteo_PriceOfHelp_Wow);
	Info_AddChoice 		(DIA_Matteo_PriceOfHelp, "Ty chamtivče!", DIA_Matteo_PriceOfHelp_Cutthroat);
};

func void B_Matteo_RegDichAb()
{
	AI_Output (self, other, "B_Matteo_RegDichAb_09_00"); //Klídek - nemyslím zrovna TVOJE zlato!
	AI_Output (other, self, "B_Matteo_RegDichAb_15_01"); //Ale?
	AI_Output (self, other, "B_Matteo_RegDichAb_09_02"); //V zásadę jde o MOJE zlato.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_03"); //Tesaâova neteâ Gritta mi totiž už celé vęky nezaplatila, co mi dluží.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_04"); //A pâitom se tu ten malý spratek producíruje každou chvíli v nových hadrech - to znamená, že penęz má dost.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_05"); //Rád bych to z ní vymlátil, ale mistr Thorben - tesaâ - tu má taky dost velký vliv.
	AI_Output (self, other, "B_Matteo_RegDichAb_09_06"); //Když mi dáš ty peníze, pomůžu ti.
	
	MIS_Matteo_Gold = LOG_RUNNING;
	Log_CreateTopic (Topic_Matteo,LOG_MISSION);
	Log_SetTopicStatus	(Topic_Matteo,LOG_RUNNING);
	B_LogEntry (Topic_Matteo,"Gritta, neteâ tesaâe Thorbena, dluží Matteovi 100 zlaăáků. Když mu je vrátím, pomůže mi proniknout do horní čtvrti.");
};

func void DIA_Matteo_PriceOfHelp_Cutthroat()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Cutthroat_15_00"); //Ty chamtivče!
	B_Matteo_RegDichAb();
	Info_ClearChoices 	(DIA_Matteo_PriceOfHelp);
};

func void DIA_Matteo_PriceOfHelp_Wow()
{
	AI_Output (other, self, "DIA_Matteo_PriceOfHelp_Wow_15_00"); //To je zatracenę hodnę...
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
	description = "Kde bych tu Grittu našel?";
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
	AI_Output (other, self, "DIA_Matteo_WoGritta_15_00"); //Kde bych tu Grittu našel?
	AI_Output (self, other, "DIA_Matteo_WoGritta_09_01"); //Jak jsem âekl, je to tesaâova neteâ. Jeho dům najdeš dole v ulici, poslední stavení napravo pâed kovárnou.
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
	description = "Tady máš tęch 100 zlaăáků!";
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
	AI_Output (other, self, "DIA_Matteo_GoldRunning_15_00"); //Tady máš tęch 100 zlaăáků!
	
	//EXIT IF...
	
	if (Npc_IsDead(Gritta))
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_01"); //Na tom zlatę je Grittina krev! Já ti pâece ani v nejmenším nenakázal, abys ji zabil!
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_02"); //S tím nechci nic mít - a na naši úmluvu rovnou zapomeŕ! A už na mę víckrát nemluv!
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
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_03"); //Tak co? Dęlala nęjaké problémy?
			AI_Output (other, self, "DIA_Matteo_GoldRunning_15_04"); //Nic, co by stálo za zmínku.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_05"); //Dobâe. Svou část úmluvy jsi tedy dodržel.
		}
		else
		{
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_06"); //Ty to za ni chceš zaplatit? Hmm, dal bych spíš pâednost tomu, kdybys to vymáčkl pâímo z ní!
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_07"); //Ale - 100 zlaăáků je poâád 100 zlaăáků.
			AI_Output (self, other, "DIA_Matteo_GoldRunning_09_08"); //Svou část úmluvy jsi tím dodržel.
		};
		
		MIS_Matteo_Gold = LOG_SUCCESS;
		B_GivePlayerXP (XP_Matteo_Gold);
	}
	else
	{
		AI_Output (self, other, "DIA_Matteo_GoldRunning_09_09"); //Počítání není zrovna tvoje silná stránka, co? Vždyă ty tęch 100 zlaăáků nemáš.
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
	description = "Pomoz mi stát se učedníkem u nękterého z ostatních mistrů.";
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
	AI_Output (other, self, "DIA_Matteo_Zustimmung_15_00"); //Pomoz mi vstoupit do učení k nękterému z ostatních mistrů!
	
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_01"); //Žádné strachy - já svou část dohody dodržím.
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_02"); //Ostatním mistrům budu o tobę vykládat jenom to nejlepší.
		
		B_GivePlayerXP (XP_Zustimmung);
		B_LogEntry (Topic_Lehrling,"Matteo bude souhlasit, budu-li chtít vstoupit do učení u nękoho jiného.");
		DIA_Matteo_Zustimmung_perm = TRUE;
	}
	else //LOG_RUNNING
	{
		AI_Output (self, other, "DIA_Matteo_Zustimmung_09_03"); //Jedno po druhém. Nejdâív splŕ svou část dohody a pâines mi zlato!
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
	description = "Co KONKRÉTNĘ pro mne můžeš udęlat?";
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
	AI_Output (other, self, "DIA_Matteo_HowCanYouHelp_15_00"); //Co KONKRÉTNĘ pro mne můžeš udęlat?
	AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_01"); //To je jednoduché. Využiju svůj vliv a pâesvędčím jednoho z místních âemeslníků, aby tę pâijal jako učedníka.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Matteo_HowCanYouHelp_09_02"); //Tak se prakticky staneš męšăanem a budeš moci vstoupit i do horní čtvrti. A krom toho si i trochu pâivydęláš.
	};
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling,"Matteo mi může pomoci, aby mę nękterý z âemeslnických mistrů pâijal do učení.");
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
	description = "Kde bych tedy mohl vstoupit do učení?";
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
	AI_Output (other, self, "DIA_Matteo_WoAlsLehrling_15_00"); //Kde bych tedy mohl vstoupit do učení?
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_01"); //Vlastnę ke komukoliv z mistrů tady na hlavní ulici.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_02"); //Může to být kováâ Harad, výrobce luků Bosper, tesaâ Thorben nebo alchymista Constantino.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_03"); //Jeden z nich tę musí pâijmout.
	AI_Output (self, other, "DIA_Matteo_WoAlsLehrling_09_04"); //Ale důležité je, aby s tím souhlasili i ostatní mistâi. Tak je to tady v Khorinidu zvykem.
	
	Log_CreateTopic (Topic_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Mohu vstoupit do učení k výrobci luků Bosperovi, kováâi Haradovi, tesaâi Thorbenovi nebo k alchymistovi Constantinovi.");
	B_LogEntry (Topic_Lehrling,"Ještę než k nękomu vstoupím do učení, musím získat svolení ostatních mistrů.");
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
	description = "Jak získám souhlas ostatních mistrů?";
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
	AI_Output (other, self, "DIA_Matteo_WieZustimmung_15_00"); //Jak získám souhlas ostatních mistrů?
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_01"); //Prostę je musíš nęjak pâesvędčit. Zastav se u nich a promluv si s nimi.
	AI_Output (self, other, "DIA_Matteo_WieZustimmung_09_02"); //Ale jestli si proti sobę popudíš víc jak jednoho, nebudeš mít šanci! Tak se koukej chovat slušnę!
	
	B_LogEntry (Topic_Lehrling,"Ostatní mistâi mi dají své doporučení pouze za pâedpokladu, že jim dokážu svou cenu.");
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
	description = "A proč mę do učení nepâijmeš TY?";
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
	AI_Output (other, self, "DIA_Matteo_WarumNichtBeiDir_15_00"); //A proč mę do učení nepâijmeš TY?
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_01"); //Rád bych - ale museli by s tím souhlasit i ostatní mistâi.
	AI_Output (self, other, "DIA_Matteo_WarumNichtBeiDir_09_02"); //Nedávno jsem pâijal jiného učedníka.
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
	description = "Existuje i jiný způsob, jak se dostat do horní čtvrti?";
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
	AI_Output (other, self, "DIA_Matteo_OtherWay_15_00"); //Existuje i jiný způsob, jak se dostat do horní čtvrti?
	AI_Output (self, other, "DIA_Matteo_OtherWay_09_01"); //Snad ano - jestli na nęco pâijdu, dám ti vędęt.
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

	description = "Ve tvém zboží vidím i nęjaké důlní akcie.";
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
	AI_Output (other, self, "DIA_Matteo_Minenanteil_15_00"); //Mezi tvým zbožím vidím i nęjaké důlní akcie. Kdo ti je prodal?
	AI_Output (self, other, "DIA_Matteo_Minenanteil_09_01"); //(nervóznę) Důlní akcie? Jejda, kde se tu vzaly? Nemám ponętí, jak jsem k nim pâišel. Čestné slovo, na mou duši.
	B_GivePlayerXP (XP_Ambient);
};	





































