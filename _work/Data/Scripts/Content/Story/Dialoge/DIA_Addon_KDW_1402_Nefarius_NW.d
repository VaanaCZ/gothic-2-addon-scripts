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

	description	 = 	"Qu'y a-t-il?";
};

func int DIA_Addon_Nefarius_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_00"); //Comment vont les choses, ici ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_01"); //Qu'est-ce que vous faites ici, vous ?! C'est une sacrée surprise...
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_02"); //Je commençais à croire que vous aviez été tué.
	AI_Output	(other, self, "DIA_Addon_Nefarius_Hallo_15_03"); //Presque !
	AI_Output	(self, other, "DIA_Addon_Nefarius_Hallo_05_04"); //Vous avez semé une belle pagaille, savez-vous ? J'ai eu peine à reconnaître Saturas, tant il était abattu par ces affaires...
	
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

	description	 = 	"De quelle sorte de portail s'agit-il ?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_keineahnung_15_00"); //De quelle sorte de portail s'agit-il ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_01"); //Nous pensons qu'il mène dans la vallée oubliée, là où les représentants de cette culture ancestrale avaient érigé leur ville.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_02"); //Mais la pierre derrière le portail est faite de roche massive, et épaisse de plusieurs mètres.
	AI_Output	(self, other, "DIA_Addon_Nefarius_keineahnung_05_03"); //Aussi, nous n'avons trouvé nulle trace d'une quelconque magie de téléportation. C'est très mystérieux...
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

	description	 = 	"Savez-vous comment l'activer ?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_WieMechanik_15_00"); //Savez-vous comment l'activer ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_01"); //Il semblerait que l'un des bijoux manquants soit une sorte de clef magique...
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_03"); //Nous allons devoir la retrouver si nous voulons franchir ce portail.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WieMechanik_05_02"); //Elle doit correspondre parfaitement à la forme du creux proche du portail.
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

	description	 = 	"Je vous apporte un fragment du bijou.";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_00"); //J'ai apporté un fragment de ce bijou ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_01"); //(emballé) Vraiment ?! Fantastique !
	AI_Output	(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_02"); //Sauriez-vous où se trouvent les autres fragments ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_03"); //Selon d'anciens écrits, le bijou aurait été brisé en quatre fragments.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_04"); //Et il semblerait que ces pièces se trouvent encore sur cette île, à l'heure actuelle...
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_05"); //Avec l'aide de Merdarion, je suis parvenu à traduire certaines de ces inscriptions.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_06"); //Elles donnent des indices relatifs à l'endroit où se trouvent les fragments restants.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_07"); //Tenez. J'ai identifié certains de ces lieux sur cette carte.
	CreateInvItems (self, ItWr_Map_NewWorld_Ornaments_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Ornaments_Addon, 1);		
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Ornament,"Les Mages de l'eau ont découvert un portail qui mène apparemment vers une région inexplorée de Khorinis."); 
	B_LogEntry (TOPIC_Addon_Ornament,"Nefarius aspire à activer le mécanisme du portail à l'aide d'une bague. Il lui manque encore trois fragments de cette bague. Je suis censé me les procurer pour lui. Il m'a remis une carte sur laquelle sont indiqués les lieux où je dois rechercher ces fragments."); 
	
	
	B_StartotherRoutine	(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_08"); //Allez y faire quelques recherches.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_09"); //Vous devriez prêter une attention toute particulière aux édifices anciens. Il est possible qu'ils aient été fortement détériorés par le temps, et qu'ils ne soient plus aisément reconnaissables.
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_10"); //Il pourrait s'agir de n'importe quoi. Un grand rocher, un cercle de pierre, un mausolée ou autre !
	AI_Output	(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_11"); //Mais je divague... Vous le trouverez, je n'en doute pas.
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

	description	 = 	"Pourquoi le bijou a-t-il été brisé ?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_WhyPortalClosed_15_00"); //Pourquoi le bijou a-t-il été brisé ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_01"); //Celui qui a brisé le bijou voulait éviter que le portail soit rouvert un  jour.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_02"); //Plus je contemple ces inscriptions, plus je me rends compte de l'exceptionnelle intelligence des prêtres de cette culture ancestrale...
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_03"); //Ils avaient une bonne raison de rendre inaccessible la région située au-delà de ce portail.
	AI_Output	(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_04"); //Nous ne savons pas ce qui nous attend là-bas. Mais ce n'est certainement rien de bon...
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

	description	 = 	"A propos des bijoux manquants...";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_00"); //A propos des bijoux manquants...
	AI_Output	(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_01"); //(intéressé) Oui ?

	if (Npc_HasItems (other,ItMi_Ornament_Addon) >= 1)
	{
			var int MissingOrnamentsCount;
			var int XP_Addon_BringMissingOrnaments;
			var int MissingOrnamentsGeld;
			var string concatText;
			
			MissingOrnamentsCount = Npc_HasItems(other, ItMi_Ornament_Addon);
		
		
			if (MissingOrnamentsCount == 1)
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_02"); //Tenez. En voici un autre.
					B_GivePlayerXP (XP_Addon_BringMissingOrnament);
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	1);
					AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
					MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
				}
				else
				{
					AI_Output		(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_03"); //Je les ai retrouvés.
		
					Npc_RemoveInvItems	(other,	ItMi_Ornament_Addon,	MissingOrnamentsCount);
					concatText = ConcatStrings(IntToString(MissingOrnamentsCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
					AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		
					XP_Addon_BringMissingOrnaments = (MissingOrnamentsCount * XP_Addon_BringMissingOrnament);
					MissingOrnamentsCounter = (MissingOrnamentsCounter + MissingOrnamentsCount); 
		
					B_GivePlayerXP (XP_Addon_BringMissingOrnaments);
				};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_04"); //Fantastique !
		
			if (MissingOrnamentsCounter == 1)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_05"); //Désormais, il ne nous en manque plus que deux. Peut-être parviendrez-vous à les trouver, eux aussi.
			}
			else if	(MissingOrnamentsCounter == 2)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_06"); //Désormais, il n'en manque plus qu'un. Lorsque vous l'aurez trouvé, tous les fragments seront réunis.
			}
			else
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_07"); //Désormais, je les possède tous. Il nous suffit maintenant de les rassembler.
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_08"); //Nous allons devoir unir nos forces pour redonner à ce bijou la forme d'un anneau.
		
				MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
			};
		
			AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_09"); //Tenez. Voici ces pièces d'or, en remerciement de tout le mal que vous vous êtes donné.
		
			MissingOrnamentsGeld	= (MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer);
		
			CreateInvItems (self, ItMi_Gold, MissingOrnamentsGeld); 
			B_GiveInvItems (self, other, ItMi_Gold, MissingOrnamentsGeld);
		
			if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_10"); //Suivez-moi !
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
			AI_Output (other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_11"); //Combien y en avait-il, au juste ?
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_12"); //Il y en a quatre en tout...
			AI_Output (self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_13"); //Vous devriez trouver les autres aux endroits indiqués sur la carte.
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
	AI_Output	(self, other, "DIA_Addon_Nefarius_Ringritual_05_00"); //Bien. Maintenant, écartez-vous.
	Npc_SetRefuseTalk (self,60); 
	RitualRingRuns = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_Ornament,"J'ai rapporté tous les fragments de la bague à Nefarius. Les Mages de l'eau aspirent maintenant à ressouder l'anneau."); 

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
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_00"); //Le bijou a été réuni.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_01"); //Puisque vous nous avez rapporté les fragments requis, c'est à vous que revient l'honneur de les installer dans le portail.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_02"); //Allez voir Saturas et remettez-lui l'anneau réuni.
	AI_Output	(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_03"); //J'espère que le portail s'ouvrira alors.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartotherRoutine	(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartotherRoutine	(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartotherRoutine	(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartotherRoutine	(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartotherRoutine	(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry (TOPIC_Addon_Ornament,"La bague a été assemblée à nouveau. Je dois me la procurer auprès de Saturas."); 

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

	description	 = 	"Et maintenant ?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_OpenedPortal_15_00"); //Et maintenant ?
	AI_Output	(self, other, "DIA_Addon_Nefarius_OpenedPortal_05_01"); //Qu'attendez-vous ? Partez d'ici, et mettez-vous hors de notre chemin !
};

