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
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Tak ty jsi ten nový novic. Dobrá, pâedpokládám, že už tê s tvými povinnostmi obeznámil otec Parlan.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(lehce káravê) Víš, že každý èlen Spoleèenstva ohnê by mêl své povinnosti plnit v souladu s Innosovou vùlí.
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
	description	 =  "Musím mluvit s paladiny. Dost to spêchá.";
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
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Musím mluvit s paladiny. Dost to spêchá.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //A âekneš nám, proè s nimi chceš mluvit?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Mám pro nê dùležitou zprávu.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Co by to jako mêlo být za zprávu?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //V Hornickém údolí se shromažëuje armáda zla vedená draky! Musíme je zastavit, dokud mùžeme.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hm. Budeme o tvých slovech pâemýšlet, novici. Až nadejde èas, dáme ti vêdêt, jak rada rozhodla.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Mezitím by sis mêl lépe hledêt povinností novice.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Dobrá, už tê nebudeme déle zdržovat od tvé práce - mùžeš jít.
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
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Každý, kdo si myslí, že by mohl svatý amulet nejen najít, ale dokonce ho i používat, je hlupák.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //Amulet si sám vybírá svého majitele - nikdo, kromê toho, komu je to pâedurèeno, ho není schopen nosit.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Jsem ochotný to zkusit.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Povinnosti novice tê mají nauèit pokoâe - ne žádostivosti.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Nemyslím, že by to bylo tak têžké, ale Pyrokar mi Oko dobrovolnê a bez pomoci paladinù nevydá.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Dobrá, už tê nebudeme dále zdržovat od tvé práce - mùžeš jít.
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

	description	 = 	"Nêkteâí khorinidští obèané záhadnê zmizeli.";
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
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Pár khorinidských obyvatel nevysvêtlitelnê zmizelo.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //To je mi známo a je to velmi politováníhodné. Ale dohodli jsme se s mágy vody, že se v této záležitosti nebudeme nijak angažovat.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //To samé platí o vyšetâování têch podivných zemêtâesení v severovýchodních oblastech Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Zatím jsme nedostali žádnou zprávu, že by potâebovali naši pomoc, takže v téhle vêci nesmíme podniknout nic.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Ano, ale...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Žádné ale! Budeme postupovat, jak se sluší, a doufám, že se podle toho budeš chovat i TY.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Ohniví mágové sice ztracených obèanù litují, ale tvrdí, že tyto vêci mají na starosti mágové vody. V klášteâe mi v této vêci nijak nepomohou."); 

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
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(rozzlobenê) Poslušnost patâí mezi ctnosti, kterých se máš ještê co uèit. Aã tak, èi tak.
	
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
	description	 = 	"Chtêl bych podstoupit zkoušku ohnê.";
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
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Chtêl bych podstoupit zkoušku ohnê.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(pâekvapenê) Tak ty o tom víš... ty chceš podstoupit zkoušku ohnê?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Ano, proèetl jsem si Právo ohnê, kde se âíká...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(pâíkâe pâeruší) My známe Právo ohnê. Taky jsme ale vidêli mnoho novicù bêhem toho testu zemâít. Mêl bys své rozhodnutí ještê zvážit.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //To jsem už udêlal. Chci tu zkoušku - a jsem pâipraven jí projít.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(varovnê) Když na tom bezpodmíneènê trváš, tak tê Rada k té zkoušce pâizve.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Trvám na tom, abych byl pâizván ke zkoušce ohnê.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //V tom pâípadê - aã je po tvém. Až budeš pâipraven, dostaneš od každého èlena Rady úkol, jejž musíš splnit.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Nechã se Innos slituje nad tvou duší.
	
	B_LogEntry (TOPIC_FireContest,"Požádal jsem Pyrokara o zkoušku ohnê. Nyní musím splnit tâi úkoly, které mi zadá nejvyšší rada.");
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
	description	 = 	"Jsem pâipraven podrobit se tvé zkoušce, Mistâe.";
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
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Jsem pâipraven podrobit se tvé zkoušce, Mistâe.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //A jedinê Innos sám ví, jestli jí projdeš. Podstupuješ stejnou zkoušku, jaká je urèena vyvoleným novicùm.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Zkouška magie. (odmêâenê) Asi víš, že zkouškou mùže projít pouze jeden jediný novic.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //To vím. Tak kdo jsou moji soupeâi?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Innos ve své moudrosti vybral tâi novice, kteâí se také chystají projít testem: Agon, Igaraz a Ulf. Už zaèali s hledáním.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(úseènê) Ale dost už o tom! Slyš slova této zkoušky: 'Následuj Innosova znamení a dones nám, co vêâící nalezl na konci cesty.'
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Budeš potâebovat tenhle klíè.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //To je vše, co ti k tomu âekneme.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar pro mê pâipravuje zkoušku magie - stejnou jako je ta, kterou podstoupí zvolení novicové Ulf, Igaraz a Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Musím následovat Innosova znamení a pâinést to, co vêâící najde na své cestê. Dostal jsem k tomu i klíè.");
	
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
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Dokud budeš pracovat na zkoušce, nesmíme ti nic âíct.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Co tady ještê postáváš? Bêž se vypoâádat se svou zkouškou!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Nadešel èas porovnat tvá velká slova s tvými skutky. Nemyslíš, novici?
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
	description	 = 	"Našel jsem ten runový kámen.";
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
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //Našel jsem ten runový kámen.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(nevêâícnê) Ty... dokázal jsi to?! Sledoval jsi znamení a objevil ukrytý portál...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //...a taky jsem porazil všechna ta stvoâení, co mê považovala za pâíjemnou svaèinku.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //A co ostatní novicové? Co Agon? Neuspêl dâív než ty?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Neobstáli. Pâedpokládám, že jim zkouška nebyla pâedurèena.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Dobrá, takže vyhlásíme, že jsi prošel zkouškou. A ten runový kámen si mùžeš ponechat.
	 
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
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Prošel jsi zkouškou, kterou jsem ti pâichystal.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Ale...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //...ale ještê musíš splnit Uthlarùv úkol.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //...ještê musíš dokonèit Serpentùv test.
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
	description	 = 	"A budu teë pâijat do spoleèenstva mágù?";
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
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //A budu teë pâijat do spoleèenstva mágù?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Dokázal jsi to. Prošel jsi zkouškou ohnê. Celou dobu jsme si tvým úspêchem byli jistí.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(neústupnê) Tak jako je jisté, že ze sebe vydáš to nejlepší, aby ses mohl stát ctihodným služebníkem Innose.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Takže pokud jsi pâipraven složit Pâísahu ohnê, pâijmeme tê mezi sebe jako mága.
	
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
	description	 = 	"Jsem pâipraven vstoupit do kruhu ohnê.";
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
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Jsem pâipraven vstoupit do kruhu ohnê.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Dobrá, tak slož posvátnou Pâísahu ohnê.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(vážnê) Pâísaháš pâed Innosem, který je naším Všemohoucím, jeho služebníky a Svatým plamenem...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //...že od nynêjška navždy bude celý tvùj život zasvêcen ohni...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //...dokud tvé têlo a tvá duše nenalezne odpoèinku v jeho svatých komnatách a plamen tvého života nevyhasne?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Pâísahám.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Vyâèením slov pâísahy jsi vstoupil do svazku s ohnêm.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Nos tuto róbu jako symbol vêèného pouta.
	
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
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Teë, když jsme tê pâijali mezi nás, si mùžeš promluvit s lordem Hagenem, nejvyšším velitelem paladinù.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Rovnêž bychom velmi rádi vêdêli, jak on hodnotí situaci. Takže je ti dovoleno odejít do Khorinidu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Oèekáváme, že nám odpovêë doneseš neprodlenê.
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
	description	 = 	"Co se mohu nauèit teë?";
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
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Co všechno se teë mùžu nauèit?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Hlavnê máš teë právo dozvêdêt se vše, co se týká magických kruhù. Dají ti moc, kterou budeš potâebovat k používání magických run.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Èím vyššího magického kruhu dosáhneš, tím silnêjší kouzla budeš moci používat.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Od bratrù v klášteâe se mùžeš nauèit magickým formulím. Každý z nich se zamêâuje na urèitou oblast, o které tê mùže hodnê nauèit.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Napâíklad Karras je mistrem vzývání a vyvolávání. Hyglas tê zase zasvêtí do ohnivé magie.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Nikdo toho o síle mrazu neví víc než Marduk. Parlan tê mùže nauèit všechna ostatní zaklínadla - a zasvêtí tê do prvních kruhù.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Ale mohou tê nauèit jen magickým formulím - runy si budeš muset vyrobit sám.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Mistr Parlan mê uvede do prvních magických kruhù.");
	
	B_LogEntry (Topic_KlosterTeacher,"Bratr Karras vyuèuje formule pro invokaèní a vyvolávací kouzla.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Hyglas mi pâiblíží tajemství ohnê.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Marduk mê seznámí s mocí ledu a bouâí.");
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
	description	 = 	"Chtêl bych vyslovit své pâání.";
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
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Chtêl bych vyslovit jedno pâání.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Poté, co je každý mág pâijat do Spoleèenstva, má právo prvního skutku.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Tak co udêláš jako první vêc v roli mága?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Nic.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Nechã se novým klášterním zahradníkem stane Babo.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Aã má novic Opolos pâístup do knihovny.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Kdyby tak Dyrian zùstal i nadále v klášteâe.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Nic.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(užasle) Tak tedy budiž. Nový mág se vzdal svého èinu.
	
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
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Aã novic Dyrian zùstane v klášteâe.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Jak si pâeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Novicovi bude dovoleno zùstat v klášteâe a bude zastávat funkci zahradníka, která je právê k dispozici.
	
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
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Aã se novic Babo stará o klášterní zahradu.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Jak si pâeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Novicovi Babovi se s okamžitou platností svêâuje do péèe klášterní zahrada.
	
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
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Aã má novic Opolos pâístup do knihovny.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Jak si pâeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Odteë mùže novic Opolos studovat Innosovo písmo.
	
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
	description	 = 	"Pâináším zprávy od lorda Hagena...";
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
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Mám zprávy od lorda Hagena. Požaduje dùkazy o pâítomnosti drakù a armády zla.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Takže vyrazím do Hornického údolí a pâinesu jim ten dùkaz.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Dobrá. Tak tedy splà tento úkol. Paladin Sergio tê doprovodí do prùsmyku.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Nechã tê Innos ochraàuje.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Takže vyrazím pâímo do Hornického údolí.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Dobrá. Jelikož cestu do Hornického údolí už znáš, nebudeš potâebovat žádný doprovod.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Postarej se o tu záležitost pro lorda Hagena - nechã tê Innos provází.
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
	description	 = 	"Nauè mê poslední magický kruh.";
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
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Nauè mê poslední magický kruh.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Uplynulo mnoho èasu od chvíle, co jsi vstoupil do svazku s ohnêm. Pâihodilo se mnohé a na odpoèinek nikdy nebylo pâíliš èasu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Jsi Innosovým vyvoleným. Proto budeš potâebovat všechnu svou sílu, abys obstál ve všech nadcházejících bitvách.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Teë se ode mê doèkáš zasvêcení, vyvolený. Vstupuješ do šestého kruhu - šiâ svêtlo a rozptyluj temnotu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Nyní se ode mê mùžeš nauèit magické formule posledního kruhu. Pokud po tom tedy toužíš.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Ach. A ještê jedna vêc - chvíli mi trvalo, než jsem tê poznal.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Mêl jsi u sebe ten dopis, co ti dali, když tê uvrhli za bariéru.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Ano, ušetâil jsi mi tak spoustu têch soudních âeèí.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //A ty jsi Innosovým vyvoleným.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Pâijmi teë ode mê požehnání, ó vyvolený!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innosi, svêtlo slunce a ohni svêta, požehnej tomuto muži, tvému vyvolenému služebníkovi.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dej mu odvahu, sílu a moudrost, aby mohl pâijmout cestu, kterou jsi mu zvolil.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Èas ještê nenadešel. Jakmile po cestê, kterou ti Innos ukazuje, dojdeš trochu dál, pak tê zaènu uèit.
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
	description	 = 	"Instruuj mê (vytvoâení run)";
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
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Nauè mê nêèemu.
	
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
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Není nic dalšího, èemu bych tê mohl ještê nauèit.
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
	description	 = 	"Posílá mê Parlan.";
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
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Posílá mê Parlan. Chtêl bych posílit svoji magickou moc.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Dobrá, už ses dost nauèil a znaènê jsi zesílil. Odteë se budeš uèit ode mê.
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
	description	 = 	"Chtêl bych posílit svoji magickou moc.";
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
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Chtêl bych posílit svoji magickou moc.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Cítím, že tebou magická moc prochází v plné síle. Dokonce už nejsem schopen ti ukázat, jak bys ji mohl ještê více posílit.
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
	description	 = 	"(Požehnání)";
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
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Požehnej mi, Pane.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //Co takhle malé požehnání? Opravdu by se mi hodilo.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Nechã je tvá poslední bitva proti našemu arcinepâíteli korunována úspêchem. Innos buë s tebou.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Nechã je Innos s tebou a zažehná všechny pekelné cesty, které se ti otevâou.
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

	description	 = 	"Pâicházím z Hornického údolí.";
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
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Pâicházím z Hornického údolí.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //Co pâinášíš za zprávy?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //Nepâítel se spojil se skâetí armádou a s draky.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //To už jsme se dozvêdêli od Miltena - ale co královský náklad rudy?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Doly, ve kterých se têžilo pro Garonda, nemohou uspokojit královy požadavky.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Dny jsou stále zastâenêjší a sluneèní svêtlo slábne.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Byl jsem napaden muži v èerných kápích.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Já vím. To jsou Pátraèi. Nohsledi z Beliarovy podsvêtní âíše. Snaží se nad tebou získat moc.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Jakmile se tê zmocní, už to nebudeš ty. Jedinê tady v klášteâe ti pak bude pomoci. Takže buë opatrný.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar mi vyprávêl o pátraèích, mužích v èerných hábitech, kteâí jsou Beliarovými nohsledy. Varoval mê, že dokáží ovládat a posednout druhé. Mám se vrátit pâímo do kláštera, kdyby se mi to náhodou stalo také."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Požádal jsem Karrase, aby se na tu záležitost podíval. Urèitê brzy dojde k nêèemu, co nám dopomùže k lepšímu pochopení toho všeho.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar nakázal Karrasovi, aby se vypoâádal s hrozbou pátraèù."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Tady - pokud budeš potâebovat naši pomoc, pâenese tê tahle runa pâímo do kláštera.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Pamatuj, musíme zùstat ostražití, nebo budeme odsouzeni k záhubê.

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

	description	 = 	"Pâišel jsem si pro Innosovo oko.";
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
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //Pâišel jsem si pro Innosovo oko.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Vidím, že tê lord Hagen povêâil údêlem nést Innosovo oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Bojím se, že tê musím zklamat. Stali jsme se obêtí zrádného spiknutí nepâítele.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Innosovo oko bylo násilnê odebráno z têchto svatých zdí.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "Kdo se opovážil, pane?", DIA_Pyrokar_GIVEINNOSEYE_wer );
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
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //Kdo se opovážil, pane?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //Kdo to byl?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Zlo je vychytralé a vždycky pracuje v utajení. Jen velmi vzácnê se ti podaâí odhalit jeho intriky na denním svêtle.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Ale v têchto dnech je to jiná vêc. Nepâítel se ukazuje zcela otevâenê na ulicích, v každém domê a na každém námêstí.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //To mùže znamenat jen to, že už se nebojí žádného nepâítele a nezastaví se pâed nièím.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Jeden z našich vêrných následovníkù, kandidát na nositele róby vyvolených mágù ohnê, neèekanê zmênil pâedmêt své vêrnosti a propadl obyèejùm zla. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Nepâítel se zmocnil jeho mysli a pâivedl nás tak ke strašné prohâe.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro se probil našimi nejsvatêjšími komnatami a ukradl Oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Bojím se, že trávil pâíliš mnoho èasu o samotê mimo klášter, a tedy mimo dosah jeho ochranných zdí. Vystavoval se tak mnohému nebezpeèí.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "No to jsem si mohl myslet. Trochu jsem se opozdil a ti zabednênci z kláštera zatím dopustili, aby jim nêjaký novic pâímo pâed nosem vyfoukl Innosovo oko. Teë mi nezbývá nic jiného, než jít po tom zrádci Pedrovi a doufat, že je ještê nikomu neprodal.");
 	B_LogEntry (TOPIC_TraitorPedro, "Innosovo oko ukradl z kláštera zrádce Pedro. Mám pocit, že ohniví mágové by ho až moc rádi dostali do rukou.");
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

	description	 = 	"Máte tušení, kam ten zlodêj utekl?";
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
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //Máte tušení, kam ten zlodêj utekl?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro zneškodnil nêkolik dalších novicù, kteâí se ho pokoušeli zastavit, a zmizel v ranní mlze.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Už se za ním vydalo mnoho novicù, aby mohli Oko vrátit v poâádku na své místo.
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
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Ale... to není možné. Co se stalo?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Padlo do rukou têch odporných zrùd. Stejnê jsem už pâišel pozdê.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Pâipravovali tam nahoâe v lesích podivné zaklínadlo pro nêjaký mêsíèní rituál.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Innos s námi. Znesvêtili náš kruh Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Ani ve svých nejhorších noèních mùrách jsem si nikdy nepâedstavoval, že si osvojí takovou moc.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Co budeme dêlat teë?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Co budeme dêlat teë?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Nepâítel se stal velmi silným. Ještê stále však pro nêj tenhle artefakt pâedstavuje mocnou hrozbu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Musíme Innosovo oko opravit a navrátit mu jeho starou sílu. Ale èas je proti nám.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Nedokážu si pâedstavit, co se s námi všemi stane. Bez ochrany Oka jsme nepâíteli vydáni na milost.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Zajdi do mêsta za Vatrasem, vodním mágem. Za têchto strašných okolností si bude vêdêt rady jedinê on. Vezmi Oko k nêmu a pospêš si.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Proè Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Proè kruh Slunce?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar chce, abych ve mêstê poprosil o radu mágy vody a otázal se jich, co dêlat s poškozeným Okem.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Proè právê za Vatrasem?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Privilegium nosit róbu tê ještê neopravàuje k tomu, aby ses vyptával na dùvody mých instrukcí, bratâe.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras je Adanùv služebník. Vêdomosti toho vodního mága nám vnesou trochu svêtla do tohoto temného èasu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //To je vše, co potâebuješ vêdêt.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Proè kruh Slunce?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Každoroènê se v èase slunovratu všichni mágové a novicové kláštera vydávají na cestu na toto místo, aby zde pâivítali poèátek nového cyklu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //To místo zaplàuje nesmírná moc Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Nikdy jsem ani nepomyslel na to, že by tato moc mohla být zvrácena. A teë se právê tohle stalo.
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
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Výbornê. Kde je?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Pâipravuje ve sluneèním kruhu rituál potâebný k opravê Innosova oka.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Pokud je to pravda, tak nám ještê možná zùstala jiskâièka nadêje.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras chce, abyste mu s tím ty a Xardas pomohli.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //CO? Xardas tam bude taky? To nemùžeš myslet vážnê.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Hele. Já o tom nerozhodl. Požaduje to Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Poâád ten Xardas. Už mê zaèíná unavovat. Jen têžko to mohlo dopadnout hùâ.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Jak mám vêdêt, že Xardas není ve spolku s nepâítelem?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Nemùžu Xardasovi vêâit a je jedno, jak moc ho potâebujeme.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Je mi líto, ale za têchto okolností nemohu Vatrasovi pomoci.
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
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Bez tebe to nepùjde. Vatras není schopen ten rituál jinak pâipravit.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Budeš muset Xardasovi vêâit.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Nemùžu nic dêlat, slyšíš? Nemám ani nejmenší dùkaz toho, že Xardas nepracuje proti nám. Nemùžu to udêlat.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //A co když ti nêjaký dùkaz seženu?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Bojím se, že to je nemožné. To by mê opravdu pâekvapilo.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //A mám znaèné pochybnosti o tom, že by mê Xardas ještê mohl nêèím pâekvapit. I pâi jeho nevypoèitatelnosti.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar má z Xardase poâádný strach. Musím s Xardasem prodiskutovat, jak ho pâimêt k úèasti na rituálu kruhu Slunce.");
	
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

	description	 = 	"Pâinesl jsem od Xardase tuhle knihu.";
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Pâinesl jsem od Xardase tuhle knihu.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //Je to symbol jeho dùvêryhodnosti.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Ukaž mi to.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(vzrušenê) Ale to je neuvêâitelné. Máš ty vùbec ponêtí, co je to, cos mi právê dal?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Ehm. Ne.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(podráždênê) Tohle je starobylá, velmi dlouho ztracená kniha z èasù dávno minulých.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Mêli jsme za to, že je ztracena jednou provždy, ale teë vidím, že Xardas celou tu dobu vêdêl, co se s ní stalo.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Takže souhlasíš s tím rituálem?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Ano, mêl bych vyrazit ke sluneènímu kruhu, ale rozhodnê ne proto, že bych byl pâesvêdèený o Xardasových dobrých úmyslech.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //Vlastnê se chystám z toho psa dostat vysvêtlení, kde tolik let ukrýval tu knihu. Tentokrát zašel pâíliš daleko.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Uvidíme se u sluneèního kruhu.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar koneènê souhlasil, že navštíví kruh slunce.");
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

	description	 = 	"Myslíš, že to Oko dokážete spravit?";
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
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //Myslíš, že to Oko dokážete spravit?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Têžko âíct. Poèkáme a uvidíme.
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

	description	 = 	"Dokázali jste to. Innosovo oko je zase v poâádku.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Dokázali jste to. Innosovo oko je zase v poâádku.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Jen stêží mùžu uvêâit, že je nêco takového možné.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Ano, mistâe.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Už jsi mnohokrát prokázal, že jsi hoden Vyššího âádu ohnivých mágù.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Od tohoto dne jsi èlenem Rady a budeš nás âád reprezentovat po celém svêtê. Teë jsi jedním z vyšších ohnivých mágù.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Užívej róbu vyvolených s dùstojností a pâines âádu slávu a bohatství, mùj bratâe.
		
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

	description	 = 	"Co je tady ještê zapotâebí udêlat?";
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
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Co tu ještê musím uèinit?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Neplýtvej svým èasem na malichernosti. Bêž porazit draky. Tady, vezmi si Oko.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Nezapomeà, že musíš s drakem nejprve promluvit, než ho napadneš.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Moc Oka pâinutí draka promluvit a âíkat pravdu.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Také ti, pokud ho máš na sobê, poskytuje ochranu proti jejich útokùm.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Nicménê, moc Oka není nevyèerpatelná. Budeš ho muset doplàovat magickou energií.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Budeš k tomu potâebovat esenci z draèího srdce, kterou mùžeš s Okem spojit v alchymistické kolonê.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Jedinê pak se mùžeš odvážit postavit drakovi.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Díky. Budu si to pamatovat.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Teë máš vše, co potâebuješ. Tak jdi. Už ti nezbývá mnoho èasu.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Teë už mohu bez obav èelit drakùm - staèí si pâi boji nasadit Innosovo oko a mohu je všechny postupnê znièit. Pâed bojem si ale musím s drakem vždycky promluvit, jinak nemám šanci. Problém je, že každý takový rozhovor pâipravuje Oko o èást moci. Obnovit ji mohu pouze v alchymistické kolonê s pomocí draèího srdce a prázdné laboratorní baàky, kde s pomocí extraktu z draèího srdce mohu moc artefaktu znovu probudit. Teprve pak se mohu postavit dalšímu obludnému ještêrovi."); 

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

	description	 = 	"Nalezl jsem podivný almanach.";
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //Nalezl jsem podivný almanach.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //Opravdu? Co je to za almanach?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Nejsem si jistý. Mêl jsem dojem, že ty budeš vêdêt, k èemu to je.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //Vêru, to je velmi znepokojivé. Jsem rád, žes mi to pâinesl. To od tebe bylo opravdu moudré.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Pâedpokládám, že tam toho bude víc. Bêž a najdi více têchto knih zatracení.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Vypadá to, že je to nástroj moci Pátraèù.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Používají jej k ovládání ztracených duší svých obêtí.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Obvykle si do têch knih zapisují jména têch, kterých se chtêjí zmocnit.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Poslouchej. Dám ti tenhle magický svitek. Ukáže ti jména, která jsou zanesená do têch knih.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Najdi ty obêti a pâines mi jejich knihy. Mêl bych je sprovodit ze svêta.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Ale nejprve bys mêl alespoà jednu z nich ukázat Karrasovi. Možná se mu bude pâi jeho studiích k nêèemu hodit.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Neudêlej hloupost a nepokoušej se je nièit sám. Ještê nejsi schopen odolat jejich moci.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar chce zlomit moc Almanachu posedlých. Dal mi proto seznam všech, které pátraèi hodlají ovládnout - postupem èasu se mùže rozrùstat o další jména."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Nepâibližuj se k Pátraèùm, jinak tê proklejí.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Pokud nebudeš schopen odolávat jejich volání, vraã se ke mnê, jak nejrychleji to bude možné.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Pouze tady v klášteâe je tvá duše v bezpeèí.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //Neexistuje proti têm mentálním útokùm nêjaké ochrana?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Možné to je. Karras by o tom mohl nêco vêdêt.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"S Karrasovou pomocí prý mohu najít ochranu pâed mentálními útoky pátraèù."); 
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
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Vyleè mê, pane, byl jsem proklet.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Budiž! Vezmi si tenhle lektvar. To tê zbaví tvých noèních mùr.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Nechã je ti Innosova spása ochranou.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Jednej v jeho jménu a stâez se zlého nepâítelova pohledu.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Ale abych tê varoval - pokud budeš jejich vlivu vystaven pâíliš èasto, už pro tebe za jistých okolností nebude návratu. Vždycky na to pamatuj.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Mám dojem, že jsem byl proklet. Mùžeš mê vyléèit?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Ne bez dùkazu tvého respektu k tomuto klášteru, mùj synu. 300 zlatých.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "To je pâíliš.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Výbornê. Tady jsou peníze.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Ale vždyã ty ještê jeden léèivý lektvar máš. Vraã se, až budeš mou pomoc opravdu potâebovat.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Výbornê. Tady jsou peníze.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Tady, vypij tohle. Nechã je ti Innosova spása ochranou.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Pâines mi ty peníze a dostane se ti pomoci.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //To je pâíliš.
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

	description	 = 	"Mùžu ti o tom prokletí âíct i nêco víc.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Mùžu ti o tom prokletí âíct i nêco víc.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Mluv, bratâe.
	
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
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Mám pro tebe têch Spáèových knih ještê víc.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Dobrá. Nicménê se obávám, že je jich k nalezení mnohem víc. Pokraèuj v hledání.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Nalezli jsme jich už mnoho. Nemyslím si však, že to jsou úplnê všechny.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Už jsi mi pâinesl spoustu têch nepâátelských knih.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Docela by mê pâekvapilo, kdyby mezi sebou mêli ještê nêjakou.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Vezmi si tohle. Je to dárek od kláštera, který ti pomùže pokaždé, když se stâetneš se zlem.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //A nezapomeà se jednou za èas podívat do mého magického svitku.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Je docela dobâe možné, že se pokusí to samé provést i nêkomu jinému, jehož jméno jsme v têch knihách nenašli.
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

	description	 = 	"Všichni draci už jsou mrtví.";
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
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //To je bezesporu dobrá zpráva. Ale na situaci to nic nemêní. Vypadá to dost beznadêjnê.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Pátraèi ještê poâád nezmizeli. Právê naopak. Slyšel jsem mnoho zvêstí o tom, že se posledních pár dní jejich poèet ještê zvýšil.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Vybití drakù mêlo nepâítele zneškodnit, ale asi to nestaèilo. Musíme to zlo vyrvat i s koâeny.

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
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //Co âíkali?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //Povídali o moci jejich Pána a o tom, že se usadil Irdorathských síních.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Innos s námi. Temný chrám znovu nabyl své síly a teë vysílá své pâisluhovaèe do našeho svêta.

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

	description	 = 	"Co jsou to ty Irdorathské sínê?";
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
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Co jsou to ty Irdorathské sínê?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Východní chrám vzývání boha Beliara. V zemi Myrtana jsou celkem ètyâi. Ale tenhle je pravdêpodobnê nejdêsivêjší ze všech.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Asi pâed 40 lety byly znièeny chrámy tohoto strašného božstva na západê a na severu.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Stateèní rytíâi têch èasù srovnali ty mocné stavby se zemí.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //Pak se èerné hordy nepâátel staly proti pâevaze hrdinské odvahy rytíâù a paladinù bezmocnými.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Nemêlo by být pâíliš têžké znièit i ty zbylé dva chrámy a oèistit tak navždy zemi od zla.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //...ale poté, co druhý chrám padl, prostê zmizely.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(posmêšnê) Zmizely. Celé chrámy. Jo, jasnê.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Nesmêj se. Situace je vážná. Pokud Irdorathské sínê znovu nabyly své moci, pak nebude nijak snadné nepâítele porazit.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Proto ho budeš muset najít a považovat to za svùj další a ještê têžší úkol.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Uvidíme.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Podle Pyrokara jsou Irdorathské sínê ztraceným chrámem, kde uctívaèi vzývali boha Beliara. Musím jej najít."); 

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

	description	 = 	"Xardasova kniha, která byla považována za ztracenou - kde je?";
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //Xardasova kniha, která byla považována za ztracenou - kde je?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Èekal jsem, že se na to zeptáš. Ale obávám se, že ti to k nièemu nebude.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Byla magicky zapeèetêna. Ukryl jsem ji do jedné z našich podzemních skrýší. Dokonce jsme se už pokoušeli ji otevâít. Marnê.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Ten zpropadený Xardas s námi hraje špinavou hru.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Mùžu se na tu knihu podívat?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Jak je libo. Nedokážu si pâedstavit, že bys uspêl, když se to nepovedlo nejvêtším mistrùm kláštera.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Ale klidnê bêž a zkus to, Talamon ti nebude bránit.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardasova kniha Irdorathské sínê je ukryta ve sklepeních kláštera, kde ji stâeží Talamon. Mágové ji ale nedokáží otevâít - její magickou peèeã prý má na svêdomí sám Xardas."); 
	
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

	description	 = 	"Podaâilo se mi otevâít Xardasovu knihu.";
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
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //Podaâilo se mi otevâít Xardasovu knihu.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Co? Jak jsi to dokázal? Málem mê to pâivedlo k zoufalství.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas mi to prozradil.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Âekl bych, že štêstí si prostê jednou sedne i na vola, nic jiného.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Âekl bych, že štêstí si prostê jednou sedne i na vola, nic jiného.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Nevykládej nesmysly. Štêstí!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Mnê se to vùbec nedaâilo a pak je to pro nêkoho jako ty úplná hraèka...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //...proto mám o èem pâemýšlet.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Jinak. Jelikož jsi byl jediným, kdo to dokázal otevâít, asi bude nejlepší, když ti bude svêâena do péèe. Alespoà do té doby, než pâekonáme tuhle krizi.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas mi to prozradil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Á, tak je to. Jak zajímavé. Jen ve tvém vlastním zájmu doufám, že tê Xardasùv špatný vliv ještê nezkazil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Varuju tê. Nepodlehni úskokùm toho starého zla. Mohl bys toho pozdêji litovat.

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

	description	 = 	"V té knize je zmínka o tajné knihovnê.";
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
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //V té knize je zmínka o tajné knihovnê.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //O èem to mluvíš?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //O knihovnê tady za tou zdí. Trefil jsem se?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Ne. Kde jsi âíkal, že by ta knihovna mêla být?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Rozumím. Nemáš tušení. Mmh.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar o tajné knihovnê nic neví - pravdêpodobnê do ní mêl pâístup pouze Xardas."); 

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

	description	 = 	"Vím, kde hledat Irdorathské sínê.";
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
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Vím, kde hledat Irdorathské sínê.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Ten chrám je na ostrovê. Nalezl jsem námoâní mapu, na které je zachycena cesta.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //To je skvêlé. Tak to budeš potâebovat loë a posádku, aby ses mohl postavit nepâíteli.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Ale nezapomeà, že se musíš dobâe pâipravit, abys byl schopen porazit pána Irdorathu.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Kde najdu nêjakou posádku?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Tvoje posádka by mêla sestávat z mužù, kterým se dá vêâit.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Promluv si se svými pâáteli a popâemýšlej, kdo by se ti mohl hodit, až budeš na ostrovê.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Taky budeš potâebovat mága. Ale bohužel, já nemùžu nikoho z kláštera postrádat.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Budeš se muset zeptat nêjakého mága, co nežije v klášteâe.

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

	description	 = 	"Jorgen je zkušený námoâník.";
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
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen je zkušeným námoâníkem. Mohl by mi pomoci dostat se na ostrov Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Obávám se, že to nebude tak snadné.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Upsal se práci pro bratrstvo. Nesložil nám ani poplatek, ani nám nepâivedl ovci.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen musí nejprve dokonèit svou práci a pak si ho mùžeš odvést, pokud budeš mít zájem.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Jak dlouho to bude trvat?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Spotâeboval tolik zásob, kolik by novicovi staèilo pâinejmenším na tâi týdny. A to za jeden den.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Takže ho nemùžu nechat jít dâív, než si v naší zahradê tvrdê odpracuje tâi mêsíce.

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

	description	 = 	"Co musím udêlat, abych si mohl Jorgena odvést hned teë?";
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
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //Co musím udêlat, abych si mohl Jorgena odvést hned teë?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Mmh. Samozâejmê, je tu jedna vêc, kterou bys mohl udêlat. Mohly by ti s tím pomoci tvé dobré vztahy s Xardasem.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Všiml jsem si, že se posledních pár dní dêjí na jeho vêži divné vêci.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Mnoho lidí âíká, že odtamtud v noci vycházejí rùzné skâeky a že nad jeho vêží tancují divná svêtla.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Jako bychom nemêli dost svých vlastních starostí. Bêž zjistit, co se tam dêje, a zaâië, aã to pâestane.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Pak dostaneš Jorgena.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"V Xardasovê vêži se dêjí divné vêci. Pokud se o nê postarám, mohu vzít Jorgena s sebou.");
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

	description	 = 	"Považuj tu vêc s Xardasovou vêží za vyâízenou.";
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
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Považuj tu vêc s Xardasovou vêží za vyâízenou.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Tak co se tam dêlo... ne, poèkej, radši to nechci vêdêt.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Jestli poâád chceš Jorgena, tak bêž a vezmi ho s sebou na tu svou cestu.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Nechã tê Innos ochraàuje.
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
	description	 = 	"Proroctví se zmiàuje o posvátné Innosovê auâe.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //Proroctví se zmiàuje o posvátné Innosovê auâe.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //Innosova aura je amulet, který smêjí nosit jen nejvêtší mágové své doby.
	
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
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Cože? Co s ním chceš dêlat?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Postavit se drakovi.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Ano, samozâejmê. Dám ti ten amulet, ale zacházej s ním opatrnê.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Jo, jasnê.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Nerad bych jej musel pozdêji vykupovat od nêjakého kupce.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Používej ho moudâe, a nechã tê Innos stále ochraàuje.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Co je to za amulet?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Âíká se, že ho ukul sám Innos a dal jej lidstvu jako dar.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Ochraàuje toho, kdo jej nosí, pâed jakoukoliv újmou.
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
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Innosovy slzy jsou jen souèástí staré báchorky pro dêti. Vypráví o tom, jak na poèátku èasù zaèala bitva mezi Innosem a Beliarem.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Aha.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Našel jsem tenhle lektvar.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Aha.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Nevím, jestli si jsi plnê vêdom toho, jaká je naše situace, ale têžko dokážu uvêâit tomu, že bys doufal, že nepâítele porazíme pohádkou pro dêti.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Našel jsem tenhle lektvar.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //To není možné. Tomu nemùžu uvêâit.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Co se dêje?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Pokud jsou tohle skuteèné Innosovy slzy, pak...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(skoèí do âeèi) Têžko.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Nepâerušuj mê. Pokud jsou tohle skuteèné Innosovy slzy, pak máme proti našemu nepâíteli mocnou zbraà.
	
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
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Když si Innos uvêdomil, že aby zachránil svêt, musí bojovat proti Beliarovi, svému vlastnímu bratrovi, byl jeho zármutek nevyslovitelný.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Zaèal plakat a jeho slzy spadly dolù na svêt. Bylo jich mnoho, protože jeho srdce bylo tak plné zármutku, že plakal celých 13 let.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Jdi pâímo k vêci.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Všechny, kdo tyto slzy našli a okusili je, rázem naplnila nadpâirozená síla a bystrost. Poznali moudrost Innosova stvoâení a zaèali mu sloužit.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Byli to první èlenové Spoleèenstva ohnê. Ty slzy jim daly sílu, odvahu a moudrost. Ale to už bylo velice dávno, a už více než 250 let nikdo Innosovy slzy nespatâil.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Co myslíš tou "zbraní"?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Legenda vypráví, že pod vlivem této látky dokázali Innosovi váleèníci vykonávat témêâ nadlidské skutky.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Nedotkla se jich žádná únava a byli silní jako dva medvêdi.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Nejvêtší hrdinské èiny starých dnù bylo možné vykonat jen s pomocí Innosových slz.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Rozumím.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Avšak ty slzy mohou pâinést také utrpení a smrt. Tento lektvar mohou pít jen èlenové našeho âádu.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Kohokoliv jiného - dokonce i paladiny našeho Pána - by okamžitê potkala krutá smrt.

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















































































































































