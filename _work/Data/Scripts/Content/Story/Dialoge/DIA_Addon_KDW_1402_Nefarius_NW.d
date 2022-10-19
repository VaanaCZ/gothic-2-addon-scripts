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

	description	 = 	"Co s³ychaæ?";
};

func int DIA_Addon_Nefarius_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_00"); //Co s³ychaæ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_01"); //Co TY tu robisz? Co za niespodzianka.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_02"); //Myœla³em, ¿e ciê zabili.
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_03"); //Prawie.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_04"); //Jest straszne zamieszanie z twojego powodu, wiesz? Ledwo rozpozna³em Saturasa – taki by³ z³y.
	
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

	description	 = 	"A co z portalem?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_keineahnung_15_00"); //A co z portalem?
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_01"); //S¹dzimy, ¿e prowadzi do zaginionej doliny, w której staro¿ytna cywilizacja wznios³a swoje miasto.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_02"); //Ale ska³a za portalem to ogromny, lity kamieñ.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_03"); //Nie ma ¿adnych znaków zaklêæ teleportacyjnych. Tajemnicza sprawa...
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

	description	 = 	"Wiesz, jak go uaktywniæ?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_WieMechanik_15_00"); //Wiesz, jak go uaktywniæ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_01"); //Jeden z zaginionych ornamentów wydaje siê swego rodzaju KLUCZEM.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_03"); //Bêdziemy go potrzebowaæ, jeœli chcemy dokonaæ jakichœ postêpów.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_02"); //Musi pasowaæ do wg³êbienia w kszta³cie pierœcienia obok portalu.
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

	description	 = 	"Przynios³em ze sob¹ fragment ornamentu.";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_00"); //Przynios³em ze sob¹ fragment ornamentu.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_01"); //Naprawdê? To wspaniale!
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_02"); //Wiesz, gdzie mog¹ byæ pozosta³e czêœci?
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_03"); //Wed³ug inskrypcji ornament podzielono na cztery kawa³ki.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_04"); //Wygl¹da na to, ¿e wci¹¿ mog¹ byæ gdzieœ na wyspie.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_05"); //Z pomoc¹ Merdariona przet³umaczy³em niektóre inskrypcje.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_06"); //Zawieraj¹ wskazówki co do miejsca ukrycia fragmentów.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_07"); //Masz. Zaznaczy³em niektóre miejsca na tej mapie.
	CreateInvItems (self, ItWr_Map_NewWorld_Ornaments_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Ornaments_Addon, 1);		
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Ornament,"Magowie Wody znaleŸli portal, który podobno prowadzi do niezbadanego rejonu Khorinis."); 
	B_LogEntry (TOPIC_Addon_Ornament,"Nefarius planuje uaktywniæ mechanizm portalu za pomoc¹ ozdobnego pierœcienia. Wci¹¿ potrzebuje trzech fragmentów ornamentu, aby mieæ ca³y pierœcieñ. Wrêczy³ mi mapê z zaznaczonymi miejscami, w których, jak s¹dzi, znajduj¹ siê te elementy."); 
	
	
	B_StartotherRoutine	(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_08"); //Rozejrzyj siê po okolicy.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_09"); //Zwracaj uwagê na stare budowle. Mo¿liwe, ¿e ju¿ ca³kiem siê rozsypa³y i trudno bêdzie je rozpoznaæ.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_10"); //Mog¹ wygl¹daæ rozmaicie – jak wielki, nieregularny g³az, kamienny kr¹g, mauzoleum, albo coœ w tym stylu.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_11"); //Ale po co ci to w ogóle mówiê! Na pewno je znajdziesz. Powodzenia.
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

	description	 = 	"Dlaczego ornament zosta³ zniszczony?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_WhyPortalClosed_15_00"); //Dlaczego ornament zosta³ zniszczony?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_01"); //Ten, kto to zrobi³, chcia³ zapobiec ponownej aktywacji portalu.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_02"); //Im d³u¿ej wpatrujê siê w inskrypcje, tym bardziej jestem pewien, ¿e kap³ani tej prastarej kultury nie byli wcale g³upcami.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_03"); //Mieli powody, ¿eby odci¹æ dostêp do obszaru po drugiej stronie.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_04"); //Nie wiemy, co tam nas czeka. Ale z pewnoœci¹ nie jest to nic dobrego...
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

	description	 = 	"Jeœli chodzi o zaginione ornamenty....";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_00"); //Jeœli chodzi o zaginione ornamenty....
	AI_Output	(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_01"); //Tak?

	if (Npc_HasItems (other,ItMi_Ornament_Addon) >= 1)
	{
			var int MissingOrnamentsCount;
			var int XP_Addon_BringMissingOrnaments;
			var int MissingOrnamentsGeld;
			var string concatText;
			
			MissingOrnamentsCount = Npc_HasItems(other, ItMi_Ornament_Addon);
		
		
			if (MissingOrnamentsCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_02"); //Proszê. Znalaz³em kolejny.
					B_GivePlayerXP (XP_Addon_BringMissingOrnament);
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	1);
					AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
					MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_03"); //Znalaz³em je.
		
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	MissingOrnamentsCount);
					concatText = ConcatStrings(IntToString(MissingOrnamentsCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
					AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		
					XP_Addon_BringMissingOrnaments = (MissingOrnamentsCount * XP_Addon_BringMissingOrnament);
					MissingOrnamentsCounter = (MissingOrnamentsCounter + MissingOrnamentsCount); 
		
					B_GivePlayerXP (XP_Addon_BringMissingOrnaments);
				};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_04"); //To naprawdê wspaniale.
		
			if (MissingOrnamentsCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_05"); //Brakuje nam wci¹¿ dwóch fragmentów. Mo¿e uda ci siê je znaleŸæ.
			}
			else if	(MissingOrnamentsCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_06"); //Brakuje tylko jednego do kompletu.
			}
			else
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_07"); //Teraz mamy je wszystkie. Pozostaje je tylko po³¹czyæ.
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_08"); //Musimy zjednoczyæ nasze si³y, by ponownie po³¹czyæ ornamenty w pierœcieniu.
		
				MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
			};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_09"); //Proszê. To trochê z³ota w podziêce za tw¹ pracê.
		
			MissingOrnamentsGeld	= (MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer);
		
			CreateInvItems (self, ItMi_Gold, MissingOrnamentsGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, MissingOrnamentsGeld);
		
			if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_10"); //Za mn¹!
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
			AI_Output (other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_11"); //Ile ich by³o?
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_12"); //W sumie cztery...
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_13"); //Pozosta³e powinieneœ znaleŸæ tutaj, w miejscach, które zaznaczy³em na mapie.
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
	AI_Output	(self, other, "DIA_Addon_Nefarius_Ringritual_05_00"); //A teraz odejdŸ.
	Npc_SetRefuseTalk (self,60); 
	RitualRingRuns = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_Ornament,"Przynios³em Nefariusowi wszystkie fragmenty ozdobnego pierœcienia. Magowie Wody chc¹ je teraz po³¹czyæ."); 

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
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_00"); //Ornament zosta³ z³o¿ony.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_01"); //Poniewa¿ przynios³eœ nam wszystkie fragmenty, powinieneœ umieœciæ je w portalu.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_02"); //IdŸ do Saturasa po z³o¿ony pierœcieñ.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_03"); //Wtedy, miejmy nadziejê, portal siê otworzy.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartotherRoutine	(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartotherRoutine	(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartotherRoutine	(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartotherRoutine	(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartotherRoutine	(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry (TOPIC_Addon_Ornament,"Ozdobny pierœcieñ jest gotowy. Mam go wzi¹æ od Saturasa."); 

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

	description	 = 	"Co dalej?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_OpenedPortal_15_00"); //Co dalej?
	AI_Output	(self, other, "DIA_Addon_Nefarius_OpenedPortal_05_01"); //Na co czekasz? Ruszaj i oczyœæ drogê.
};

