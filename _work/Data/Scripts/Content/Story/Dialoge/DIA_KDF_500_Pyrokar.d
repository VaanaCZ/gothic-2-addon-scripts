///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Tak ty jsi ten novı novic. Dobrá, pøedpokládám, e u tì s tvımi povinnostmi obeznámil otec Parlan.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(lehce káravì) Víš, e kadı èlen Spoleèenstva ohnì by mìl své povinnosti plnit v souladu s Innosovou vùlí.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "Musím mluvit s paladiny. Dost to spìchá.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Musím mluvit s paladiny. Dost to spìchá.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //A øekneš nám, proè s nimi chceš mluvit?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Mám pro nì dùleitou zprávu.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Co by to jako mìlo bıt za zprávu?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //V Hornickém údolí se shromaïuje armáda zla vedená draky! Musíme je zastavit, dokud mùeme.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hm. Budeme o tvıch slovech pøemıšlet, novici. A nadejde èas, dáme ti vìdìt, jak rada rozhodla.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Mezitím by sis mìl lépe hledìt povinností novice.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Dobrá, u tì nebudeme déle zdrovat od tvé práce - mùeš jít.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Hledám Innosovo oko.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Hledám Innosovo oko.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Kadı, kdo si myslí, e by mohl svatı amulet nejen najít, ale dokonce ho i pouívat, je hlupák.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //Amulet si sám vybírá svého majitele - nikdo, kromì toho, komu je to pøedurèeno, ho není schopen nosit.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Jsem ochotnı to zkusit.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Povinnosti novice tì mají nauèit pokoøe - ne ádostivosti.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Nemyslím, e by to bylo tak tìké, ale Pyrokar mi Oko dobrovolnì a bez pomoci paladinù nevydá.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Dobrá, u tì nebudeme dále zdrovat od tvé práce - mùeš jít.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"Nìkteøí khorinidští obèané záhadnì zmizeli.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Pár khorinidskıch obyvatel nevysvìtlitelnì zmizelo.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //To je mi známo a je to velmi politováníhodné. Ale dohodli jsme se s mágy vody, e se v této záleitosti nebudeme nijak angaovat.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //To samé platí o vyšetøování tìch podivnıch zemìtøesení v severovıchodních oblastech Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Zatím jsme nedostali ádnou zprávu, e by potøebovali naši pomoc, take v téhle vìci nesmíme podniknout nic.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Ano, ale...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //ádné ale! Budeme postupovat, jak se sluší, a doufám, e se podle toho budeš chovat i TY.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Ohniví mágové sice ztracenıch obèanù litují, ale tvrdí, e tyto vìci mají na starosti mágové vody. V klášteøe mi v této vìci nijak nepomohou."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(rozzlobenì) Poslušnost patøí mezi ctnosti, kterıch se máš ještì co uèit. A tak, èi tak.
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Chtìl bych podstoupit zkoušku ohnì.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Chtìl bych podstoupit zkoušku ohnì.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(pøekvapenì) Tak ty o tom víš... ty chceš podstoupit zkoušku ohnì?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Ano, proèetl jsem si Právo ohnì, kde se øíká...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(pøíkøe pøeruší) My známe Právo ohnì. Taky jsme ale vidìli mnoho novicù bìhem toho testu zemøít. Mìl bys své rozhodnutí ještì zváit.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //To jsem u udìlal. Chci tu zkoušku - a jsem pøipraven jí projít.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(varovnì) Kdy na tom bezpodmíneènì trváš, tak tì Rada k té zkoušce pøizve.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Trvám na tom, abych byl pøizván ke zkoušce ohnì.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //V tom pøípadì - a je po tvém. A budeš pøipraven, dostaneš od kadého èlena Rady úkol, jej musíš splnit.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Nech se Innos slituje nad tvou duší.
	
	B_LogEntry (TOPIC_FireContest,"Poádal jsem Pyrokara o zkoušku ohnì. Nyní musím splnit tøi úkoly, které mi zadá nejvyšší rada.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Jsem pøipraven podrobit se tvé zkoušce, Mistøe.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Jsem pøipraven podrobit se tvé zkoušce, Mistøe.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //A jedinì Innos sám ví, jestli jí projdeš. Podstupuješ stejnou zkoušku, jaká je urèena vyvolenım novicùm.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Zkouška magie. (odmìøenì) Asi víš, e zkouškou mùe projít pouze jeden jedinı novic.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //To vím. Tak kdo jsou moji soupeøi?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Innos ve své moudrosti vybral tøi novice, kteøí se také chystají projít testem: Agon, Igaraz a Ulf. U zaèali s hledáním.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(úseènì) Ale dost u o tom! Slyš slova této zkoušky: 'Následuj Innosova znamení a dones nám, co vìøící nalezl na konci cesty.'
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Budeš potøebovat tenhle klíè.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //To je vše, co ti k tomu øekneme.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar pro mì pøipravuje zkoušku magie - stejnou jako je ta, kterou podstoupí zvolení novicové Ulf, Igaraz a Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Musím následovat Innosova znamení a pøinést to, co vìøící najde na své cestì. Dostal jsem k tomu i klíè.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Dokud budeš pracovat na zkoušce, nesmíme ti nic øíct.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Co tady ještì postáváš? Bì se vypoøádat se svou zkouškou!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Nadešel èas porovnat tvá velká slova s tvımi skutky. Nemyslíš, novici?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Našel jsem ten runovı kámen.";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //Našel jsem ten runovı kámen.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(nevìøícnì) Ty... dokázal jsi to?! Sledoval jsi znamení a objevil ukrytı portál...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //...a taky jsem porazil všechna ta stvoøení, co mì povaovala za pøíjemnou svaèinku.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //A co ostatní novicové? Co Agon? Neuspìl døív ne ty?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Neobstáli. Pøedpokládám, e jim zkouška nebyla pøedurèena.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Dobrá, take vyhlásíme, e jsi prošel zkouškou. A ten runovı kámen si mùeš ponechat.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prüfung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Prošel jsi zkouškou, kterou jsem ti pøichystal.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Ale...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //...ale ještì musíš splnit Uthlarùv úkol.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //...ještì musíš dokonèit Serpentùv test.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"A budu teï pøijat do spoleèenstva mágù?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //A budu teï pøijat do spoleèenstva mágù?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Dokázal jsi to. Prošel jsi zkouškou ohnì. Celou dobu jsme si tvım úspìchem byli jistí.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(neústupnì) Tak jako je jisté, e ze sebe vydáš to nejlepší, aby ses mohl stát ctihodnım sluebníkem Innose.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Take pokud jsi pøipraven sloit Pøísahu ohnì, pøijmeme tì mezi sebe jako mága.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jsem pøipraven vstoupit do kruhu ohnì.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Jsem pøipraven vstoupit do kruhu ohnì.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Dobrá, tak slo posvátnou Pøísahu ohnì.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(vánì) Pøísaháš pøed Innosem, kterı je naším Všemohoucím, jeho sluebníky a Svatım plamenem...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //...e od nynìjška navdy bude celı tvùj ivot zasvìcen ohni...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //...dokud tvé tìlo a tvá duše nenalezne odpoèinku v jeho svatıch komnatách a plamen tvého ivota nevyhasne?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Pøísahám.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Vyøèením slov pøísahy jsi vstoupil do svazku s ohnìm.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Nos tuto róbu jako symbol vìèného pouta.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//fürs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Teï, kdy jsme tì pøijali mezi nás, si mùeš promluvit s lordem Hagenem, nejvyšším velitelem paladinù.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Rovnì bychom velmi rádi vìdìli, jak on hodnotí situaci. Take je ti dovoleno odejít do Khorinidu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Oèekáváme, e nám odpovìï doneseš neprodlenì.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Co se mohu nauèit teï?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Co všechno se teï mùu nauèit?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Hlavnì máš teï právo dozvìdìt se vše, co se tıká magickıch kruhù. Dají ti moc, kterou budeš potøebovat k pouívání magickıch run.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Èím vyššího magického kruhu dosáhneš, tím silnìjší kouzla budeš moci pouívat.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Od bratrù v klášteøe se mùeš nauèit magickım formulím. Kadı z nich se zamìøuje na urèitou oblast, o které tì mùe hodnì nauèit.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Napøíklad Karras je mistrem vzıvání a vyvolávání. Hyglas tì zase zasvìtí do ohnivé magie.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Nikdo toho o síle mrazu neví víc ne Marduk. Parlan tì mùe nauèit všechna ostatní zaklínadla - a zasvìtí tì do prvních kruhù.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Ale mohou tì nauèit jen magickım formulím - runy si budeš muset vyrobit sám.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Mistr Parlan mì uvede do prvních magickıch kruhù.");
	
	B_LogEntry (Topic_KlosterTeacher,"Bratr Karras vyuèuje formule pro invokaèní a vyvolávací kouzla.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Hyglas mi pøiblíí tajemství ohnì.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Marduk mì seznámí s mocí ledu a bouøí.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Parlan vyuèuje rùzné další formule.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Chtìl bych vyslovit své pøání.";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Chtìl bych vyslovit jedno pøání.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Poté, co je kadı mág pøijat do Spoleèenstva, má právo prvního skutku.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Tak co udìláš jako první vìc v roli mága?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Nic.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Nech se novım klášterním zahradníkem stane Babo.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"A má novic Opolos pøístup do knihovny.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Kdyby tak Dyrian zùstal i nadále v klášteøe.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Nic.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(uasle) Tak tedy budi. Novı mág se vzdal svého èinu.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //A novic Dyrian zùstane v klášteøe.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Jak si pøeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Novicovi bude dovoleno zùstat v klášteøe a bude zastávat funkci zahradníka, která je právì k dispozici.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //A se novic Babo stará o klášterní zahradu.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Jak si pøeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Novicovi Babovi se s okamitou platností svìøuje do péèe klášterní zahrada.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //A má novic Opolos pøístup do knihovny.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Jak si pøeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Odteï mùe novic Opolos studovat Innosovo písmo.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"Pøináším zprávy od lorda Hagena...";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Mám zprávy od lorda Hagena. Poaduje dùkazy o pøítomnosti drakù a armády zla.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Take vyrazím do Hornického údolí a pøinesu jim ten dùkaz.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Dobrá. Tak tedy splò tento úkol. Paladin Sergio tì doprovodí do prùsmyku.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Nech tì Innos ochraòuje.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Take vyrazím pøímo do Hornického údolí.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Dobrá. Jeliko cestu do Hornického údolí u znáš, nebudeš potøebovat ádnı doprovod.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Postarej se o tu záleitost pro lorda Hagena - nech tì Innos provází.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Nauè mì poslední magickı kruh.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Nauè mì poslední magickı kruh.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Uplynulo mnoho èasu od chvíle, co jsi vstoupil do svazku s ohnìm. Pøihodilo se mnohé a na odpoèinek nikdy nebylo pøíliš èasu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Jsi Innosovım vyvolenım. Proto budeš potøebovat všechnu svou sílu, abys obstál ve všech nadcházejících bitvách.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Teï se ode mì doèkáš zasvìcení, vyvolenı. Vstupuješ do šestého kruhu - šiø svìtlo a rozptyluj temnotu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Nyní se ode mì mùeš nauèit magické formule posledního kruhu. Pokud po tom tedy touíš.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Ach. A ještì jedna vìc - chvíli mi trvalo, ne jsem tì poznal.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Mìl jsi u sebe ten dopis, co ti dali, kdy tì uvrhli za bariéru.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Ano, ušetøil jsi mi tak spoustu tìch soudních øeèí.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //A ty jsi Innosovım vyvolenım.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Pøijmi teï ode mì poehnání, ó vyvolenı!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innosi, svìtlo slunce a ohni svìta, poehnej tomuto mui, tvému vyvolenému sluebníkovi.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dej mu odvahu, sílu a moudrost, aby mohl pøijmout cestu, kterou jsi mu zvolil.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Èas ještì nenadešel. Jakmile po cestì, kterou ti Innos ukazuje, dojdeš trochu dál, pak tì zaènu uèit.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Instruuj mì (vytvoøení run)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Nauè mì nìèemu.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Není nic dalšího, èemu bych tì mohl ještì nauèit.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Posílá mì Parlan.";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Posílá mì Parlan. Chtìl bych posílit svoji magickou moc.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Dobrá, u ses dost nauèil a znaènì jsi zesílil. Odteï se budeš uèit ode mì.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtìl bych posílit svoji magickou moc.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Chtìl bych posílit svoji magickou moc.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Cítím, e tebou magická moc prochází v plné síle. Dokonce u nejsem schopen ti ukázat, jak bys ji mohl ještì více posílit.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(Poehnání)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Poehnej mi, Pane.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Co takhle malé poehnání? Opravdu by se mi hodilo.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Nech je tvá poslední bitva proti našemu arcinepøíteli korunována úspìchem. Innos buï s tebou.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Nech je Innos s tebou a zaehná všechny pekelné cesty, které se ti otevøou.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"Pøicházím z Hornického údolí.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Pøicházím z Hornického údolí.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Co pøinášíš za zprávy?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //Nepøítel se spojil se skøetí armádou a s draky.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //To u jsme se dozvìdìli od Miltena - ale co královskı náklad rudy?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Doly, ve kterıch se tìilo pro Garonda, nemohou uspokojit královy poadavky.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Dny jsou stále zastøenìjší a sluneèní svìtlo slábne.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Byl jsem napaden mui v èernıch kápích.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Já vím. To jsou Pátraèi. Nohsledi z Beliarovy podsvìtní øíše. Snaí se nad tebou získat moc.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Jakmile se tì zmocní, u to nebudeš ty. Jedinì tady v klášteøe ti pak bude pomoci. Take buï opatrnı.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar mi vyprávìl o pátraèích, muích v èernıch hábitech, kteøí jsou Beliarovımi nohsledy. Varoval mì, e dokáí ovládat a posednout druhé. Mám se vrátit pøímo do kláštera, kdyby se mi to náhodou stalo také."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Poádal jsem Karrase, aby se na tu záleitost podíval. Urèitì brzy dojde k nìèemu, co nám dopomùe k lepšímu pochopení toho všeho.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar nakázal Karrasovi, aby se vypoøádal s hrozbou pátraèù."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Tady - pokud budeš potøebovat naši pomoc, pøenese tì tahle runa pøímo do kláštera.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Pamatuj, musíme zùstat ostraití, nebo budeme odsouzeni k záhubì.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"Pøišel jsem si pro Innosovo oko.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Pøišel jsem si pro Innosovo oko.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Vidím, e tì lord Hagen povìøil údìlem nést Innosovo oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Bojím se, e tì musím zklamat. Stali jsme se obìtí zrádného spiknutí nepøítele.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Innosovo oko bylo násilnì odebráno z tìchto svatıch zdí.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Kdo se opováil, pane?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Kdo to byl?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Kdo se opováil, pane?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Kdo to byl?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Zlo je vychytralé a vdycky pracuje v utajení. Jen velmi vzácnì se ti podaøí odhalit jeho intriky na denním svìtle.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Ale v tìchto dnech je to jiná vìc. Nepøítel se ukazuje zcela otevøenì na ulicích, v kadém domì a na kadém námìstí.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //To mùe znamenat jen to, e u se nebojí ádného nepøítele a nezastaví se pøed nièím.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Jeden z našich vìrnıch následovníkù, kandidát na nositele róby vyvolenıch mágù ohnì, neèekanì zmìnil pøedmìt své vìrnosti a propadl obyèejùm zla. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Nepøítel se zmocnil jeho mysli a pøivedl nás tak ke strašné prohøe.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro se probil našimi nejsvatìjšími komnatami a ukradl Oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Bojím se, e trávil pøíliš mnoho èasu o samotì mimo klášter, a tedy mimo dosah jeho ochrannıch zdí. Vystavoval se tak mnohému nebezpeèí.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "No to jsem si mohl myslet. Trochu jsem se opozdil a ti zabednìnci z kláštera zatím dopustili, aby jim nìjakı novic pøímo pøed nosem vyfoukl Innosovo oko. Teï mi nezbıvá nic jiného, ne jít po tom zrádci Pedrovi a doufat, e je ještì nikomu neprodal.");
 	B_LogEntry (TOPIC_TraitorPedro, "Innosovo oko ukradl z kláštera zrádce Pedro. Mám pocit, e ohniví mágové by ho a moc rádi dostali do rukou.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"Máte tušení, kam ten zlodìj utekl?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //Máte tušení, kam ten zlodìj utekl?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro zneškodnil nìkolik dalších novicù, kteøí se ho pokoušeli zastavit, a zmizel v ranní mlze.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //U se za ním vydalo mnoho novicù, aby mohli Oko vrátit v poøádku na své místo.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Pokud ho chceš dopadnout, musíš si pospíšit, dokud Pedro nezmizí z tvého dosahu.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"Našel jsem Innosovo oko.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //Nalezl jsem Innosovo oko. Je rozbité.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Ale... to není moné. Co se stalo?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Padlo do rukou tìch odpornıch zrùd. Stejnì jsem u pøišel pozdì.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Pøipravovali tam nahoøe v lesích podivné zaklínadlo pro nìjakı mìsíèní rituál.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Innos s námi. Znesvìtili náš kruh Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Ani ve svıch nejhorších noèních mùrách jsem si nikdy nepøedstavoval, e si osvojí takovou moc.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Co budeme dìlat teï?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Co budeme dìlat teï?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Nepøítel se stal velmi silnım. Ještì stále však pro nìj tenhle artefakt pøedstavuje mocnou hrozbu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Musíme Innosovo oko opravit a navrátit mu jeho starou sílu. Ale èas je proti nám.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Nedokáu si pøedstavit, co se s námi všemi stane. Bez ochrany Oka jsme nepøíteli vydáni na milost.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Zajdi do mìsta za Vatrasem, vodním mágem. Za tìchto strašnıch okolností si bude vìdìt rady jedinì on. Vezmi Oko k nìmu a pospìš si.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Proè Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Proè kruh Slunce?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar chce, abych ve mìstì poprosil o radu mágy vody a otázal se jich, co dìlat s poškozenım Okem.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Proè právì za Vatrasem?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Privilegium nosit róbu tì ještì neopravòuje k tomu, aby ses vyptával na dùvody mıch instrukcí, bratøe.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras je Adanùv sluebník. Vìdomosti toho vodního mága nám vnesou trochu svìtla do tohoto temného èasu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //To je vše, co potøebuješ vìdìt.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Proè kruh Slunce?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Kadoroènì se v èase slunovratu všichni mágové a novicové kláštera vydávají na cestu na toto místo, aby zde pøivítali poèátek nového cyklu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //To místo zaplòuje nesmírná moc Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Nikdy jsem ani nepomyslel na to, e by tato moc mohla bıt zvrácena. A teï se právì tohle stalo.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"Mluvil jsem s Vatrasem.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //Mluvil jsem s Vatrasem.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Vıbornì. Kde je?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Pøipravuje ve sluneèním kruhu rituál potøebnı k opravì Innosova oka.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Pokud je to pravda, tak nám ještì moná zùstala jiskøièka nadìje.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras chce, abyste mu s tím ty a Xardas pomohli.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //CO? Xardas tam bude taky? To nemùeš myslet vánì.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Hele. Já o tom nerozhodl. Poaduje to Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Poøád ten Xardas. U mì zaèíná unavovat. Jen tìko to mohlo dopadnout hùø.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Jak mám vìdìt, e Xardas není ve spolku s nepøítelem?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Nemùu Xardasovi vìøit a je jedno, jak moc ho potøebujeme.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Je mi líto, ale za tìchto okolností nemohu Vatrasovi pomoci.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Ale bez tebe to nepùjde...";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Bez tebe to nepùjde. Vatras není schopen ten rituál jinak pøipravit.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Budeš muset Xardasovi vìøit.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Nemùu nic dìlat, slyšíš? Nemám ani nejmenší dùkaz toho, e Xardas nepracuje proti nám. Nemùu to udìlat.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //A co kdy ti nìjakı dùkaz seenu?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Bojím se, e to je nemoné. To by mì opravdu pøekvapilo.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //A mám znaèné pochybnosti o tom, e by mì Xardas ještì mohl nìèím pøekvapit. I pøi jeho nevypoèitatelnosti.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar má z Xardase poøádnı strach. Musím s Xardasem prodiskutovat, jak ho pøimìt k úèasti na rituálu kruhu Slunce.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"Pøinesl jsem od Xardase tuhle knihu.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Pøinesl jsem od Xardase tuhle knihu.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //Je to symbol jeho dùvìryhodnosti.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Uka mi to.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(vzrušenì) Ale to je neuvìøitelné. Máš ty vùbec ponìtí, co je to, cos mi právì dal?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Ehm. Ne.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(podrádìnì) Tohle je starobylá, velmi dlouho ztracená kniha z èasù dávno minulıch.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Mìli jsme za to, e je ztracena jednou provdy, ale teï vidím, e Xardas celou tu dobu vìdìl, co se s ní stalo.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Take souhlasíš s tím rituálem?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Ano, mìl bych vyrazit ke sluneènímu kruhu, ale rozhodnì ne proto, e bych byl pøesvìdèenı o Xardasovıch dobrıch úmyslech.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //Vlastnì se chystám z toho psa dostat vysvìtlení, kde tolik let ukrıval tu knihu. Tentokrát zašel pøíliš daleko.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Uvidíme se u sluneèního kruhu.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar koneènì souhlasil, e navštíví kruh slunce.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Myslíš, e to Oko dokáete spravit?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Myslíš, e to Oko dokáete spravit?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Tìko øíct. Poèkáme a uvidíme.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Dokázali jste to. Innosovo oko je zase v poøádku.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Dokázali jste to. Innosovo oko je zase v poøádku.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Jen stìí mùu uvìøit, e je nìco takového moné.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Ano, mistøe.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //U jsi mnohokrát prokázal, e jsi hoden Vyššího øádu ohnivıch mágù.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Od tohoto dne jsi èlenem Rady a budeš nás øád reprezentovat po celém svìtì. Teï jsi jedním z vyšších ohnivıch mágù.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Uívej róbu vyvolenıch s dùstojností a pøines øádu slávu a bohatství, mùj bratøe.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"Co je tady ještì zapotøebí udìlat?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Co tu ještì musím uèinit?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Neplıtvej svım èasem na malichernosti. Bì porazit draky. Tady, vezmi si Oko.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Nezapomeò, e musíš s drakem nejprve promluvit, ne ho napadneš.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Moc Oka pøinutí draka promluvit a øíkat pravdu.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Také ti, pokud ho máš na sobì, poskytuje ochranu proti jejich útokùm.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Nicménì, moc Oka není nevyèerpatelná. Budeš ho muset doplòovat magickou energií.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Budeš k tomu potøebovat esenci z draèího srdce, kterou mùeš s Okem spojit v alchymistické kolonì.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Jedinì pak se mùeš odváit postavit drakovi.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Díky. Budu si to pamatovat.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Teï máš vše, co potøebuješ. Tak jdi. U ti nezbıvá mnoho èasu.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Teï u mohu bez obav èelit drakùm - staèí si pøi boji nasadit Innosovo oko a mohu je všechny postupnì znièit. Pøed bojem si ale musím s drakem vdycky promluvit, jinak nemám šanci. Problém je, e kadı takovı rozhovor pøipravuje Oko o èást moci. Obnovit ji mohu pouze v alchymistické kolonì s pomocí draèího srdce a prázdné laboratorní baòky, kde s pomocí extraktu z draèího srdce mohu moc artefaktu znovu probudit. Teprve pak se mohu postavit dalšímu obludnému ještìrovi."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"Nalezl jsem podivnı almanach.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //Nalezl jsem podivnı almanach.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Opravdu? Co je to za almanach?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Nejsem si jistı. Mìl jsem dojem, e ty budeš vìdìt, k èemu to je.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //Vìru, to je velmi znepokojivé. Jsem rád, es mi to pøinesl. To od tebe bylo opravdu moudré.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Pøedpokládám, e tam toho bude víc. Bì a najdi více tìchto knih zatracení.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Vypadá to, e je to nástroj moci Pátraèù.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Pouívají jej k ovládání ztracenıch duší svıch obìtí.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Obvykle si do tìch knih zapisují jména tìch, kterıch se chtìjí zmocnit.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Poslouchej. Dám ti tenhle magickı svitek. Ukáe ti jména, která jsou zanesená do tìch knih.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Najdi ty obìti a pøines mi jejich knihy. Mìl bych je sprovodit ze svìta.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Ale nejprve bys mìl alespoò jednu z nich ukázat Karrasovi. Moná se mu bude pøi jeho studiích k nìèemu hodit.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Neudìlej hloupost a nepokoušej se je nièit sám. Ještì nejsi schopen odolat jejich moci.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar chce zlomit moc Almanachu posedlıch. Dal mi proto seznam všech, které pátraèi hodlají ovládnout - postupem èasu se mùe rozrùstat o další jména."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Nepøibliuj se k Pátraèùm, jinak tì proklejí.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Pokud nebudeš schopen odolávat jejich volání, vra se ke mnì, jak nejrychleji to bude moné.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Pouze tady v klášteøe je tvá duše v bezpeèí.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //Neexistuje proti tìm mentálním útokùm nìjaké ochrana?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Moné to je. Karras by o tom mohl nìco vìdìt.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"S Karrasovou pomocí prı mohu najít ochranu pøed mentálními útoky pátraèù."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Vyléèit posedlost)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Vyleè mì, pane, byl jsem proklet.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Budi! Vezmi si tenhle lektvar. To tì zbaví tvıch noèních mùr.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Nech je ti Innosova spása ochranou.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Jednej v jeho jménu a støez se zlého nepøítelova pohledu.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Ale abych tì varoval - pokud budeš jejich vlivu vystaven pøíliš èasto, u pro tebe za jistıch okolností nebude návratu. Vdycky na to pamatuj.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Mám dojem, e jsem byl proklet. Mùeš mì vyléèit?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Ne bez dùkazu tvého respektu k tomuto klášteru, mùj synu. 300 zlatıch.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "To je pøíliš.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Vıbornì. Tady jsou peníze.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Ale vdy ty ještì jeden léèivı lektvar máš. Vra se, a budeš mou pomoc opravdu potøebovat.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Vıbornì. Tady jsou peníze.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Tady, vypij tohle. Nech je ti Innosova spása ochranou.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Pøines mi ty peníze a dostane se ti pomoci.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //To je pøíliš.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mùu ti o tom prokletí øíct i nìco víc.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Mùu ti o tom prokletí øíct i nìco víc.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Mluv, bratøe.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold für einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //Nalezl jsem další almanach.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Mám pro tebe tìch Spáèovıch knih ještì víc.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Dobrá. Nicménì se obávám, e je jich k nalezení mnohem víc. Pokraèuj v hledání.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Nalezli jsme jich u mnoho. Nemyslím si však, e to jsou úplnì všechny.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //U jsi mi pøinesl spoustu tìch nepøátelskıch knih.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Docela by mì pøekvapilo, kdyby mezi sebou mìli ještì nìjakou.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Vezmi si tohle. Je to dárek od kláštera, kterı ti pomùe pokadé, kdy se støetneš se zlem.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //A nezapomeò se jednou za èas podívat do mého magického svitku.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Je docela dobøe moné, e se pokusí to samé provést i nìkomu jinému, jeho jméno jsme v tìch knihách nenašli.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"Všichni draci u jsou mrtví.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Všichni draci jsou mrtví.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //To je bezesporu dobrá zpráva. Ale na situaci to nic nemìní. Vypadá to dost beznadìjnì.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Pátraèi ještì poøád nezmizeli. Právì naopak. Slyšel jsem mnoho zvìstí o tom, e se posledních pár dní jejich poèet ještì zvıšil.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Vybití drakù mìlo nepøítele zneškodnit, ale asi to nestaèilo. Musíme to zlo vyrvat i s koøeny.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"Mluvil jsem s draky.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //Mluvil jsem s draky.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Co øíkali?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Povídali o moci jejich Pána a o tom, e se usadil Irdorathskıch síních.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Innos s námi. Temnı chrám znovu nabyl své síly a teï vysílá své pøisluhovaèe do našeho svìta.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"Co jsou to ty Irdorathské sínì?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Co jsou to ty Irdorathské sínì?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Vıchodní chrám vzıvání boha Beliara. V zemi Myrtana jsou celkem ètyøi. Ale tenhle je pravdìpodobnì nejdìsivìjší ze všech.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Asi pøed 40 lety byly znièeny chrámy tohoto strašného bostva na západì a na severu.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Stateèní rytíøi tìch èasù srovnali ty mocné stavby se zemí.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //Pak se èerné hordy nepøátel staly proti pøevaze hrdinské odvahy rytíøù a paladinù bezmocnımi.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Nemìlo by bıt pøíliš tìké znièit i ty zbylé dva chrámy a oèistit tak navdy zemi od zla.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //...ale poté, co druhı chrám padl, prostì zmizely.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(posmìšnì) Zmizely. Celé chrámy. Jo, jasnì.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Nesmìj se. Situace je váná. Pokud Irdorathské sínì znovu nabyly své moci, pak nebude nijak snadné nepøítele porazit.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Proto ho budeš muset najít a povaovat to za svùj další a ještì tìší úkol.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Uvidíme.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Podle Pyrokara jsou Irdorathské sínì ztracenım chrámem, kde uctívaèi vzıvali boha Beliara. Musím jej najít."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"Xardasova kniha, která byla povaována za ztracenou - kde je?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Xardasova kniha, která byla povaována za ztracenou - kde je?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Èekal jsem, e se na to zeptáš. Ale obávám se, e ti to k nièemu nebude.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Byla magicky zapeèetìna. Ukryl jsem ji do jedné z našich podzemních skrıší. Dokonce jsme se u pokoušeli ji otevøít. Marnì.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Ten zpropadenı Xardas s námi hraje špinavou hru.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Mùu se na tu knihu podívat?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Jak je libo. Nedokáu si pøedstavit, e bys uspìl, kdy se to nepovedlo nejvìtším mistrùm kláštera.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Ale klidnì bì a zkus to, Talamon ti nebude bránit.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardasova kniha Irdorathské sínì je ukryta ve sklepeních kláštera, kde ji støeí Talamon. Mágové ji ale nedokáí otevøít - její magickou peèe prı má na svìdomí sám Xardas."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"Podaøilo se mi otevøít Xardasovu knihu.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //Podaøilo se mi otevøít Xardasovu knihu.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Co? Jak jsi to dokázal? Málem mì to pøivedlo k zoufalství.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas mi to prozradil.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Øekl bych, e štìstí si prostì jednou sedne i na vola, nic jiného.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Øekl bych, e štìstí si prostì jednou sedne i na vola, nic jiného.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Nevykládej nesmysly. Štìstí!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Mnì se to vùbec nedaøilo a pak je to pro nìkoho jako ty úplná hraèka...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //...proto mám o èem pøemıšlet.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Jinak. Jeliko jsi byl jedinım, kdo to dokázal otevøít, asi bude nejlepší, kdy ti bude svìøena do péèe. Alespoò do té doby, ne pøekonáme tuhle krizi.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas mi to prozradil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Á, tak je to. Jak zajímavé. Jen ve tvém vlastním zájmu doufám, e tì Xardasùv špatnı vliv ještì nezkazil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Varuju tì. Nepodlehni úskokùm toho starého zla. Mohl bys toho pozdìji litovat.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"V té knize je zmínka o tajné knihovnì.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //V té knize je zmínka o tajné knihovnì.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //O èem to mluvíš?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //O knihovnì tady za tou zdí. Trefil jsem se?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Ne. Kde jsi øíkal, e by ta knihovna mìla bıt?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Rozumím. Nemáš tušení. Mmh.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar o tajné knihovnì nic neví - pravdìpodobnì do ní mìl pøístup pouze Xardas."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"Vím, kde hledat Irdorathské sínì.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Vím, kde hledat Irdorathské sínì.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Ten chrám je na ostrovì. Nalezl jsem námoøní mapu, na které je zachycena cesta.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //To je skvìlé. Tak to budeš potøebovat loï a posádku, aby ses mohl postavit nepøíteli.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Ale nezapomeò, e se musíš dobøe pøipravit, abys byl schopen porazit pána Irdorathu.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Kde najdu nìjakou posádku?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Tvoje posádka by mìla sestávat z muù, kterım se dá vìøit.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Promluv si se svımi pøáteli a popøemıšlej, kdo by se ti mohl hodit, a budeš na ostrovì.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Taky budeš potøebovat mága. Ale bohuel, já nemùu nikoho z kláštera postrádat.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Budeš se muset zeptat nìjakého mága, co neije v klášteøe.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Jorgen je zkušenı námoøník.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen je zkušenım námoøníkem. Mohl by mi pomoci dostat se na ostrov Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Obávám se, e to nebude tak snadné.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Upsal se práci pro bratrstvo. Nesloil nám ani poplatek, ani nám nepøivedl ovci.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen musí nejprve dokonèit svou práci a pak si ho mùeš odvést, pokud budeš mít zájem.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Jak dlouho to bude trvat?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Spotøeboval tolik zásob, kolik by novicovi staèilo pøinejmenším na tøi tıdny. A to za jeden den.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Take ho nemùu nechat jít døív, ne si v naší zahradì tvrdì odpracuje tøi mìsíce.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"Co musím udìlat, abych si mohl Jorgena odvést hned teï?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //Co musím udìlat, abych si mohl Jorgena odvést hned teï?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Mmh. Samozøejmì, je tu jedna vìc, kterou bys mohl udìlat. Mohly by ti s tím pomoci tvé dobré vztahy s Xardasem.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Všiml jsem si, e se posledních pár dní dìjí na jeho vìi divné vìci.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Mnoho lidí øíká, e odtamtud v noci vycházejí rùzné skøeky a e nad jeho vìí tancují divná svìtla.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Jako bychom nemìli dost svıch vlastních starostí. Bì zjistit, co se tam dìje, a zaøiï, a to pøestane.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Pak dostaneš Jorgena.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"V Xardasovì vìi se dìjí divné vìci. Pokud se o nì postarám, mohu vzít Jorgena s sebou.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"Povauj tu vìc s Xardasovou vìí za vyøízenou.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Povauj tu vìc s Xardasovou vìí za vyøízenou.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Tak co se tam dìlo... ne, poèkej, radši to nechci vìdìt.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Jestli poøád chceš Jorgena, tak bì a vezmi ho s sebou na tu svou cestu.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Nech tì Innos ochraòuje.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Proroctví se zmiòuje o posvátné Innosovì auøe.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //Proroctví se zmiòuje o posvátné Innosovì auøe.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //Innosova aura je amulet, kterı smìjí nosit jen nejvìtší mágové své doby.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Mohl bych ho dostat?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"Co je to za amulet?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //Mohl bych ho dostat?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Coe? Co s ním chceš dìlat?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Postavit se drakovi.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Ano, samozøejmì. Dám ti ten amulet, ale zacházej s ním opatrnì.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Jo, jasnì.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Nerad bych jej musel pozdìji vykupovat od nìjakého kupce.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Pouívej ho moudøe, a nech tì Innos stále ochraòuje.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Co je to za amulet?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Øíká se, e ho ukul sám Innos a dal jej lidstvu jako dar.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Ochraòuje toho, kdo jej nosí, pøed jakoukoliv újmou.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co jsou Innosovy slzy?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //Co jsou Innosovy slzy?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Innosovy slzy jsou jen souèástí staré báchorky pro dìti. Vypráví o tom, jak na poèátku èasù zaèala bitva mezi Innosem a Beliarem.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Aha.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Našel jsem tenhle lektvar.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Aha.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Nevím, jestli si jsi plnì vìdom toho, jaká je naše situace, ale tìko dokáu uvìøit tomu, e bys doufal, e nepøítele porazíme pohádkou pro dìti.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Našel jsem tenhle lektvar.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //To není moné. Tomu nemùu uvìøit.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Co se dìje?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Pokud jsou tohle skuteèné Innosovy slzy, pak...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(skoèí do øeèi) Tìko.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Nepøerušuj mì. Pokud jsou tohle skuteèné Innosovy slzy, pak máme proti našemu nepøíteli mocnou zbraò.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Tak co jsou ty Innosovy slzy?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"Co myslíš tou 'zbraní'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //Tak co jsou ty Innosovy slzy?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Kdy si Innos uvìdomil, e aby zachránil svìt, musí bojovat proti Beliarovi, svému vlastnímu bratrovi, byl jeho zármutek nevyslovitelnı.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Zaèal plakat a jeho slzy spadly dolù na svìt. Bylo jich mnoho, protoe jeho srdce bylo tak plné zármutku, e plakal celıch 13 let.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Jdi pøímo k vìci.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Všechny, kdo tyto slzy našli a okusili je, rázem naplnila nadpøirozená síla a bystrost. Poznali moudrost Innosova stvoøení a zaèali mu slouit.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Byli to první èlenové Spoleèenstva ohnì. Ty slzy jim daly sílu, odvahu a moudrost. Ale to u bylo velice dávno, a u více ne 250 let nikdo Innosovy slzy nespatøil.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Co myslíš tou "zbraní"?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Legenda vypráví, e pod vlivem této látky dokázali Innosovi váleèníci vykonávat témìø nadlidské skutky.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Nedotkla se jich ádná únava a byli silní jako dva medvìdi.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Nejvìtší hrdinské èiny starıch dnù bylo moné vykonat jen s pomocí Innosovıch slz.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Rozumím.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Avšak ty slzy mohou pøinést také utrpení a smrt. Tento lektvar mohou pít jen èlenové našeho øádu.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Kohokoliv jiného - dokonce i paladiny našeho Pána - by okamitì potkala krutá smrt.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































