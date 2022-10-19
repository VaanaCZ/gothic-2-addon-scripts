///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Nefarius_EXIT   (C_INFO)
{
	npc         = KDW_1402_Addon_Nefarius_NW;
	nr          = 999;
	condition   = DIA_Addon_Nefarius_EXIT_Condition;
	information = DIA_Addon_Nefarius_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Nefarius_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Nefarius_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1402_Addon_Nefarius_NW;
	nr			= 900;
	condition	= DIA_Addon_Nefarius_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Nefarius_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Nefarius_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (35 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Nefarius_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Nefarius_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Nefarius_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Nefarius_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Nefarius_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Nefarius_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Nefarius_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_Windfist, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Nefarius_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Nefarius_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Nefarius_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_Hallo		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_Hallo_Condition;
	information	 = 	DIA_Addon_Nefarius_Hallo_Info;

	description	 = 	"Jak se vede?";
};

func int DIA_Addon_Nefarius_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_00"); //Jak to jde?
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_01"); //A co tu dêláš TY? Tohle je vážnê pâekvapení.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_02"); //Myslel jsem, že jsi zahynul.
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_03"); //Skoro.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_04"); //Zpùsobils tu poâádný zmatek, víš to? Jen tak matnê si vzpomínám na Saturase, který byl kvùli té záležitosti tenkrát celý bez sebe.
	
};

///////////////////////////////////////////////////////////////////////
//	Info keineahnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_keineahnung		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_keineahnung_Condition;
	information	 = 	DIA_Addon_Nefarius_keineahnung_Info;

	description	 = 	"Co je to za portál?";
};

func int DIA_Addon_Nefarius_keineahnung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Nefarius_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Nefarius_keineahnung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_keineahnung_15_00"); //Co je to za portál?
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_01"); //Pâedpokládáme, že vede do ztraceného údolí, kde kdysi stálo mêsto jedné prastaré kultury.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_02"); //Jenže kámen za portálem je velice tvrdý a nêkolik yardù silný.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_03"); //Navíc tu nejsou žádné známky teleportaèní magie. To je vážnê záhada.
};

///////////////////////////////////////////////////////////////////////
//	Info WieMechanik
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_WieMechanik		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_WieMechanik_Condition;
	information	 = 	DIA_Addon_Nefarius_WieMechanik_Info;

	description	 = 	"Víš, jak jej spustit?";
};

func int DIA_Addon_Nefarius_WieMechanik_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Nefarius_keineahnung))
		{
			return TRUE;
		};
};

func void DIA_Addon_Nefarius_WieMechanik_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_WieMechanik_15_00"); //Víš, jak to spustit?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_01"); //Jeden z chybêjících ornamentù by mêl být jistým magickým klíèem.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_03"); //Musíme ho najít, jinak se dál nedostaneme.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_02"); //Mêl by pâesnê pasovat do kulatého otvoru u portálu.
};

///////////////////////////////////////////////////////////////////////
//	Info SCbringOrnaments
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_SCbringOrnaments		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information	 = 	DIA_Addon_Nefarius_SCbringOrnaments_Info;

	description	 = 	"Pâinesl jsem ti èást ornamentu.";
};

func int DIA_Addon_Nefarius_SCbringOrnaments_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_SCbringOrnaments_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_00"); //Pâinesl jsem èást ornamentu.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_01"); //(vzrušenê) Vážnê? Tomu nemùžu uvêâit.
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_02"); //Máš ponêtí, kde jsou ostatní èásti?
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_03"); //Podle starých nápisù byl celý artefakt rozdêlen na ètyâi èásti.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_04"); //A všechny by se mêly stále nacházet kdesi na ostrovê.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_05"); //S Meridanovou pomocí jsem pâeložil nêkolik nápisù.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_06"); //Dá se z nich vyèíst, kde jsou ukryty zbývající èásti.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_07"); //Nêkterá místa jsem ti vyznaèil na mapê.
	CreateInvItems (self, ItWr_Map_NewWorld_Ornaments_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Ornaments_Addon, 1);		
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Ornament,"Vodní mágové objevili prastarý portál, který by mêl vést do zcela neprozkoumané èásti Khorinidu."); 
	B_LogEntry (TOPIC_Addon_Ornament,"Nefarius chce mechanismus portálu aktivovat nêjakým prstenem s ornamentem. Jenže mu stále chybí tâi èásti tohoto artefaktu. Proto mê povêâil, abych mu jej opatâil. Na mapê mi vyznaèil, kde bych se po jednotlivých èástech mêl poohlédnout."); 
	
	
	B_StartotherRoutine	(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_08"); //Porozhlédni se tam.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_09"); //Zvláštê se soustâeë na staré stavby. Mohou být už hodnê rozpadlé, takže je hned tak nepoznáš.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_10"); //Mùže to být vlastnê cokoliv – velký kámen, kamenný kruh, mauzoleum nebo nêco takového.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_11"); //Ale co to âíkám? Ty to najdeš. Hodnê štêstí.
};

///////////////////////////////////////////////////////////////////////
//	Info WhyPortalClosed
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_WhyPortalClosed		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information	 = 	DIA_Addon_Nefarius_WhyPortalClosed_Info;

	description	 = 	"Proè je ten ornament rozbitý?";
};

func int DIA_Addon_Nefarius_WhyPortalClosed_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Nefarius_SCbringOrnaments))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WhyPortalClosed_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_WhyPortalClosed_15_00"); //Proè byl ten ornament rozbitý?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_01"); //Aã už to udêlal kdokoliv, chtêl zabránit, aby nêkdo znovu otevâel portál.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_02"); //Èím déle pozoruji ty nápisy, tím více si uvêdomuji, že knêží té prastaré kultury vùbec nebyli hloupí.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_03"); //Mêli dobrý dùvod, proè tak peèlivê dbali, aby se do té oblasti nikdo nedostal.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_04"); //Nemáme tušení, co nás tam èeká. Ale urèitê to nebude nic dobrého.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingOrnaments
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_MissingOrnaments		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information	 = 	DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co se týèe têch chybêjících ornamentù...";
};

func int DIA_Addon_Nefarius_MissingOrnaments_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int MissingOrnamentsCounter;
const int Addon_NefariussMissingOrnamentsOffer = 100; //Joly:Kohle für ein Ornament

func void DIA_Addon_Nefarius_MissingOrnaments_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_00"); //Co se týèe têch chybêjících ornamentù...
	AI_Output	(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_01"); //(netrpêlivê) Ano?

	if (Npc_HasItems (other,ItMi_Ornament_Addon) >= 1)
	{
			var int MissingOrnamentsCount;
			var int XP_Addon_BringMissingOrnaments;
			var int MissingOrnamentsGeld;
			var string concatText;
			
			MissingOrnamentsCount = Npc_HasItems(other, ItMi_Ornament_Addon);
		
		
			if (MissingOrnamentsCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_02"); //Tady, mám ještê jeden.
					B_GivePlayerXP (XP_Addon_BringMissingOrnament);
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	1);
					AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
					MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_03"); //Našel jsem je.
		
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	MissingOrnamentsCount);
					concatText = ConcatStrings(IntToString(MissingOrnamentsCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
					AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		
					XP_Addon_BringMissingOrnaments = (MissingOrnamentsCount * XP_Addon_BringMissingOrnament);
					MissingOrnamentsCounter = (MissingOrnamentsCounter + MissingOrnamentsCount); 
		
					B_GivePlayerXP (XP_Addon_BringMissingOrnaments);
				};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_04"); //To je fantastické.
		
			if (MissingOrnamentsCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_05"); //Teë už chybêjí jen dva. Snad je taky najdeš.
			}
			else if	(MissingOrnamentsCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_06"); //Ještê jeden a už budeme mít všechny.
			}
			else
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_07"); //Tak teë už máme všechny. Zbývá jen složit je dohromady.
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_08"); //Budeme muset spojit síly a promênit ornament opêt v prsten.
		
				MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
			};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_09"); //Tumáš, dám ti za tu námahu pár zlaãákù.
		
			MissingOrnamentsGeld	= (MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer);
		
			CreateInvItems (self, ItMi_Gold, MissingOrnamentsGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, MissingOrnamentsGeld);
		
			if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_10"); //Pojë za mnou!
				AI_StopProcessInfos (self);
				Npc_ExchangeRoutine	(self,"PreRingritual");
				B_StartotherRoutine	(KDW_1400_Addon_Saturas_NW,"PreRingritual");
				B_StartotherRoutine	(KDW_1401_Addon_Cronos_NW,"PreRingritual");
				B_StartotherRoutine	(KDW_1403_Addon_Myxir_NW,"PreRingritual");
				B_StartotherRoutine	(KDW_1404_Addon_Riordian_NW,"PreRingritual");
				B_StartotherRoutine	(KDW_1405_Addon_Merdarion_NW,"PreRingritual");
			};
	}
	else
	{
			AI_Output (other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_11"); //Mùžeš mi prosím ještê zopakovat, kolik jich je?
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_12"); //Celkem ètyâi.
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_13"); //Ty další by mêly být v místech, která jsem ti vyznaèil na mapê.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Ringritual
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_Ringritual		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_Ringritual_Condition;
	information	 = 	DIA_Addon_Nefarius_Ringritual_Info;

	important	 = 	TRUE;
};

func int DIA_Addon_Nefarius_Ringritual_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
	&& (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Nefarius_Ringritual_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Nefarius_Ringritual_05_00"); //Tady. A teë odstup.
	Npc_SetRefuseTalk (self,60); 
	RitualRingRuns = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_Ornament,"Pâinesl jsem Nefariovi všechny tâi èásti ztraceného prstenu s ornamentem. Vodní mágové jej nyní opêt složí dohromady."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ringritual");
	B_StartotherRoutine	(KDW_1400_Addon_Saturas_NW,"Ringritual");
	B_StartotherRoutine	(KDW_1401_Addon_Cronos_NW,"Ringritual");
	B_StartotherRoutine	(KDW_1403_Addon_Myxir_NW,"Ringritual");
	B_StartotherRoutine	(KDW_1404_Addon_Riordian_NW,"Ringritual");
	B_StartotherRoutine	(KDW_1405_Addon_Merdarion_NW,"Ringritual");
};

///////////////////////////////////////////////////////////////////////
//	Info RingRitualEnds
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_RingRitualEnds		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_RingRitualEnds_Condition;
	information	 = 	DIA_Addon_Nefarius_RingRitualEnds_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Nefarius_RingRitualEnds_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
	&& (RitualRingRuns == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Nefarius_RingRitualEnds_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_00"); //Ornament byl znovu scelen.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_01"); //Když už jsi nám pâinesl všechny potâebné souèásti, mêl bys je také zasadit do portálu.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_02"); //Zajdi za Saturasem, aã ti dá scelený prsten.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_03"); //Doufejme, že pak se portál otevâe.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít");
	B_StartotherRoutine	(KDW_1400_Addon_Saturas_NW,"Zaèít");
	B_StartotherRoutine	(KDW_1401_Addon_Cronos_NW,"Zaèít");
	B_StartotherRoutine	(KDW_1403_Addon_Myxir_NW,"Zaèít");
	B_StartotherRoutine	(KDW_1404_Addon_Riordian_NW,"Zaèít");
	B_StartotherRoutine	(KDW_1405_Addon_Merdarion_NW,"Zaèít");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry (TOPIC_Addon_Ornament,"Prsten s ornamentem je opêt celý. Musím jej od Saturase získat."); 

};

///////////////////////////////////////////////////////////////////////
//	Info OpenedPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_OpenedPortal		(C_INFO)
{
	npc		 = 	KDW_1402_Addon_Nefarius_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_OpenedPortal_Condition;
	information	 = 	DIA_Addon_Nefarius_OpenedPortal_Info;

	description	 = 	"Co teë?";
};

func int DIA_Addon_Nefarius_OpenedPortal_Condition ()
{
	if (RitualRingRuns == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Nefarius_OpenedPortal_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_OpenedPortal_15_00"); //A co teë?
	AI_Output	(self, other, "DIA_Addon_Nefarius_OpenedPortal_05_01"); //Na co èekáš? Tak bêž, aã už tê tu nevidíme.
};

