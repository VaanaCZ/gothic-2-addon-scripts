///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulf_EXIT   (C_INFO)
{
	npc         = NOV_602_Ulf;
	nr          = 999;
	condition   = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info YOU
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Hallo		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	2;
	condition	 = 	DIA_Ulf_Hallo_Condition;
	information	 = 	DIA_Ulf_Hallo_Info;
	permanent	 =  FALSE;
	description	 = 	"Co tady dęláš?";
};

func int DIA_Ulf_Hallo_Condition ()
{
	if (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	&& (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};	
};
func void DIA_Ulf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //Co tady dęláš?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //Snažím se splnit úkoly, které mi dal klášter, ke tvé spokojenosti.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Jsem novic z kláštera. Vykonávám pochůzky pro mágy a také pro paladiny.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //Zásobil jsem tâi hostinské ve męstę vínem z kláštera.
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Wirte
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Wirte		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Wirte_Condition;
	information	 = 	DIA_Ulf_Wirte_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kdo jsou ti tâi krčmáâi?";
};

func int DIA_Ulf_Wirte_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Wirte_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Kdo jsou ti tâi krčmáâi?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Jeden z nich je ten dobrý muž tady za barem.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Pak je tady Caragon, který má svou tavernu na chrámovém námęstí, a Kardif, majitel nálevny v pâístavní čtvrti.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Kloster		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Kloster_Condition;
	information	 = 	DIA_Ulf_Kloster_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co mi můžeš âíct o klášteru?";
};

func int DIA_Ulf_Kloster_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Kloster_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Co mi můžeš âíct o klášteru?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //My novicové hledáme osvícení v modlitbách k Innosovi a od mágů se učíme základům víry.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //Tím, že jim sloužíme, sloužíme Innosovi a pâipravujeme se na splynutí s Ohnęm.
};
///////////////////////////////////////////////////////////////////////
//	bring mich zum Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Bringen	(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	4;
	condition	 = 	DIA_Ulf_Bringen_Condition;
	information	 = 	DIA_Ulf_Bringen_Info;
	permanent	 =  FALSE;
	description	 = 	"Odveë mę do kláštera.";
};

func int DIA_Ulf_Bringen_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Bringen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //Odveë mę do kláštera.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Na to zapomeŕ. Víš, kolika pâíšerám jsem se musel cestou sem vyhýbat?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Když pomyslím na všechny ty vlky, skâety a další potvory, jsem rád, že už odsud nemusím.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Kromę toho se do kláštera stejnę nedostaneš.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //Proč ne?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Vstup je povolen jen mágům, paladinům a novicům.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Aufnahme		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Aufnahme_Condition;
	information	 = 	DIA_Ulf_Aufnahme_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak se můžu stát novicem?";
};

func int DIA_Ulf_Aufnahme_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Bringen)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Aufnahme_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Jak se můžu stát novicem?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Když človęk cítí hlubokou touhu...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Hele - âekni mi jenom ty základní podmínky.
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Musíš pâinést dar. Ovci a...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Chci-li se stát novicem v Innosovę klášteâe, potâebuji ovci a 1000 zlaăáků.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Gold		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	8;
	condition	 = 	DIA_Ulf_Gold_Condition;
	information	 = 	DIA_Ulf_Gold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak mám asi sehnat tolik penęz?";
};

func int DIA_Ulf_Gold_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Gold_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Jak mám asi sehnat tolik penęz?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Protože evidentnę neznáš nikoho, kdo by tu částku složil za tebe, nezbývá ti než začít pracovat.
};
///////////////////////////////////////////////////////////////////////
//	Info Schaf
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Schaf		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Schaf_Condition;
	information	 = 	DIA_Ulf_Schaf_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kde najdu ovci?";
};

func int DIA_Ulf_Schaf_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Schaf_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //Kde najdu nęjakou ovci?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //U farmáâů, pochopitelnę. Ale nedostaneš ji jen tak.
	
	B_LogEntry (Topic_Kloster,"Ovci mohu získat od nękterého sedláka.");
};
///////////////////////////////////////////////////////////////////////
//	Info Suche
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Suche		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Suche_Condition;
	information	 = 	DIA_Ulf_Suche_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Ulf_Suche_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Suche_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //Hele, víš, co se stalo?
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Byl jsi vybrán.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //No bezva. Pâesnę ve chvíli, kdy si chci loknout pęknę vychlazeného piva, vynoâí se zpoza rohu Daron a âekne mi, že jsem byl vyvolený.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Kdo by to kdy âekl? Vůle Innosova je nevyzpytatelná. A co tę sem pâivádí?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //Požádal jsem o zkoušku ohnę.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //To pâece není možné?! Chlapče, jsi zatracenę odvážný. Znamená to také, že budeš hledat "to, co vęâící najde za cestou"?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //Vypadá to tak.
};
///////////////////////////////////////////////////////////////////////
//	Info Rausgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Rausgefunden		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Rausgefunden_Condition;
	information	 = 	DIA_Ulf_Rausgefunden_Info;
	permanent	 = 	FALSE;
	description  = "Už jsi nęco našel?";
};
func int DIA_Ulf_Rausgefunden_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Rausgefunden_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //Už jsi nęco našel?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //No, jenom jsem sledoval Agona - ale ztratil jsem ho.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //A teë... co to âíkají? Sleduj Innosova znamení. Nerozumím tak úplnę tomu kousku o cestę.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //No co, budu hledat dál.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "FOLLOW");
	
};
///////////////////////////////////////////////////////////////////////
//	Info Folgen
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Folgen		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Folgen_Condition;
	information	 = 	DIA_Ulf_Folgen_Info;
	permanent	 = 	FALSE;
	description  = "Hej, ty mę sleduješ?";
};
func int DIA_Ulf_Folgen_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Folgen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //Hej, ty mę sleduješ?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Nesmysl. Prostę jen náhodou jdu stejným smęrem.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Stop		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Stop_Condition;
	information	 = 	DIA_Ulf_Stop_Info;
	permanent	 = 	FALSE;
	description  = "Pâestaŕ za mnou bęhat!";
};
func int DIA_Ulf_Stop_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Folgen)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Stop_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //Pâestaŕ za mnou bęhat!
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //Já tę nesleduji. Ale prosím, pokud si to myslíš, půjdu tedy jinudy.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SUCHE");
};
///////////////////////////////////////////////////////////////////////
//	Info Abrechnung
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Abrechnung		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Abrechnung_Condition;
	information	 = 	DIA_Ulf_Abrechnung_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};	
func int DIA_Ulf_Abrechnung_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems (other, ItmI_RuneBlank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Abrechnung_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Takže se opęt setkáváme. Víš, pâemýšlel jsem. Vęâím, že touha stát se mágem je ve mnę hluboko zakoâenęná.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Ale no tak - nedęlej to.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Nemám na výbęr. Život novice není pro mę.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Prostę se musím stát mágem. Potom bude všechno v poâádku. A teë si vezmu to, k čemu jsem oprávnęn.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //Máš nęjaká poslední slova?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Pâestaŕ, nechci tę zabít.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Tak pojëme pâímo k vęci - musím se vrátit do kláštera.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Nemáš nęco ke kouâení?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //Pâestaŕ, nechci tę zabít.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Velká huba. Ale víš, že proti mnę nemáš šanci! Tak jedem!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Pojëme pâímo k jádru vęci - potâebuji se dostat zpátky do kláštera.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //Už nikam nepůjdeš!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Nemáš nęco ke kouâení?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //Máš štęstí. Nęco bych tu męl.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Pojëme na to.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Troll		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Troll_Condition;
	information	 = 	DIA_Ulf_Troll_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};
func int DIA_Ulf_Troll_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	&& ((Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_14") <= 1000)
	|| (Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_15") <= 1000))
	{
		return TRUE;
	};
};
func void DIA_Ulf_Troll_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //Hele, vážnę si myslíš, že jdeme dobâe? Nękde tady žije trol.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Myslím, že bychom se radši męli vydat jiným smęrem.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"WAIT");
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulf_PICKPOCKET (C_INFO)
{
	npc			= NOV_602_Ulf;
	nr			= 900;
	condition	= DIA_Ulf_PICKPOCKET_Condition;
	information	= DIA_Ulf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ulf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 50);
};
 
FUNC VOID DIA_Ulf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulf_PICKPOCKET);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_BACK 		,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};
	
func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};











