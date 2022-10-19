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
	description	 = 	"Co tady d�l�?";
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
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //Co tady d�l�?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //Sna��m se splnit �koly, kter� mi dal kl�ter, ke tv� spokojenosti.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Jsem novic z kl�tera. Vykon�v�m poch�zky pro m�gy a tak� pro paladiny.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //Z�sobil jsem t�i hostinsk� ve m�st� v�nem z kl�tera.
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
	description	 = 	"Kdo jsou ti t�i kr�m��i?";
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
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //Kdo jsou ti t�i kr�m��i?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Jeden z nich je ten dobr� mu� tady za barem.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Pak je tady Caragon, kter� m� svou tavernu na chr�mov�m n�m�st�, a Kardif, majitel n�levny v p��stavn� �tvrti.
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
	description	 = 	"Co mi m��e� ��ct o kl�teru?";
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
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //Co mi m��e� ��ct o kl�teru?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //My novicov� hled�me osv�cen� v modlitb�ch k Innosovi a od m�g� se u��me z�klad�m v�ry.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //T�m, �e jim slou��me, slou��me Innosovi a p�ipravujeme se na splynut� s Ohn�m.
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
	description	 = 	"Odve� m� do kl�tera.";
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
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //Odve� m� do kl�tera.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Na to zapome�. V�, kolika p��er�m jsem se musel cestou sem vyh�bat?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Kdy� pomysl�m na v�echny ty vlky, sk�ety a dal�� potvory, jsem r�d, �e u� odsud nemus�m.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Krom� toho se do kl�tera stejn� nedostane�.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //Pro� ne?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Vstup je povolen jen m�g�m, paladin�m a novic�m.
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
	description	 = 	"Jak se m��u st�t novicem?";
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
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //Jak se m��u st�t novicem?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Kdy� �lov�k c�t� hlubokou touhu...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Hele - �ekni mi jenom ty z�kladn� podm�nky.
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Mus� p�in�st dar. Ovci a...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Chci-li se st�t novicem v Innosov� kl�te�e, pot�ebuji ovci a 1000 zla��k�.");
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
	description	 = 	"Jak m�m asi sehnat tolik pen�z?";
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
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //Jak m�m asi sehnat tolik pen�z?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Proto�e evidentn� nezn� nikoho, kdo by tu ��stku slo�il za tebe, nezb�v� ti ne� za��t pracovat.
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
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //Kde najdu n�jakou ovci?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //U farm���, pochopiteln�. Ale nedostane� ji jen tak.
	
	B_LogEntry (Topic_Kloster,"Ovci mohu z�skat od n�kter�ho sedl�ka.");
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
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //Hele, v�, co se stalo?
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Byl jsi vybr�n.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //No bezva. P�esn� ve chv�li, kdy si chci loknout p�kn� vychlazen�ho piva, vyno�� se zpoza rohu Daron a �ekne mi, �e jsem byl vyvolen�.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //Kdo by to kdy �ekl? V�le Innosova je nevyzpytateln�. A co t� sem p�iv�d�?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //Po��dal jsem o zkou�ku ohn�.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //To p�ece nen� mo�n�?! Chlap�e, jsi zatracen� odv�n�. Znamen� to tak�, �e bude� hledat "to, co v���c� najde za cestou"?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //Vypad� to tak.
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
	description  = "U� jsi n�co na�el?";
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
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //U� jsi n�co na�el?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //No, jenom jsem sledoval Agona - ale ztratil jsem ho.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //A te�... co to ��kaj�? Sleduj Innosova znamen�. Nerozum�m tak �pln� tomu kousku o cest�.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //No co, budu hledat d�l.
	
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
	description  = "Hej, ty m� sleduje�?";
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
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //Hej, ty m� sleduje�?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Nesmysl. Prost� jen n�hodou jdu stejn�m sm�rem.
	
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
	description  = "P�esta� za mnou b�hat!";
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
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //P�esta� za mnou b�hat!
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //J� t� nesleduji. Ale pros�m, pokud si to mysl�, p�jdu tedy jinudy.
	
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
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Tak�e se op�t setk�v�me. V�, p�em��lel jsem. V���m, �e touha st�t se m�gem je ve mn� hluboko zako�en�n�.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Ale no tak - ned�lej to.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //Nem�m na v�b�r. �ivot novice nen� pro m�.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Prost� se mus�m st�t m�gem. Potom bude v�echno v po��dku. A te� si vezmu to, k �emu jsem opr�vn�n.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //M� n�jak� posledn� slova?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"P�esta�, nechci t� zab�t.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Tak poj�me p��mo k v�ci - mus�m se vr�tit do kl�tera.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Nem� n�co ke kou�en�?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //P�esta�, nechci t� zab�t.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //Velk� huba. Ale v�, �e proti mn� nem� �anci! Tak jedem!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Poj�me p��mo k j�dru v�ci - pot�ebuji se dostat zp�tky do kl�tera.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //U� nikam nep�jde�!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //Nem� n�co ke kou�en�?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //M� �t�st�. N�co bych tu m�l.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Poj�me na to.
	
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
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //Hele, v�n� si mysl�, �e jdeme dob�e? N�kde tady �ije trol.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Mysl�m, �e bychom se rad�i m�li vydat jin�m sm�rem.
	
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











