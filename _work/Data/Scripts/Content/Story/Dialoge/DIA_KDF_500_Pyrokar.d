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
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Tak ty jsi ten nový novic. Dobrá, pâedpokládám, že už tę s tvými povinnostmi obeznámil otec Parlan.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(lehce káravę) Víš, že každý člen Společenstva ohnę by męl své povinnosti plnit v souladu s Innosovou vůlí.
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
	description	 =  "Musím mluvit s paladiny. Dost to spęchá.";
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
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //Musím mluvit s paladiny. Dost to spęchá.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //A âekneš nám, proč s nimi chceš mluvit?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Mám pro nę důležitou zprávu.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //Co by to jako męlo být za zprávu?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //V Hornickém údolí se shromažëuje armáda zla vedená draky! Musíme je zastavit, dokud můžeme.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Hm. Budeme o tvých slovech pâemýšlet, novici. Až nadejde čas, dáme ti vędęt, jak rada rozhodla.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Mezitím by sis męl lépe hledęt povinností novice.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //Dobrá, už tę nebudeme déle zdržovat od tvé práce - můžeš jít.
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
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //Amulet si sám vybírá svého majitele - nikdo, kromę toho, komu je to pâedurčeno, ho není schopen nosit.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Jsem ochotný to zkusit.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //Povinnosti novice tę mají naučit pokoâe - ne žádostivosti.
	
 	B_LogEntry (TOPIC_INNOSEYE, "Nemyslím, že by to bylo tak tęžké, ale Pyrokar mi Oko dobrovolnę a bez pomoci paladinů nevydá.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //Dobrá, už tę nebudeme dále zdržovat od tvé práce - můžeš jít.
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

	description	 = 	"Nękteâí khorinidští občané záhadnę zmizeli.";
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
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Pár khorinidských obyvatel nevysvętlitelnę zmizelo.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //To je mi známo a je to velmi politováníhodné. Ale dohodli jsme se s mágy vody, že se v této záležitosti nebudeme nijak angažovat.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //To samé platí o vyšetâování tęch podivných zemętâesení v severovýchodních oblastech Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Zatím jsme nedostali žádnou zprávu, že by potâebovali naši pomoc, takže v téhle vęci nesmíme podniknout nic.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Ano, ale...
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //Žádné ale! Budeme postupovat, jak se sluší, a doufám, že se podle toho budeš chovat i TY.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Ohniví mágové sice ztracených občanů litují, ale tvrdí, že tyto vęci mají na starosti mágové vody. V klášteâe mi v této vęci nijak nepomohou."); 

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
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(rozzlobenę) Poslušnost patâí mezi ctnosti, kterých se máš ještę co učit. Aă tak, či tak.
	
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
	description	 = 	"Chtęl bych podstoupit zkoušku ohnę.";
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
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Chtęl bych podstoupit zkoušku ohnę.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(pâekvapenę) Tak ty o tom víš... ty chceš podstoupit zkoušku ohnę?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Ano, pročetl jsem si Právo ohnę, kde se âíká...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(pâíkâe pâeruší) My známe Právo ohnę. Taky jsme ale vidęli mnoho noviců bęhem toho testu zemâít. Męl bys své rozhodnutí ještę zvážit.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //To jsem už udęlal. Chci tu zkoušku - a jsem pâipraven jí projít.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(varovnę) Když na tom bezpodmínečnę trváš, tak tę Rada k té zkoušce pâizve.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Trvám na tom, abych byl pâizván ke zkoušce ohnę.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //V tom pâípadę - aă je po tvém. Až budeš pâipraven, dostaneš od každého člena Rady úkol, jejž musíš splnit.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Nechă se Innos slituje nad tvou duší.
	
	B_LogEntry (TOPIC_FireContest,"Požádal jsem Pyrokara o zkoušku ohnę. Nyní musím splnit tâi úkoly, které mi zadá nejvyšší rada.");
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
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //A jedinę Innos sám ví, jestli jí projdeš. Podstupuješ stejnou zkoušku, jaká je určena vyvoleným novicům.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //Zkouška magie. (odmęâenę) Asi víš, že zkouškou může projít pouze jeden jediný novic.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //To vím. Tak kdo jsou moji soupeâi?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //Innos ve své moudrosti vybral tâi novice, kteâí se také chystají projít testem: Agon, Igaraz a Ulf. Už začali s hledáním.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(úsečnę) Ale dost už o tom! Slyš slova této zkoušky: 'Následuj Innosova znamení a dones nám, co vęâící nalezl na konci cesty.'
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Budeš potâebovat tenhle klíč.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //To je vše, co ti k tomu âekneme.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar pro mę pâipravuje zkoušku magie - stejnou jako je ta, kterou podstoupí zvolení novicové Ulf, Igaraz a Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Musím následovat Innosova znamení a pâinést to, co vęâící najde na své cestę. Dostal jsem k tomu i klíč.");
	
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
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //Co tady ještę postáváš? Bęž se vypoâádat se svou zkouškou!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Nadešel čas porovnat tvá velká slova s tvými skutky. Nemyslíš, novici?
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
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(nevęâícnę) Ty... dokázal jsi to?! Sledoval jsi znamení a objevil ukrytý portál...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //...a taky jsem porazil všechna ta stvoâení, co mę považovala za pâíjemnou svačinku.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //A co ostatní novicové? Co Agon? Neuspęl dâív než ty?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Neobstáli. Pâedpokládám, že jim zkouška nebyla pâedurčena.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //Dobrá, takže vyhlásíme, že jsi prošel zkouškou. A ten runový kámen si můžeš ponechat.
	 
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
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //...ale ještę musíš splnit Uthlarův úkol.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //...ještę musíš dokončit Serpentův test.
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
	description	 = 	"A budu teë pâijat do společenstva mágů?";
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
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //A budu teë pâijat do společenstva mágů?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Dokázal jsi to. Prošel jsi zkouškou ohnę. Celou dobu jsme si tvým úspęchem byli jistí.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(neústupnę) Tak jako je jisté, že ze sebe vydáš to nejlepší, aby ses mohl stát ctihodným služebníkem Innose.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Takže pokud jsi pâipraven složit Pâísahu ohnę, pâijmeme tę mezi sebe jako mága.
	
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
	description	 = 	"Jsem pâipraven vstoupit do kruhu ohnę.";
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
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Jsem pâipraven vstoupit do kruhu ohnę.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //Dobrá, tak slož posvátnou Pâísahu ohnę.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(vážnę) Pâísaháš pâed Innosem, který je naším Všemohoucím, jeho služebníky a Svatým plamenem...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //...že od nynęjška navždy bude celý tvůj život zasvęcen ohni...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //...dokud tvé tęlo a tvá duše nenalezne odpočinku v jeho svatých komnatách a plamen tvého života nevyhasne?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Pâísahám.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Vyâčením slov pâísahy jsi vstoupil do svazku s ohnęm.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Nos tuto róbu jako symbol vęčného pouta.
	
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
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Teë, když jsme tę pâijali mezi nás, si můžeš promluvit s lordem Hagenem, nejvyšším velitelem paladinů.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Rovnęž bychom velmi rádi vędęli, jak on hodnotí situaci. Takže je ti dovoleno odejít do Khorinidu.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Očekáváme, že nám odpovęë doneseš neprodlenę.
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
	description	 = 	"Co se mohu naučit teë?";
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
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Co všechno se teë můžu naučit?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //Hlavnę máš teë právo dozvędęt se vše, co se týká magických kruhů. Dají ti moc, kterou budeš potâebovat k používání magických run.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Čím vyššího magického kruhu dosáhneš, tím silnęjší kouzla budeš moci používat.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Od bratrů v klášteâe se můžeš naučit magickým formulím. Každý z nich se zamęâuje na určitou oblast, o které tę může hodnę naučit.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Napâíklad Karras je mistrem vzývání a vyvolávání. Hyglas tę zase zasvętí do ohnivé magie.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Nikdo toho o síle mrazu neví víc než Marduk. Parlan tę může naučit všechna ostatní zaklínadla - a zasvętí tę do prvních kruhů.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Ale mohou tę naučit jen magickým formulím - runy si budeš muset vyrobit sám.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"Mistr Parlan mę uvede do prvních magických kruhů.");
	
	B_LogEntry (Topic_KlosterTeacher,"Bratr Karras vyučuje formule pro invokační a vyvolávací kouzla.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Hyglas mi pâiblíží tajemství ohnę.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Marduk mę seznámí s mocí ledu a bouâí.");
	B_LogEntry (Topic_KlosterTeacher,"Bratr Parlan vyučuje různé další formule.");
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
	description	 = 	"Chtęl bych vyslovit své pâání.";
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
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Chtęl bych vyslovit jedno pâání.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Poté, co je každý mág pâijat do Společenstva, má právo prvního skutku.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //Tak co udęláš jako první vęc v roli mága?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Nic.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Nechă se novým klášterním zahradníkem stane Babo.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Aă má novic Opolos pâístup do knihovny.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Kdyby tak Dyrian zůstal i nadále v klášteâe.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Nic.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(užasle) Tak tedy budiž. Nový mág se vzdal svého činu.
	
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
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Aă novic Dyrian zůstane v klášteâe.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Jak si pâeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Novicovi bude dovoleno zůstat v klášteâe a bude zastávat funkci zahradníka, která je právę k dispozici.
	
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
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Aă se novic Babo stará o klášterní zahradu.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Jak si pâeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Novicovi Babovi se s okamžitou platností svęâuje do péče klášterní zahrada.
	
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
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Aă má novic Opolos pâístup do knihovny.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Jak si pâeješ.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //Odteë může novic Opolos studovat Innosovo písmo.
	
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
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Mám zprávy od lorda Hagena. Požaduje důkazy o pâítomnosti draků a armády zla.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Takže vyrazím do Hornického údolí a pâinesu jim ten důkaz.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Dobrá. Tak tedy splŕ tento úkol. Paladin Sergio tę doprovodí do průsmyku.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Nechă tę Innos ochraŕuje.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Takže vyrazím pâímo do Hornického údolí.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Dobrá. Jelikož cestu do Hornického údolí už znáš, nebudeš potâebovat žádný doprovod.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Postarej se o tu záležitost pro lorda Hagena - nechă tę Innos provází.
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
	description	 = 	"Nauč mę poslední magický kruh.";
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
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Nauč mę poslední magický kruh.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Uplynulo mnoho času od chvíle, co jsi vstoupil do svazku s ohnęm. Pâihodilo se mnohé a na odpočinek nikdy nebylo pâíliš času.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Jsi Innosovým vyvoleným. Proto budeš potâebovat všechnu svou sílu, abys obstál ve všech nadcházejících bitvách.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Teë se ode mę dočkáš zasvęcení, vyvolený. Vstupuješ do šestého kruhu - šiâ svętlo a rozptyluj temnotu.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Nyní se ode mę můžeš naučit magické formule posledního kruhu. Pokud po tom tedy toužíš.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Ach. A ještę jedna vęc - chvíli mi trvalo, než jsem tę poznal.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Męl jsi u sebe ten dopis, co ti dali, když tę uvrhli za bariéru.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Ano, ušetâil jsi mi tak spoustu tęch soudních âečí.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //A ty jsi Innosovým vyvoleným.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //Pâijmi teë ode mę požehnání, ó vyvolený!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innosi, svętlo slunce a ohni svęta, požehnej tomuto muži, tvému vyvolenému služebníkovi.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dej mu odvahu, sílu a moudrost, aby mohl pâijmout cestu, kterou jsi mu zvolil.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Čas ještę nenadešel. Jakmile po cestę, kterou ti Innos ukazuje, dojdeš trochu dál, pak tę začnu učit.
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
	description	 = 	"Instruuj mę (vytvoâení run)";
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
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Nauč mę nęčemu.
	
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
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //Není nic dalšího, čemu bych tę mohl ještę naučit.
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
	description	 = 	"Posílá mę Parlan.";
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
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Posílá mę Parlan. Chtęl bych posílit svoji magickou moc.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Dobrá, už ses dost naučil a značnę jsi zesílil. Odteë se budeš učit ode mę.
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
	description	 = 	"Chtęl bych posílit svoji magickou moc.";
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
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Chtęl bych posílit svoji magickou moc.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Cítím, že tebou magická moc prochází v plné síle. Dokonce už nejsem schopen ti ukázat, jak bys ji mohl ještę více posílit.
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
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Nechă je tvá poslední bitva proti našemu arcinepâíteli korunována úspęchem. Innos buë s tebou.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Nechă je Innos s tebou a zažehná všechny pekelné cesty, které se ti otevâou.
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
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //To už jsme se dozvędęli od Miltena - ale co královský náklad rudy?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //Doly, ve kterých se tęžilo pro Garonda, nemohou uspokojit královy požadavky.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Dny jsou stále zastâenęjší a sluneční svętlo slábne.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Byl jsem napaden muži v černých kápích.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Já vím. To jsou Pátrači. Nohsledi z Beliarovy podsvętní âíše. Snaží se nad tebou získat moc.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Jakmile se tę zmocní, už to nebudeš ty. Jedinę tady v klášteâe ti pak bude pomoci. Takže buë opatrný.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar mi vyprávęl o pátračích, mužích v černých hábitech, kteâí jsou Beliarovými nohsledy. Varoval mę, že dokáží ovládat a posednout druhé. Mám se vrátit pâímo do kláštera, kdyby se mi to náhodou stalo také."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Požádal jsem Karrase, aby se na tu záležitost podíval. Určitę brzy dojde k nęčemu, co nám dopomůže k lepšímu pochopení toho všeho.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar nakázal Karrasovi, aby se vypoâádal s hrozbou pátračů."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Tady - pokud budeš potâebovat naši pomoc, pâenese tę tahle runa pâímo do kláštera.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Pamatuj, musíme zůstat ostražití, nebo budeme odsouzeni k záhubę.

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
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Vidím, že tę lord Hagen povęâil údęlem nést Innosovo oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Bojím se, že tę musím zklamat. Stali jsme se obętí zrádného spiknutí nepâítele.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Innosovo oko bylo násilnę odebráno z tęchto svatých zdí.

	
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

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //Zlo je vychytralé a vždycky pracuje v utajení. Jen velmi vzácnę se ti podaâí odhalit jeho intriky na denním svętle.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Ale v tęchto dnech je to jiná vęc. Nepâítel se ukazuje zcela otevâenę na ulicích, v každém domę a na každém námęstí.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //To může znamenat jen to, že už se nebojí žádného nepâítele a nezastaví se pâed ničím.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Jeden z našich vęrných následovníků, kandidát na nositele róby vyvolených mágů ohnę, nečekanę zmęnil pâedmęt své vęrnosti a propadl obyčejům zla. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //Nepâítel se zmocnil jeho mysli a pâivedl nás tak ke strašné prohâe.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro se probil našimi nejsvatęjšími komnatami a ukradl Oko.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Bojím se, že trávil pâíliš mnoho času o samotę mimo klášter, a tedy mimo dosah jeho ochranných zdí. Vystavoval se tak mnohému nebezpečí.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "No to jsem si mohl myslet. Trochu jsem se opozdil a ti zabednęnci z kláštera zatím dopustili, aby jim nęjaký novic pâímo pâed nosem vyfoukl Innosovo oko. Teë mi nezbývá nic jiného, než jít po tom zrádci Pedrovi a doufat, že je ještę nikomu neprodal.");
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

	description	 = 	"Máte tušení, kam ten zlodęj utekl?";
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
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //Máte tušení, kam ten zlodęj utekl?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro zneškodnil nękolik dalších noviců, kteâí se ho pokoušeli zastavit, a zmizel v ranní mlze.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Už se za ním vydalo mnoho noviců, aby mohli Oko vrátit v poâádku na své místo.
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
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Padlo do rukou tęch odporných zrůd. Stejnę jsem už pâišel pozdę.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Pâipravovali tam nahoâe v lesích podivné zaklínadlo pro nęjaký męsíční rituál.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Innos s námi. Znesvętili náš kruh Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Ani ve svých nejhorších nočních můrách jsem si nikdy nepâedstavoval, že si osvojí takovou moc.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "Co budeme dęlat teë?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //Co budeme dęlat teë?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //Nepâítel se stal velmi silným. Ještę stále však pro nęj tenhle artefakt pâedstavuje mocnou hrozbu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Musíme Innosovo oko opravit a navrátit mu jeho starou sílu. Ale čas je proti nám.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Nedokážu si pâedstavit, co se s námi všemi stane. Bez ochrany Oka jsme nepâíteli vydáni na milost.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Zajdi do męsta za Vatrasem, vodním mágem. Za tęchto strašných okolností si bude vędęt rady jedinę on. Vezmi Oko k nęmu a pospęš si.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Proč Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "Proč kruh Slunce?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar chce, abych ve męstę poprosil o radu mágy vody a otázal se jich, co dęlat s poškozeným Okem.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //Proč právę za Vatrasem?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //Privilegium nosit róbu tę ještę neopravŕuje k tomu, aby ses vyptával na důvody mých instrukcí, bratâe.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras je Adanův služebník. Vędomosti toho vodního mága nám vnesou trochu svętla do tohoto temného času.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //To je vše, co potâebuješ vędęt.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //Proč kruh Slunce?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Každoročnę se v čase slunovratu všichni mágové a novicové kláštera vydávají na cestu na toto místo, aby zde pâivítali počátek nového cyklu.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //To místo zaplŕuje nesmírná moc Slunce.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //Nikdy jsem ani nepomyslel na to, že by tato moc mohla být zvrácena. A teë se právę tohle stalo.
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
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Výbornę. Kde je?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Pâipravuje ve slunečním kruhu rituál potâebný k opravę Innosova oka.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Pokud je to pravda, tak nám ještę možná zůstala jiskâička nadęje.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras chce, abyste mu s tím ty a Xardas pomohli.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //CO? Xardas tam bude taky? To nemůžeš myslet vážnę.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Hele. Já o tom nerozhodl. Požaduje to Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Poâád ten Xardas. Už mę začíná unavovat. Jen tęžko to mohlo dopadnout hůâ.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //Jak mám vędęt, že Xardas není ve spolku s nepâítelem?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //Nemůžu Xardasovi vęâit a je jedno, jak moc ho potâebujeme.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Je mi líto, ale za tęchto okolností nemohu Vatrasovi pomoci.
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

	description	 = 	"Ale bez tebe to nepůjde...";
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
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Bez tebe to nepůjde. Vatras není schopen ten rituál jinak pâipravit.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Budeš muset Xardasovi vęâit.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //Nemůžu nic dęlat, slyšíš? Nemám ani nejmenší důkaz toho, že Xardas nepracuje proti nám. Nemůžu to udęlat.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //A co když ti nęjaký důkaz seženu?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Bojím se, že to je nemožné. To by mę opravdu pâekvapilo.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //A mám značné pochybnosti o tom, že by mę Xardas ještę mohl nęčím pâekvapit. I pâi jeho nevypočitatelnosti.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar má z Xardase poâádný strach. Musím s Xardasem prodiskutovat, jak ho pâimęt k účasti na rituálu kruhu Slunce.");
	
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //Je to symbol jeho důvęryhodnosti.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Ukaž mi to.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(vzrušenę) Ale to je neuvęâitelné. Máš ty vůbec ponętí, co je to, cos mi právę dal?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Ehm. Ne.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(podráždęnę) Tohle je starobylá, velmi dlouho ztracená kniha z časů dávno minulých.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Męli jsme za to, že je ztracena jednou provždy, ale teë vidím, že Xardas celou tu dobu vędęl, co se s ní stalo.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Takže souhlasíš s tím rituálem?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Ano, męl bych vyrazit ke slunečnímu kruhu, ale rozhodnę ne proto, že bych byl pâesvędčený o Xardasových dobrých úmyslech.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //Vlastnę se chystám z toho psa dostat vysvętlení, kde tolik let ukrýval tu knihu. Tentokrát zašel pâíliš daleko.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Uvidíme se u slunečního kruhu.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar konečnę souhlasil, že navštíví kruh slunce.");
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
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //Tęžko âíct. Počkáme a uvidíme.
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
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Jen stęží můžu uvęâit, že je nęco takového možné.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Ano, mistâe.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Už jsi mnohokrát prokázal, že jsi hoden Vyššího âádu ohnivých mágů.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //Od tohoto dne jsi členem Rady a budeš nás âád reprezentovat po celém svętę. Teë jsi jedním z vyšších ohnivých mágů.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Užívej róbu vyvolených s důstojností a pâines âádu slávu a bohatství, můj bratâe.
		
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

	description	 = 	"Co je tady ještę zapotâebí udęlat?";
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
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //Co tu ještę musím učinit?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //Neplýtvej svým časem na malichernosti. Bęž porazit draky. Tady, vezmi si Oko.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Nezapomeŕ, že musíš s drakem nejprve promluvit, než ho napadneš.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //Moc Oka pâinutí draka promluvit a âíkat pravdu.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Také ti, pokud ho máš na sobę, poskytuje ochranu proti jejich útokům.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Nicménę, moc Oka není nevyčerpatelná. Budeš ho muset doplŕovat magickou energií.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Budeš k tomu potâebovat esenci z dračího srdce, kterou můžeš s Okem spojit v alchymistické kolonę.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Jedinę pak se můžeš odvážit postavit drakovi.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Díky. Budu si to pamatovat.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Teë máš vše, co potâebuješ. Tak jdi. Už ti nezbývá mnoho času.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Teë už mohu bez obav čelit drakům - stačí si pâi boji nasadit Innosovo oko a mohu je všechny postupnę zničit. Pâed bojem si ale musím s drakem vždycky promluvit, jinak nemám šanci. Problém je, že každý takový rozhovor pâipravuje Oko o část moci. Obnovit ji mohu pouze v alchymistické kolonę s pomocí dračího srdce a prázdné laboratorní baŕky, kde s pomocí extraktu z dračího srdce mohu moc artefaktu znovu probudit. Teprve pak se mohu postavit dalšímu obludnému ještęrovi."); 

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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //Nejsem si jistý. Męl jsem dojem, že ty budeš vędęt, k čemu to je.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //Vęru, to je velmi znepokojivé. Jsem rád, žes mi to pâinesl. To od tebe bylo opravdu moudré.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Pâedpokládám, že tam toho bude víc. Bęž a najdi více tęchto knih zatracení.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Vypadá to, že je to nástroj moci Pátračů.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Používají jej k ovládání ztracených duší svých obętí.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Obvykle si do tęch knih zapisují jména tęch, kterých se chtęjí zmocnit.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Poslouchej. Dám ti tenhle magický svitek. Ukáže ti jména, která jsou zanesená do tęch knih.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Najdi ty obęti a pâines mi jejich knihy. Męl bych je sprovodit ze svęta.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Ale nejprve bys męl alespoŕ jednu z nich ukázat Karrasovi. Možná se mu bude pâi jeho studiích k nęčemu hodit.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //Neudęlej hloupost a nepokoušej se je ničit sám. Ještę nejsi schopen odolat jejich moci.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar chce zlomit moc Almanachu posedlých. Dal mi proto seznam všech, které pátrači hodlají ovládnout - postupem času se může rozrůstat o další jména."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //Nepâibližuj se k Pátračům, jinak tę proklejí.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Pokud nebudeš schopen odolávat jejich volání, vraă se ke mnę, jak nejrychleji to bude možné.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //Pouze tady v klášteâe je tvá duše v bezpečí.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //Neexistuje proti tęm mentálním útokům nęjaké ochrana?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Možné to je. Karras by o tom mohl nęco vędęt.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"S Karrasovou pomocí prý mohu najít ochranu pâed mentálními útoky pátračů."); 
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

	description	 = 	"(Vyléčit posedlost)";
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
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Vyleč mę, pane, byl jsem proklet.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //Budiž! Vezmi si tenhle lektvar. To tę zbaví tvých nočních můr.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Nechă je ti Innosova spása ochranou.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Jednej v jeho jménu a stâez se zlého nepâítelova pohledu.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Ale abych tę varoval - pokud budeš jejich vlivu vystaven pâíliš často, už pro tebe za jistých okolností nebude návratu. Vždycky na to pamatuj.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Mám dojem, že jsem byl proklet. Můžeš mę vyléčit?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //Ne bez důkazu tvého respektu k tomuto klášteru, můj synu. 300 zlatých.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "To je pâíliš.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Výbornę. Tady jsou peníze.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Ale vždyă ty ještę jeden léčivý lektvar máš. Vraă se, až budeš mou pomoc opravdu potâebovat.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Výbornę. Tady jsou peníze.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Tady, vypij tohle. Nechă je ti Innosova spása ochranou.
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

	description	 = 	"Můžu ti o tom prokletí âíct i nęco víc.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Můžu ti o tom prokletí âíct i nęco víc.
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
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Mám pro tebe tęch Spáčových knih ještę víc.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Dobrá. Nicménę se obávám, že je jich k nalezení mnohem víc. Pokračuj v hledání.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Nalezli jsme jich už mnoho. Nemyslím si však, že to jsou úplnę všechny.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Už jsi mi pâinesl spoustu tęch nepâátelských knih.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Docela by mę pâekvapilo, kdyby mezi sebou męli ještę nęjakou.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Vezmi si tohle. Je to dárek od kláštera, který ti pomůže pokaždé, když se stâetneš se zlem.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //A nezapomeŕ se jednou za čas podívat do mého magického svitku.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Je docela dobâe možné, že se pokusí to samé provést i nękomu jinému, jehož jméno jsme v tęch knihách nenašli.
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
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //To je bezesporu dobrá zpráva. Ale na situaci to nic nemęní. Vypadá to dost beznadęjnę.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Pátrači ještę poâád nezmizeli. Právę naopak. Slyšel jsem mnoho zvęstí o tom, že se posledních pár dní jejich počet ještę zvýšil.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //Vybití draků męlo nepâítele zneškodnit, ale asi to nestačilo. Musíme to zlo vyrvat i s koâeny.

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
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Innos s námi. Temný chrám znovu nabyl své síly a teë vysílá své pâisluhovače do našeho svęta.

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

	description	 = 	"Co jsou to ty Irdorathské sínę?";
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
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //Co jsou to ty Irdorathské sínę?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //Východní chrám vzývání boha Beliara. V zemi Myrtana jsou celkem čtyâi. Ale tenhle je pravdępodobnę nejdęsivęjší ze všech.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Asi pâed 40 lety byly zničeny chrámy tohoto strašného božstva na západę a na severu.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Stateční rytíâi tęch časů srovnali ty mocné stavby se zemí.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //Pak se černé hordy nepâátel staly proti pâevaze hrdinské odvahy rytíâů a paladinů bezmocnými.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Nemęlo by být pâíliš tęžké zničit i ty zbylé dva chrámy a očistit tak navždy zemi od zla.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //...ale poté, co druhý chrám padl, prostę zmizely.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(posmęšnę) Zmizely. Celé chrámy. Jo, jasnę.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //Nesmęj se. Situace je vážná. Pokud Irdorathské sínę znovu nabyly své moci, pak nebude nijak snadné nepâítele porazit.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Proto ho budeš muset najít a považovat to za svůj další a ještę tęžší úkol.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Uvidíme.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Podle Pyrokara jsou Irdorathské sínę ztraceným chrámem, kde uctívači vzývali boha Beliara. Musím jej najít."); 

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
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Čekal jsem, že se na to zeptáš. Ale obávám se, že ti to k ničemu nebude.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Byla magicky zapečetęna. Ukryl jsem ji do jedné z našich podzemních skrýší. Dokonce jsme se už pokoušeli ji otevâít. Marnę.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //Ten zpropadený Xardas s námi hraje špinavou hru.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //Můžu se na tu knihu podívat?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Jak je libo. Nedokážu si pâedstavit, že bys uspęl, když se to nepovedlo nejvętším mistrům kláštera.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Ale klidnę bęž a zkus to, Talamon ti nebude bránit.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardasova kniha Irdorathské sínę je ukryta ve sklepeních kláštera, kde ji stâeží Talamon. Mágové ji ale nedokáží otevâít - její magickou pečeă prý má na svędomí sám Xardas."); 
	
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
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //Co? Jak jsi to dokázal? Málem mę to pâivedlo k zoufalství.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas mi to prozradil.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Âekl bych, že štęstí si prostę jednou sedne i na vola, nic jiného.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Âekl bych, že štęstí si prostę jednou sedne i na vola, nic jiného.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //Nevykládej nesmysly. Štęstí!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Mnę se to vůbec nedaâilo a pak je to pro nękoho jako ty úplná hračka...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //...proto mám o čem pâemýšlet.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Jinak. Jelikož jsi byl jediným, kdo to dokázal otevâít, asi bude nejlepší, když ti bude svęâena do péče. Alespoŕ do té doby, než pâekonáme tuhle krizi.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas mi to prozradil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Á, tak je to. Jak zajímavé. Jen ve tvém vlastním zájmu doufám, že tę Xardasův špatný vliv ještę nezkazil.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Varuju tę. Nepodlehni úskokům toho starého zla. Mohl bys toho pozdęji litovat.

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

	description	 = 	"V té knize je zmínka o tajné knihovnę.";
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
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //V té knize je zmínka o tajné knihovnę.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //O čem to mluvíš?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //O knihovnę tady za tou zdí. Trefil jsem se?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //Ne. Kde jsi âíkal, že by ta knihovna męla být?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Rozumím. Nemáš tušení. Mmh.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar o tajné knihovnę nic neví - pravdępodobnę do ní męl pâístup pouze Xardas."); 

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

	description	 = 	"Vím, kde hledat Irdorathské sínę.";
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
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Vím, kde hledat Irdorathské sínę.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //Ten chrám je na ostrovę. Nalezl jsem námoâní mapu, na které je zachycena cesta.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //To je skvęlé. Tak to budeš potâebovat loë a posádku, aby ses mohl postavit nepâíteli.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Ale nezapomeŕ, že se musíš dobâe pâipravit, abys byl schopen porazit pána Irdorathu.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //Kde najdu nęjakou posádku?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //Tvoje posádka by męla sestávat z mužů, kterým se dá vęâit.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Promluv si se svými pâáteli a popâemýšlej, kdo by se ti mohl hodit, až budeš na ostrovę.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Taky budeš potâebovat mága. Ale bohužel, já nemůžu nikoho z kláštera postrádat.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Budeš se muset zeptat nęjakého mága, co nežije v klášteâe.

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
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen musí nejprve dokončit svou práci a pak si ho můžeš odvést, pokud budeš mít zájem.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //Jak dlouho to bude trvat?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Spotâeboval tolik zásob, kolik by novicovi stačilo pâinejmenším na tâi týdny. A to za jeden den.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //Takže ho nemůžu nechat jít dâív, než si v naší zahradę tvrdę odpracuje tâi męsíce.

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

	description	 = 	"Co musím udęlat, abych si mohl Jorgena odvést hned teë?";
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
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //Co musím udęlat, abych si mohl Jorgena odvést hned teë?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Mmh. Samozâejmę, je tu jedna vęc, kterou bys mohl udęlat. Mohly by ti s tím pomoci tvé dobré vztahy s Xardasem.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Všiml jsem si, že se posledních pár dní dęjí na jeho vęži divné vęci.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //Mnoho lidí âíká, že odtamtud v noci vycházejí různé skâeky a že nad jeho vęží tancují divná svętla.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Jako bychom nemęli dost svých vlastních starostí. Bęž zjistit, co se tam dęje, a zaâië, aă to pâestane.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Pak dostaneš Jorgena.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"V Xardasovę vęži se dęjí divné vęci. Pokud se o nę postarám, mohu vzít Jorgena s sebou.");
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

	description	 = 	"Považuj tu vęc s Xardasovou vęží za vyâízenou.";
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
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //Považuj tu vęc s Xardasovou vęží za vyâízenou.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Tak co se tam dęlo... ne, počkej, radši to nechci vędęt.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Jestli poâád chceš Jorgena, tak bęž a vezmi ho s sebou na tu svou cestu.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Nechă tę Innos ochraŕuje.
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
	description	 = 	"Proroctví se zmiŕuje o posvátné Innosovę auâe.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //Proroctví se zmiŕuje o posvátné Innosovę auâe.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //Innosova aura je amulet, který smęjí nosit jen nejvętší mágové své doby.
	
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
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //Cože? Co s ním chceš dęlat?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Postavit se drakovi.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Ano, samozâejmę. Dám ti ten amulet, ale zacházej s ním opatrnę.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Jo, jasnę.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //Nerad bych jej musel pozdęji vykupovat od nęjakého kupce.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Používej ho moudâe, a nechă tę Innos stále ochraŕuje.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //Co je to za amulet?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Âíká se, že ho ukul sám Innos a dal jej lidstvu jako dar.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Ochraŕuje toho, kdo jej nosí, pâed jakoukoliv újmou.
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
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Innosovy slzy jsou jen součástí staré báchorky pro dęti. Vypráví o tom, jak na počátku časů začala bitva mezi Innosem a Beliarem.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Aha.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Našel jsem tenhle lektvar.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Aha.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //Nevím, jestli si jsi plnę vędom toho, jaká je naše situace, ale tęžko dokážu uvęâit tomu, že bys doufal, že nepâítele porazíme pohádkou pro dęti.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //Našel jsem tenhle lektvar.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //To není možné. Tomu nemůžu uvęâit.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //Co se dęje?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Pokud jsou tohle skutečné Innosovy slzy, pak...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(skočí do âeči) Tęžko.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //Nepâerušuj mę. Pokud jsou tohle skutečné Innosovy slzy, pak máme proti našemu nepâíteli mocnou zbraŕ.
	
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
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Když si Innos uvędomil, že aby zachránil svęt, musí bojovat proti Beliarovi, svému vlastnímu bratrovi, byl jeho zármutek nevyslovitelný.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Začal plakat a jeho slzy spadly dolů na svęt. Bylo jich mnoho, protože jeho srdce bylo tak plné zármutku, že plakal celých 13 let.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Jdi pâímo k vęci.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Všechny, kdo tyto slzy našli a okusili je, rázem naplnila nadpâirozená síla a bystrost. Poznali moudrost Innosova stvoâení a začali mu sloužit.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Byli to první členové Společenstva ohnę. Ty slzy jim daly sílu, odvahu a moudrost. Ale to už bylo velice dávno, a už více než 250 let nikdo Innosovy slzy nespatâil.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //Co myslíš tou "zbraní"?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Legenda vypráví, že pod vlivem této látky dokázali Innosovi válečníci vykonávat témęâ nadlidské skutky.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Nedotkla se jich žádná únava a byli silní jako dva medvędi.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Nejvętší hrdinské činy starých dnů bylo možné vykonat jen s pomocí Innosových slz.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Rozumím.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Avšak ty slzy mohou pâinést také utrpení a smrt. Tento lektvar mohou pít jen členové našeho âádu.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Kohokoliv jiného - dokonce i paladiny našeho Pána - by okamžitę potkala krutá smrt.

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















































































































































