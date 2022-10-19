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

	description	 = 	"Wie sieht's aus?";
};

func int DIA_Addon_Nefarius_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_00"); //Wie sieht's aus?
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_01"); //Was machst DU denn hier? Das ist ja eine Überraschung.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_02"); //Ich dachte, man hätte dich getötet.
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_03"); //Beinahe.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_04"); //Es gab einen riesen Wirbel um dich, weißt du das? Ich habe Saturas kaum wieder erkannt, so außer sich war er wegen der Sache damals.
	
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

	description	 = 	"Was ist das für ein Portal?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_keineahnung_15_00"); //Was ist das für ein Portal?
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_01"); //Wir vermuten, dass es in das verlorene Tal führt, in dem die alte Kultur ihre Stadt gehabt haben muss.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_02"); //Aber der Stein hinter dem Portal besteht aus meterdickem, massiven Fels.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_03"); //Auch gibt es keine Anzeichen für Teleportationsmagie. Sehr mysteriös ...
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

	description	 = 	"Weißt du schon, wie man es aktiviert?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_WieMechanik_15_00"); //Weißt du schon, wie man es aktiviert?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_01"); //Eines der fehlenden Ornamente scheint eine Art magischer SCHLÜSSEL zu sein.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_03"); //Wir werden es brauchen, um weiterzukommen.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_02"); //Es muß genau in die ringförmige Vertiefung neben dem Portal passen.
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

	description	 = 	"Ich habe einen Teil des Ornament mitgebracht.";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_00"); //Ich habe einen Teil des Ornaments mitgebracht.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_01"); //(begeistert) Ja? Das ist ja großartig.
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_02"); //Hast du eine Ahnung, wo die anderen Teile sind?
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_03"); //Den alten Inschriften nach wurde es in vier Teile zerbrochen.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_04"); //Und es siehst so aus, als könnten sich die Teile immer noch auf der Insel befinden ...
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_05"); //Ich habe mit Merdarions Hilfe einige der Inschriften übersetzt.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_06"); //Dort finden sich Hinweise darauf, wo die verbliebenen Stücke sind.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_07"); //Hier. Auf dieser Karte habe ich einige Stellen markiert.
	CreateInvItems (self, ItWr_Map_NewWorld_Ornaments_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Ornaments_Addon, 1);		
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Ornament,"Die Wassermagier haben ein Portal gefunden, das in einen unerforschten Teil von Khorinis führen soll."); 
	B_LogEntry (TOPIC_Addon_Ornament,"Nefarius will mit Hilfe eines Ornamentringes den Mechanismus des Portals aktivieren. Dazu fehlen ihm noch 3 Fragmente des Ornamentringes. Ich soll sie ihm beschaffen. Er gab mir eine Karte in der die Stellen markiert sind, wo ich nach den Ornamentfragmenten suchen soll."); 
	
	
	B_StartotherRoutine	(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_08"); //Sieh dich dort um.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_09"); //Du solltest auf alte Bauwerke achten. Vielleicht sind sie schon etwas verfallen und nicht mehr klar erkennbar.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_10"); //Es könnte alles Mögliche sein. Ein großer Findling, ein Steinkreis, ein Mausoleum oder ähnliches.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_11"); //Aber, was rede ich? Du wirst es schon finden. Viel Erfolg.
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

	description	 = 	"Aus welchem Grund wurde das Ornament zerbrochen?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_WhyPortalClosed_15_00"); //Aus welchem Grund wurde das Ornament zerbrochen?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_01"); //Wer auch immer das getan hat, wollte verhindern, dass das Portal jemals wieder geöffnet wird.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_02"); //Je länger ich auf die Inschriften starre, desto mehr erkenne ich, dass die Priester der alten Kultur wahrlich keine Dummköpfe waren.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_03"); //Es gab einen guten Grund, dass sie die Region dahinter unzugänglich gemacht haben.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_04"); //Wir wissen nicht, was uns dort erwarten wird. Aber sicherlich ist es nichts Gutes ...
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

	description	 = 	"Wegen der fehlenden Ornamente...";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_00"); //Wegen der fehlenden Ornamente ...
	AI_Output	(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_01"); //(erwartungsvoll) Ja?

	if (Npc_HasItems (other,ItMi_Ornament_Addon) >= 1)
	{
			var int MissingOrnamentsCount;
			var int XP_Addon_BringMissingOrnaments;
			var int MissingOrnamentsGeld;
			var string concatText;
			
			MissingOrnamentsCount = Npc_HasItems(other, ItMi_Ornament_Addon);
		
		
			if (MissingOrnamentsCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_02"); //Hier. Ich hab noch eins.
					B_GivePlayerXP (XP_Addon_BringMissingOrnament);
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	1);
					AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
					MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_03"); //Ich hab sie gefunden.
		
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	MissingOrnamentsCount);
					concatText = ConcatStrings(IntToString(MissingOrnamentsCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
					AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		
					XP_Addon_BringMissingOrnaments = (MissingOrnamentsCount * XP_Addon_BringMissingOrnament);
					MissingOrnamentsCounter = (MissingOrnamentsCounter + MissingOrnamentsCount); 
		
					B_GivePlayerXP (XP_Addon_BringMissingOrnaments);
				};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_04"); //Das ist großartig.
		
			if (MissingOrnamentsCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_05"); //Jetzt fehlen noch zwei. Vielleicht findest du sie ja auch noch.
			}
			else if	(MissingOrnamentsCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_06"); //Eins fehlt jetzt noch, dann haben wir sie alle zusammen.
			}
			else
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_07"); //Jetzt habe ich sie alle. Jetzt müssen wir sie nur noch zusammenfügen.
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_08"); //Wir müssen mit vereinten Kräften wirken, um das Ornament wieder zu einen Ring zusammenzufügen.
		
				MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
			};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_09"); //Hier. Ich kann dir für deine Mühen einige Goldmünzen geben.
		
			MissingOrnamentsGeld	= (MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer);
		
			CreateInvItems (self, ItMi_Gold, MissingOrnamentsGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, MissingOrnamentsGeld);
		
			if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_10"); //Folge mir!
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
			AI_Output (other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_11"); //Wie viele waren es nochmal?
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_12"); //Insgesamt sind es vier ...
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_13"); //Die anderen solltest du dort finden, wo ich die Markierungen auf deiner Karte gemacht habe.
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
	AI_Output	(self, other, "DIA_Addon_Nefarius_Ringritual_05_00"); //So. Und nun geh zur Seite.
	Npc_SetRefuseTalk (self,60); 
	RitualRingRuns = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_Ornament,"Ich habe Nefarius alle Fragmente des Ornamentringes gebracht. Die Wassermagier wollen nun, den Ring wieder zusammenschweißen."); 

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
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_00"); //Das Ornament ist wieder zusammengesetzt.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_01"); //Da du uns die notwendigen Bruchstücke dafür gebracht hast, sollst du sie auch ins Portal einsetzen.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_02"); //Geh zu Saturas und lass dir den zusammengesetzten Ring geben.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_03"); //Das Portal wird sich dann hoffentlich öffnen.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartotherRoutine	(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartotherRoutine	(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartotherRoutine	(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartotherRoutine	(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartotherRoutine	(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry (TOPIC_Addon_Ornament,"Der Ornamentring ist wieder zusammengesetzt. Ich soll ihn bei Saturas abholen."); 

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

	description	 = 	"Was nun?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_OpenedPortal_15_00"); //Was nun?
	AI_Output	(self, other, "DIA_Addon_Nefarius_OpenedPortal_05_01"); //Worauf wartest du? Geh schon und mach uns den Weg frei.
};

