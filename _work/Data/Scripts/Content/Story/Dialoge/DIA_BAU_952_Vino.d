///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Vino_EXIT   (C_INFO)
{
	npc         = BAU_952_Vino;
	nr          = 999;
	condition   = DIA_Vino_EXIT_Condition;
	information = DIA_Vino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Vino_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Vino_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//							Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_HALLO		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_HALLO_Condition;
	information	= DIA_Vino_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
	
};
func int DIA_Vino_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Vino_HALLO_15_00"); //Jak idzie praca?
	AI_Output (self, other, "DIA_Vino_HALLO_05_01"); //Jak zwykle, roboty coraz wi�cej, pieni�dzy coraz mniej. Jak �le p�jdzie, to jutro napadn� nas orkowie i spal� nasz� farm�.
	
	if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_HALLO_05_02"); //Kr�lewscy paladyni zaj�li niemal ca�e miasto. Ale jako� w�tpi�, �eby chcia�o im si� ruszy� ty�ki i ochroni� nas przed orkami.
		};
};

///////////////////////////////////////////////////////////////////////
//						Suche Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_SeekWork		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_SeekWork_Condition;
	information	= DIA_Vino_SeekWork_Info;
	permanent 	= FALSE;
	description	= "Mog� ci jako� pom�c? Szukam pracy.";
	
};
func int DIA_Vino_SeekWork_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)
	||  Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG))
	&& (!Npc_IsDead (Lobart))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Vino_SeekWork_15_00"); //Mog� ci jako� pom�c? Szukam pracy.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_01"); //Znasz si� na pracy w polu?
		AI_Output (other, self, "DIA_Vino_SeekWork_15_02"); //A na czym tu si� zna�?
		AI_Output (self, other, "DIA_Vino_SeekWork_05_03"); //Ach! W takim razie ju� ci chyba podzi�kuj�.
		
		if (!Npc_IsDead(Lobart))
		{
			AI_Output (self, other, "DIA_Vino_SeekWork_05_04"); //Je�li chcesz si� zatrudni� u Lobarta jako zwyk�y robotnik, to ostrzegam. Ludziom takim jak ty p�aci naprawd� marnie.
		
			if ( (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == TRUE) || (Npc_HasItems (lobart, itar_bau_l) > 0) )
			&& (Lobart_Kleidung_Verkauft == FALSE)
			&& ( (Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG)) || (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)) )
			{
				AI_Output (other, self, "DIA_Vino_SeekWork_15_05"); //Obieca�, �e sprzeda mi tanio czyste ubranie, je�li pomog� na farmie.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_06"); //Hmmm. Nie mam dla ciebie pracy, ale mo�esz przynie�� mnie i ch�opakom co� do picia.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_07"); //Przynie� no flaszk� wina, a powiem Lobartowi, �e� si� �wietnie spisa�.
				
				MIS_Vino_Wein = LOG_RUNNING;
				
				Log_CreateTopic (TOPIC_Vino,LOG_MISSION);
				Log_SetTopicStatus (TOPIC_Vino,LOG_RUNNING);
				B_LogEntry (TOPIC_Vino,"Je�li Vino dostanie ode mnie butelk� wina, powie Lobartowi, �e mu pomog�em.");
				
			}
			else
			{	
				AI_Output (self, other, "DIA_Vino_SeekWork_05_08"); //Ale nie bierzesz jej dla mnie, zrozumiano?
			};
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_09"); //Nie s�dz�! Kto� taki jak ty nie chcia�by si� chyba m�czy� z prac�, kt�r� mam do zaoferowania.
	};
};

///////////////////////////////////////////////////////////////////////
//						Wein bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_BringWine		(C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 1;
	condition	= DIA_Vino_BringWine_Condition;
	information	= DIA_Vino_BringWine_Info;
	permanent 	= FALSE;
	description	= "Oto twoje wino.";
	
};
func int DIA_Vino_BringWine_Condition ()
{
	if (MIS_Vino_Wein == LOG_RUNNING)
	&& (Npc_HasItems (other, itfo_wine) > 0)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_BringWine_Info ()
{
	AI_Output (other, self, "DIA_Vino_BringWine_15_00"); //Oto twoje wino.
	B_GiveInvItems (other,self, itfo_wine, 1);
	AI_Output (self, other, "DIA_Vino_BringWine_05_01"); //Wol� nie pyta�, jak je zdoby�e�. A kog� to obchodzi?
	if (!Npc_IsDead (Lobart))
	{
		AI_Output (self, other, "DIA_Vino_BringWine_05_02"); //Tak czy inaczej, dzi�ki.

		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_BringWine_05_03"); //Postaram si�, by Lobart us�ysza� o tobie same dobre rzeczy.
		};
	};
	
	MIS_Vino_Wein = LOG_SUCCESS;
	B_GivePlayerXP(XP_VinoWein);
	
	
};


///////////////////////////////////////////////////////////////////////
//						will in die Stadt 
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_ToTheCity (C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 3;
	condition	= DIA_Vino_ToTheCity_Condition;
	information	= DIA_Vino_ToTheCity_Info;
	permanent 	= FALSE;
	description	= "Ruszam w stron� miasta.";
};

func int DIA_Vino_ToTheCity_Condition ()
{
	if (hero.guild == GIL_NONE)
		{
				return TRUE;
		};
};

func void DIA_Vino_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_00"); //Ruszam w stron� miasta.
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_01"); //I?
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_02"); //Czy mo�esz mi powiedzie� co� ciekawego na temat miasta?
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_03"); //Nie. Ale Maleth zagl�da tam od czasu do czasu - mo�e on co� wie, to znaczy co�, co by ci� zainteresowa�o.
};


///////////////////////////////////////////////////////////////////////
//								Ger�chte (PERM)
///////////////////////////////////////////////////////////////////////

// --------------------------
	var int Vino_Gossip_Orks;
	var int Vino_Gossip_Bugs;
// --------------------------

instance DIA_Vino_PERM (C_INFO)
{
	npc			= BAU_952_Vino;
	nr 			= 10;
	condition	= DIA_Vino_PERM_Condition;
	information	= DIA_Vino_PERM_Info;
	permanent 	= TRUE;
	description	= "Jakie� ciekawe nowiny?";
};
func int DIA_Vino_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Vino_HALLO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Vino_PERM_Info ()
{
	AI_Output (other, self, "DIA_Vino_PERM_15_00"); //Jakie� ciekawe nowiny?
	
	if (Vino_Gossip_Orks == FALSE)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_01"); //Przysi�g�bym, �em dwa dni temu widzia� orka, na skraju lasu.
		AI_Output (self, other, "DIA_Vino_PERM_05_02"); //Od tego czasu podczas snu staram si� mie� cho� jedno oko otwarte.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if (Vino_Gossip_Bugs == FALSE)
	&& 		(MIS_AndreHelpLobart == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_03"); //Ta wielka plaga �uk�w doprowadza nas do szale�stwa. S� wsz�dzie. �r� wszystko, co napotkaj� na swej drodze.
		AI_Output (self, other, "DIA_Vino_PERM_05_04"); //Jako� w zesz�ym tygodniu le�a�em sobie na ��ce i ju� prawie zasypia�em, kiedy poczu�em, �e jedna z tych bestii zaczyna si� dobiera� do mojego buta!
		AI_Output (self, other, "DIA_Vino_PERM_05_05"); //Trza by�o widzie�, jakem ucieka�. Od tamtego czasu nie mog� spokojnie spa�.
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_06"); //Opr�cz tego, co ci powiedzia�em, nic.
	};
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

INSTANCE DIA_Vino_KAP3_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP3_EXIT_Condition;
	information	= DIA_Vino_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMTAMSTART
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_DMTAMSTART		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	31;
	condition	 = 	DIA_Vino_DMTAMSTART_Condition;
	information	 = 	DIA_Vino_DMTAMSTART_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak ci si� wiedzie?";
};

func int DIA_Vino_DMTAMSTART_Condition ()
{
	if (Kapitel == 3)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};
var int DIA_Vino_DMTAMSTART_OneTime;
func void DIA_Vino_DMTAMSTART_Info ()
{
	AI_Output			(other, self, "DIA_Vino_DMTAMSTART_15_00"); //Jak ci si� wiedzie?
	
	if (FoundVinosKellerei == TRUE)
	&& (DIA_Vino_DMTAMSTART_OneTime == FALSE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_01"); //Og�lnie do dupy. Stra� znalaz�a moj� ukryt� gorzelni�.
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_02"); //Mam nadziej�, �e nie zorientuj� si�, kto jest jej w�a�cicielem.
		B_GivePlayerXP (XP_AmbientKap3);
		DIA_Vino_DMTAMSTART_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_03"); //I jeszcze te psubraty w czarnych kapturach. Kto� powinien poodcina� im te kapturzyska razem z zawarto�ci�.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Obesessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Obesessed		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	32;
	condition	 = 	DIA_Vino_Obesessed_Condition;
	information	 = 	DIA_Vino_Obesessed_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co� nie tak?";
};

func int DIA_Vino_Obesessed_Condition ()
{
	if 	(NpcObsessedByDMT_Vino == FALSE)
	&& (Kapitel >= 3)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Vino_Obesessed_Info ()
{
	if (Npc_IsDead(DMT_Vino1))
	&& (Npc_IsDead(DMT_Vino2))
	&& (Npc_IsDead(DMT_Vino3))
	&& (Npc_IsDead(DMT_Vino4))
	{
	B_NpcObsessedByDMT (self);
	}
	else
	{
	AI_Output			(other, self, "DIA_Vino_Obesessed_15_00"); //Co ci si� sta�o?
	AI_Output			(self, other, "DIA_Vino_Obesessed_05_01"); //Do cholery, wyno� si�. Inaczej mnie zabij�.
	AI_StopProcessInfos (self);
	DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
	DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Heilung		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	55;
	condition	 = 	DIA_Vino_Heilung_Condition;
	information	 = 	DIA_Vino_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nie jeste� sob�.";
};

func int DIA_Vino_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Vino == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07")<4000) == FALSE)
	 {
				return TRUE;
	 };
};
var int DIA_Vino_Heilung_oneTime;
func void DIA_Vino_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Vino_Heilung_15_00"); //Nie jeste� sob�.
	AI_Output			(self, other, "DIA_Vino_Heilung_05_01"); //Moja g�owa... D�u�ej tego nie wytrzymam.

	if (DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output			(other, self, "DIA_Vino_Heilung_15_02"); //Powiniene� uda� si� do klasztoru. Pyrokar, najwy�szy Mag Ognia, m�g�by ci pom�c.
		AI_Output			(self, other, "DIA_Vino_Heilung_05_03"); //Tak uwa�asz? W porz�dku, spr�buj�.
		B_NpcClearObsessionByDMT (self);
		B_StartOtherRoutine  (Vino,"Kloster"); 
		
		B_LogEntry (TOPIC_DEMENTOREN,"Vino jest op�tany. Wys�a�em go do klasztoru, aby tam poprosi� o uzdrowienie. Mam nadziej�, �e wszystko b�dzie dobrze."); 
	
		B_GivePlayerXP (XP_VinoFreeFromDMT);
		DIA_Vino_Heilung_oneTime = TRUE;
	};
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

INSTANCE DIA_Vino_KAP4_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP4_EXIT_Condition;
	information	= DIA_Vino_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};



///////////////////////////////////////////////////////////////////////
//	Info perm4Obsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM4OBSESSED		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	41;
	condition	 = 	DIA_Vino_PERM4OBSESSED_Condition;
	information	 = 	DIA_Vino_PERM4OBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak si� masz?";
};

func int DIA_Vino_PERM4OBSESSED_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (NpcObsessedByDMT_Vino == TRUE) 
	&& (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07")<4000)
	{
		return TRUE;
	};
};

var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info ()
{
	AI_Output			(other, self, "DIA_Vino_PERM4OBSESSED_15_00"); //Jak si� czujesz?
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_01"); //Wszystko w porz�dku. Ch�opaki mi pomog�. Wci�� jednak cholernie kr�ci mi si� w g�owie.

	if (DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_02"); //Musz� przyzna�, �e to najlepsze wino, jakie pi�em.
	B_GivePlayerXP (XP_Ambient);
	DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm45und6
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM45UND6		(C_INFO)
{
	npc		 = 	BAU_952_Vino;
	nr		 = 	42;
	condition	 = 	DIA_Vino_PERM45UND6_Condition;
	information	 = 	DIA_Vino_PERM45UND6_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jakie� wie�ci?";
};

func int DIA_Vino_PERM45UND6_Condition ()
{
	if (Kapitel >= 4)	
	&& (hero.guild != GIL_KDF)
	&& (NpcObsessedByDMT_Vino == FALSE) 
		{
			return TRUE;
		};
};

func void DIA_Vino_PERM45UND6_Info ()
{
	AI_Output			(other, self, "DIA_Vino_PERM45UND6_15_00"); //Jakie� wie�ci?

	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_01"); //Ostatnio drastycznie wzros�a liczba ork�w w okolicy.
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_02"); //Chyba wy, paladyni, pozb�dziecie si� ich, prawda?
	}
	else	//hero.guild == GIL_DJG
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_03"); //Obawiam si�, �e wkr�tce przyjdzie nam porzuci� farm�, i przy��czy� si� do najemnik�w Onara.
	};
	
	if (FoundVinosKellerei == TRUE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_04"); //Niestety, stra�e znalaz�y moj� ma�� gorzelni�. Mam nadziej�, �e mnie nie dopadn�.
	};
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

INSTANCE DIA_Vino_KAP5_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP5_EXIT_Condition;
	information	= DIA_Vino_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
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


INSTANCE DIA_Vino_KAP6_EXIT(C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 999;
	condition	= DIA_Vino_KAP6_EXIT_Condition;
	information	= DIA_Vino_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Vino_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vino_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Vino_PICKPOCKET (C_INFO)
{
	npc			= BAU_952_Vino;
	nr			= 900;
	condition	= DIA_Vino_PICKPOCKET_Condition;
	information	= DIA_Vino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Vino_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Vino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vino_PICKPOCKET);
	Info_AddChoice		(DIA_Vino_PICKPOCKET, DIALOG_BACK 		,DIA_Vino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vino_PICKPOCKET_DoIt);
};

func void DIA_Vino_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vino_PICKPOCKET);
};
	
func void DIA_Vino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vino_PICKPOCKET);
};























































