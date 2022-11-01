///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulthar_EXIT   (C_INFO)
{
	npc         = KDF_502_Ulthar;
	nr          = 999;
	condition   = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Ulthar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
	
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_GREET		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_GREET_Condition;
	information	 = 	DIA_Ulthar_GREET_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&&(!Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_GREET_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_GREET_05_00"); //Hleëme, pâed nejvyšší radou stojí nový novic. Innos tę doprovázej, synu.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_01"); //Co je pâesnę úkolem nejvyšší rady?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_02"); //Naší povinností je hlásat vůli Innosovu. Jsme to tedy my, kdo označuje novice vyvolené ke zkoušce magie.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_03"); //Ačkoliv žijeme v ústraní, sledujeme svętské záležitosti, neboă církev Innosova pâedstavuje nejvyšší pozemský zákon.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_04"); //Ach, takže vás zajímá, co se dęje ve svętę.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_05"); //Co si tedy myslíte o tęch dracích, co se usadili v Hornickém údolí, a o jejich armádę, která roste den za dnem?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_06"); //Chápu, že jsi rozčilený, ale než se rozhodneme nęco podniknout, musíme vše důkladnę zvážit.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_07"); //Kdybychom se teë nechali unést, ničeho bychom nedocílili. Takže splŕ to, co máš pâikázáno - a my probereme, co je zapotâebí udęlat.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_MAGETEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_MAGETEST_Condition;
	information	 = 	DIA_Ulthar_MAGETEST_Info;
	description	 = 	"Povęz mi o zkoušce magie.";
};
func int DIA_Ulthar_MAGETEST_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_GREET)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_MAGETEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_MAGETEST_15_00"); //Povęz mi o zkoušce magie.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_01"); //Je to šance pro vybrané novice vstoupit do společenstva mágů. Zkoušku ovšem může splnit jen jeden.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_02"); //Novice si ke zkoušce vybírá sám Innos.
};
///////////////////////////////////////////////////////////////////////
//	Info WHEN
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_WHEN		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	3;
	condition	 = 	DIA_Ulthar_WHEN_Condition;
	information	 = 	DIA_Ulthar_WHEN_Info;
	permanent	 =  TRUE;
	description	 = 	"Kdy bude ta zkouška probíhat?";
};
func int DIA_Ulthar_WHEN_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Ulthar_MAGETEST)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_WHEN_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_WHEN_15_00"); //Kdy bude ta zkouška probíhat?
	AI_Output (self, other, "DIA_Ulthar_WHEN_05_01"); //Jakmile se dozvíme Innosovu vůli. Zpravíme o ní vybrané novice a podrobíme je zkoušce.
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_TEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_TEST_Condition;
	information	 = 	DIA_Ulthar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Jsem pâipraven podrobit se tvé zkoušce, Mistâe.";
};
func int DIA_Ulthar_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_TEST_15_00"); //Jsem pâipraven podrobit se tvé zkoušce, Mistâe.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_01"); //Nepâekvapuje mę, že znáš ten starý zákon.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_02"); //Ale pochybuji, že si uvędomuješ, jakému riziku se vystavuješ. Męj na pamęti, že nedočkavý duch zkouškou ohnę neprojde.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_03"); //Je to už strašnę dávno, kdy nękdo tuto zkoušku podstupoval. A je jen jediný človęk, který ji pâežil a úspęšnę složil.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_04"); //Tehdy to byl mladý ambiciózní novic, teë už dlouhou dobu zastává vysoký úâad v nejvyšší radę - mluvím o Serpentesovi.
	AI_Output (other, self, "DIA_Ulthar_TEST_15_05"); //Nebude to dlouho trvat a už nebude jediným, kdo tu zkoušku složil.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_06"); //V tom pâípadę tę už nenechám dlouho čekat. Poslouchej znęní mé zkoušky:
	AI_Output (self, other, "DIA_Ulthar_TEST_05_07"); //Vytvoâ runu ohnivého šípu. To je vše - nechă je ti Innos nápomocen.
	
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rune,LOG_RUNNING);
	B_LogEntry (TOPIC_Rune,"Ulthar mi zadal svůj úkol - musím vytvoâit runu ohnivého šípu.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_RUNNING_Condition;
	information	 = 	DIA_Ulthar_RUNNING_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_RUNNING_Condition ()
{	
	if (MIS_RUNE == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (Npc_HasItems    (other, ItRu_FireBolt) == 0)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_RUNNING_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_RUNNING_05_00"); //Svůj úkol znáš. Vęnuj se mu.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_SUCCESS_Condition;
	information	 = 	DIA_Ulthar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Vytvoâil jsem tu runu!";
};
func int DIA_Ulthar_SUCCESS_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItRu_FireBolt) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_SUCCESS_15_00"); //Vytvoâil jsem tu runu!
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_01"); //Dobrá práce, novici. Můžeš si ji nechat, je to tvoje první runa.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_02"); //Až se dostaneš do prvního kruhu ohnę, budeš ji moci používat.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_03"); //Splnil jsi svou zkoušku k mé spokojenosti.
	
	if (MIS_GOLEM == LOG_RUNNING)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	{
		AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_04"); //Ale ještę poâád pâed sebou máš nebezpečný úkol, který pro tebe nachystal Serpentes!
	};
	
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP (XP_RUNE);
	
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Ulthar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP3_EXIT_Condition;
	information	= DIA_Ulthar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermAbKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_PermAbKap3		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  99;
	condition	 = 	DIA_Ulthar_PermAbKap3_Condition;
	information	 = 	DIA_Ulthar_PermAbKap3_Info;
	permanent	 = 	TRUE;
	description  =  "Co je nového?";
};
func int DIA_Ulthar_PermAbKap3_Condition ()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Ulthar_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_PermAbKap3_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_PermAbKap3_15_00"); //Co je nového?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_01"); //Momentálnę nic. Bęž a splŕ své úkoly. Ještę toho máš dost na práci.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_02"); //Ne. Nic, co bys už sám nevędęl, bratâe.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineVergiftet
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SCHREINEVERGIFTET		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important	 = 	TRUE;
};

func int DIA_Ulthar_SCHREINEVERGIFTET_Condition ()
{
	if (Pedro_Traitor == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info ()
{
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_00"); //Ještę jedna vęc. Nepâítel znesvętil nękteré ze svatyŕ podél cest, které byly zasvęceny Innosovi. Pâišly o své magické požehnání.
			AI_Output			(other, self, "DIA_Ulthar_SCHREINEVERGIFTET_15_01"); //Chápu. A dál?
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_02"); //Je na tobę, abys ty svatynę očistil, aby se situace ještę nezhoršovala.
			CreateInvItems (self, ItMi_UltharsHolyWater_Mis, 1);									
			B_GiveInvItems (self, other, ItMi_UltharsHolyWater_Mis, 1);	
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_03"); //Vezmi si tuto svęcenou vodu a pokrop s ní základy svatynę.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_04"); //S pomocí svatých slov získá svatynę opęt svou starou moc.

			if ((Npc_HasItems (other,ItWr_Map_Shrine_MIS))==FALSE)
			{
				if ((Npc_HasItems (Gorax,ItWr_Map_Shrine_MIS)))
				&& ((Npc_IsDead(Gorax))== FALSE)
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_05"); //Gorax ti prodá mapu, na které jsou vyznačené naše svatynę.
				}
				else
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_06"); //Tady máš mapu. Jsou na ní vyznačené svatynę.
					CreateInvItems (self, ItWr_Map_Shrine_MIS, 1);									
					B_GiveInvItems (self, other, ItWr_Map_Shrine_MIS, 1);					
				};
			};

			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_07"); //Teë bęž a splŕ svůj úkol.
			MIS_Ulthar_HeileSchreine_PAL = LOG_RUNNING;	
			
			Log_CreateTopic (TOPIC_Ulthar_HeileSchreine_PAL, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL, LOG_RUNNING);
			B_LogEntry (TOPIC_Ulthar_HeileSchreine_PAL,"Ulthar mi nakázal, abych jeho svęcenou vodou očistil všechny svatynę, které nepâítel poskvrnil."); 
			
			AI_StopProcessInfos (self);
		}
		else
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_08"); //Ještę jedna drobnost. Drž se dál od svatyní stojících podél cest. Slyšeli jsme, že nękteré z nich byly znesvęceny.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_09"); //Nikdo netuší, jakou moc teë mohou mít.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_10"); //Vyâešit tento problém není tvoje starost. Postarají se o to paladinové.
			AI_StopProcessInfos (self);
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheilt		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheilt_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheilt_Info;

	description  = 	"Očistil jsem všechny svatynę.";
};

func int DIA_Ulthar_SchreineGeheilt_Condition ()
{
	if (MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheilt_Info ()
{
	AI_Output			(other, self, "DIA_Ulthar_SchreineGeheilt_15_00"); //Očistil jsem všechny svatynę.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_01"); //Výbornę, můj synu. Jsem na tebe hrdý. Nechă tę Innos stále doprovází.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_02"); //Vezmi si tento Amulet síly, mohl by se ti v bitvách proti nepâíteli hodit.
	CreateInvItems (self, ItAm_Dex_Strg_01, 1);									
	B_GiveInvItems (self, other, ItAm_Dex_Strg_01, 1);
	B_GivePlayerXP (XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP4_EXIT_Condition;
	information	= DIA_Ulthar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheiltNoPAL
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheiltNoPAL		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important	 = 	TRUE;

};

func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition ()
{
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)|| (hero.guild == GIL_KDF))
	&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info ()
{
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_00"); //Dobré zprávy. Svatynę podél cest byly očištęny. Innosova síla pomohla paladinům smést tenhle problém ze zemského povrchu.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_01"); //Opęt můžeš Innosovi obętovat bez obav a bez výhrad.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP5_EXIT_Condition;
	information	= DIA_Ulthar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Ulthar_KAP6_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP6_EXIT_Condition;
	information	= DIA_Ulthar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulthar_PICKPOCKET (C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 900;
	condition	= DIA_Ulthar_PICKPOCKET_Condition;
	information	= DIA_Ulthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ulthar_PICKPOCKET_Condition()
{
	C_Beklauen (74, 320);
};
 
FUNC VOID DIA_Ulthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_BACK 		,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
	
func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
































 
























