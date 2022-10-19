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
	description	 = 	"Co tady dÏl·ö?";
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
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //Co tady dÏl·ö?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //SnaûÌm se splnit ˙koly, kterÈ mi dal kl·öter, ke tvÈ spokojenosti.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Jsem novic z kl·ötera. Vykon·v·m poch˘zky pro m·gy a takÈ pro paladiny.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //Z·sobil jsem t¯i hostinskÈ ve mÏstÏ vÌnem z kl·ötera.
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
	description	 = 	"Kdo jsou ti t¯i krËm·¯i?";
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
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Kdo jsou ti t¯i krËm·¯i?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Jeden z nich je ten dobr˝ muû tady za barem.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Pak je tady Caragon, kter˝ m· svou tavernu na chr·movÈm n·mÏstÌ, a Kardif, majitel n·levny v p¯ÌstavnÌ Ëtvrti.
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
	description	 = 	"Co mi m˘ûeö ¯Ìct o kl·öteru?";
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
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Co mi m˘ûeö ¯Ìct o kl·öteru?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //My novicovÈ hled·me osvÌcenÌ v modlitb·ch k Innosovi a od m·g˘ se uËÌme z·klad˘m vÌry.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //TÌm, ûe jim slouûÌme, slouûÌme Innosovi a p¯ipravujeme se na splynutÌ s OhnÏm.
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
	description	 = 	"OdveÔ mÏ do kl·ötera.";
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
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //OdveÔ mÏ do kl·ötera.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Na to zapomeÚ. VÌö, kolika p¯Ìöer·m jsem se musel cestou sem vyh˝bat?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Kdyû pomyslÌm na vöechny ty vlky, sk¯ety a dalöÌ potvory, jsem r·d, ûe uû odsud nemusÌm.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //KromÏ toho se do kl·ötera stejnÏ nedostaneö.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //ProË ne?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Vstup je povolen jen m·g˘m, paladin˘m a novic˘m.
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
	description	 = 	"Jak se m˘ûu st·t novicem?";
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
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Jak se m˘ûu st·t novicem?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Kdyû ËlovÏk cÌtÌ hlubokou touhu...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Hele - ¯ekni mi jenom ty z·kladnÌ podmÌnky.
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //MusÌö p¯inÈst dar. Ovci a...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Chci-li se st·t novicem v InnosovÏ kl·öte¯e, pot¯ebuji ovci a 1000 zlaù·k˘.");
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
	description	 = 	"Jak m·m asi sehnat tolik penÏz?";
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
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Jak m·m asi sehnat tolik penÏz?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Protoûe evidentnÏ nezn·ö nikoho, kdo by tu Ë·stku sloûil za tebe, nezb˝v· ti neû zaËÌt pracovat.
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
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //Kde najdu nÏjakou ovci?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //U farm·¯˘, pochopitelnÏ. Ale nedostaneö ji jen tak.
	
	B_LogEntry (Topic_Kloster,"Ovci mohu zÌskat od nÏkterÈho sedl·ka.");
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
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //Hele, vÌö, co se stalo?
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Byl jsi vybr·n.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //No bezva. P¯esnÏ ve chvÌli, kdy si chci loknout pÏknÏ vychlazenÈho piva, vyno¯Ì se zpoza rohu Daron a ¯ekne mi, ûe jsem byl vyvolen˝.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Kdo by to kdy ¯ekl? V˘le Innosova je nevyzpytateln·. A co tÏ sem p¯iv·dÌ?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //Poû·dal jsem o zkouöku ohnÏ.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //To p¯ece nenÌ moûnÈ?! ChlapËe, jsi zatracenÏ odv·ûn˝. Znamen· to takÈ, ûe budeö hledat "to, co vÏ¯ÌcÌ najde za cestou"?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //Vypad· to tak.
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
	description  = "Uû jsi nÏco naöel?";
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
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //Uû jsi nÏco naöel?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //No, jenom jsem sledoval Agona - ale ztratil jsem ho.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //A teÔ... co to ¯ÌkajÌ? Sleduj Innosova znamenÌ. NerozumÌm tak ˙plnÏ tomu kousku o cestÏ.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //No co, budu hledat d·l.
	
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
	description  = "Hej, ty mÏ sledujeö?";
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
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //Hej, ty mÏ sledujeö?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Nesmysl. ProstÏ jen n·hodou jdu stejn˝m smÏrem.
	
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
	description  = "P¯estaÚ za mnou bÏhat!";
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
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //P¯estaÚ za mnou bÏhat!
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //J· tÏ nesleduji. Ale prosÌm, pokud si to myslÌö, p˘jdu tedy jinudy.
	
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
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Takûe se opÏt setk·v·me. VÌö, p¯em˝ölel jsem. VÏ¯Ìm, ûe touha st·t se m·gem je ve mnÏ hluboko zako¯enÏn·.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Ale no tak - nedÏlej to.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Nem·m na v˝bÏr. éivot novice nenÌ pro mÏ.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //ProstÏ se musÌm st·t m·gem. Potom bude vöechno v po¯·dku. A teÔ si vezmu to, k Ëemu jsem opr·vnÏn.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //M·ö nÏjak· poslednÌ slova?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"P¯estaÚ, nechci tÏ zabÌt.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Tak pojÔme p¯Ìmo k vÏci - musÌm se vr·tit do kl·ötera.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Nem·ö nÏco ke kou¯enÌ?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //P¯estaÚ, nechci tÏ zabÌt.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Velk· huba. Ale vÌö, ûe proti mnÏ nem·ö öanci! Tak jedem!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //PojÔme p¯Ìmo k j·dru vÏci - pot¯ebuji se dostat zp·tky do kl·ötera.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //Uû nikam nep˘jdeö!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Nem·ö nÏco ke kou¯enÌ?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //M·ö ötÏstÌ. NÏco bych tu mÏl.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //PojÔme na to.
	
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
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //Hele, v·ûnÏ si myslÌö, ûe jdeme dob¯e? NÏkde tady ûije trol.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //MyslÌm, ûe bychom se radöi mÏli vydat jin˝m smÏrem.
	
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











