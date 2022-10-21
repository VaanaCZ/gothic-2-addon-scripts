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
	AI_Output (self, other, "DIA_Vino_HALLO_05_01"); //Jak zwykle, roboty coraz wiêcej, pieniêdzy coraz mniej. Jak Ÿle pójdzie, to jutro napadn¹ nas orkowie i spal¹ nasz¹ farmê.
	
	if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_HALLO_05_02"); //Królewscy paladyni zajêli niemal ca³e miasto. Ale jakoœ w¹tpiê, ¿eby chcia³o im siê ruszyæ ty³ki i ochroniæ nas przed orkami.
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
	description	= "Mogê ci jakoœ pomóc? Szukam pracy.";
	
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
	AI_Output (other, self, "DIA_Vino_SeekWork_15_00"); //Mogê ci jakoœ pomóc? Szukam pracy.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_01"); //Znasz siê na pracy w polu?
		AI_Output (other, self, "DIA_Vino_SeekWork_15_02"); //A na czym tu siê znaæ?
		AI_Output (self, other, "DIA_Vino_SeekWork_05_03"); //Ach! W takim razie ju¿ ci chyba podziêkujê.
		
		if (!Npc_IsDead(Lobart))
		{
			AI_Output (self, other, "DIA_Vino_SeekWork_05_04"); //Jeœli chcesz siê zatrudniæ u Lobarta jako zwyk³y robotnik, to ostrzegam. Ludziom takim jak ty p³aci naprawdê marnie.
		
			if ( (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == TRUE) || (Npc_HasItems (lobart, itar_bau_l) > 0) )
			&& (Lobart_Kleidung_Verkauft == FALSE)
			&& ( (Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG)) || (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)) )
			{
				AI_Output (other, self, "DIA_Vino_SeekWork_15_05"); //Obieca³, ¿e sprzeda mi tanio czyste ubranie, jeœli pomogê na farmie.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_06"); //Hmmm. Nie mam dla ciebie pracy, ale mo¿esz przynieœæ mnie i ch³opakom coœ do picia.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_07"); //Przynieœ no flaszkê wina, a powiem Lobartowi, ¿eœ siê œwietnie spisa³.
				
				MIS_Vino_Wein = LOG_RUNNING;
				
				Log_CreateTopic (TOPIC_Vino,LOG_MISSION);
				Log_SetTopicStatus (TOPIC_Vino,LOG_RUNNING);
				B_LogEntry (TOPIC_Vino,"Jeœli Vino dostanie ode mnie butelkê wina, powie Lobartowi, ¿e mu pomog³em.");
				
			}
			else
			{	
				AI_Output (self, other, "DIA_Vino_SeekWork_05_08"); //Ale nie bierzesz jej dla mnie, zrozumiano?
			};
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_09"); //Nie s¹dzê! Ktoœ taki jak ty nie chcia³by siê chyba mêczyæ z prac¹, któr¹ mam do zaoferowania.
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
	AI_Output (self, other, "DIA_Vino_BringWine_05_01"); //Wolê nie pytaæ, jak je zdoby³eœ. A kogó¿ to obchodzi?
	if (!Npc_IsDead (Lobart))
	{
		AI_Output (self, other, "DIA_Vino_BringWine_05_02"); //Tak czy inaczej, dziêki.

		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_BringWine_05_03"); //Postaram siê, by Lobart us³ysza³ o tobie same dobre rzeczy.
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
	description	= "Ruszam w stronê miasta.";
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
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_00"); //Ruszam w stronê miasta.
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_01"); //I?
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_02"); //Czy mo¿esz mi powiedzieæ coœ ciekawego na temat miasta?
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_03"); //Nie. Ale Maleth zagl¹da tam od czasu do czasu - mo¿e on coœ wie, to znaczy coœ, co by ciê zainteresowa³o.
};


///////////////////////////////////////////////////////////////////////
//								Gerüchte (PERM)
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
	description	= "Jakieœ ciekawe nowiny?";
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
	AI_Output (other, self, "DIA_Vino_PERM_15_00"); //Jakieœ ciekawe nowiny?
	
	if (Vino_Gossip_Orks == FALSE)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_01"); //Przysi¹g³bym, ¿em dwa dni temu widzia³ orka, na skraju lasu.
		AI_Output (self, other, "DIA_Vino_PERM_05_02"); //Od tego czasu podczas snu staram siê mieæ choæ jedno oko otwarte.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if (Vino_Gossip_Bugs == FALSE)
	&& 		(MIS_AndreHelpLobart == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_03"); //Ta wielka plaga ¿uków doprowadza nas do szaleñstwa. S¹ wszêdzie. ¯r¹ wszystko, co napotkaj¹ na swej drodze.
		AI_Output (self, other, "DIA_Vino_PERM_05_04"); //Jakoœ w zesz³ym tygodniu le¿a³em sobie na ³¹ce i ju¿ prawie zasypia³em, kiedy poczu³em, ¿e jedna z tych bestii zaczyna siê dobieraæ do mojego buta!
		AI_Output (self, other, "DIA_Vino_PERM_05_05"); //Trza by³o widzieæ, jakem ucieka³. Od tamtego czasu nie mogê spokojnie spaæ.
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_06"); //Oprócz tego, co ci powiedzia³em, nic.
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

	description	 = 	"Jak ci siê wiedzie?";
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
	AI_Output			(other, self, "DIA_Vino_DMTAMSTART_15_00"); //Jak ci siê wiedzie?
	
	if (FoundVinosKellerei == TRUE)
	&& (DIA_Vino_DMTAMSTART_OneTime == FALSE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_01"); //Ogólnie do dupy. Stra¿ znalaz³a moj¹ ukryt¹ gorzelniê.
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_02"); //Mam nadziejê, ¿e nie zorientuj¹ siê, kto jest jej w³aœcicielem.
		B_GivePlayerXP (XP_AmbientKap3);
		DIA_Vino_DMTAMSTART_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_03"); //I jeszcze te psubraty w czarnych kapturach. Ktoœ powinien poodcinaæ im te kapturzyska razem z zawartoœci¹.
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

	description	 = 	"Coœ nie tak?";
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
	AI_Output			(other, self, "DIA_Vino_Obesessed_15_00"); //Co ci siê sta³o?
	AI_Output			(self, other, "DIA_Vino_Obesessed_05_01"); //Do cholery, wynoœ siê. Inaczej mnie zabij¹.
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

	description	 = 	"Nie jesteœ sob¹.";
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
	AI_Output			(other, self, "DIA_Vino_Heilung_15_00"); //Nie jesteœ sob¹.
	AI_Output			(self, other, "DIA_Vino_Heilung_05_01"); //Moja g³owa... D³u¿ej tego nie wytrzymam.

	if (DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output			(other, self, "DIA_Vino_Heilung_15_02"); //Powinieneœ udaæ siê do klasztoru. Pyrokar, najwy¿szy Mag Ognia, móg³by ci pomóc.
		AI_Output			(self, other, "DIA_Vino_Heilung_05_03"); //Tak uwa¿asz? W porz¹dku, spróbujê.
		B_NpcClearObsessionByDMT (self);
		B_StartOtherRoutine  (Vino,"Kloster"); 
		
		B_LogEntry (TOPIC_DEMENTOREN,"Vino jest opêtany. Wys³a³em go do klasztoru, aby tam poprosi³ o uzdrowienie. Mam nadziejê, ¿e wszystko bêdzie dobrze."); 
	
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

	description	 = 	"Jak siê masz?";
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
	AI_Output			(other, self, "DIA_Vino_PERM4OBSESSED_15_00"); //Jak siê czujesz?
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_01"); //Wszystko w porz¹dku. Ch³opaki mi pomog¹. Wci¹¿ jednak cholernie krêci mi siê w g³owie.

	if (DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_02"); //Muszê przyznaæ, ¿e to najlepsze wino, jakie pi³em.
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

	description	 = 	"Jakieœ wieœci?";
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
	AI_Output			(other, self, "DIA_Vino_PERM45UND6_15_00"); //Jakieœ wieœci?

	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_01"); //Ostatnio drastycznie wzros³a liczba orków w okolicy.
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_02"); //Chyba wy, paladyni, pozbêdziecie siê ich, prawda?
	}
	else	//hero.guild == GIL_DJG
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_03"); //Obawiam siê, ¿e wkrótce przyjdzie nam porzuciæ farmê, i przy³¹czyæ siê do najemników Onara.
	};
	
	if (FoundVinosKellerei == TRUE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_04"); //Niestety, stra¿e znalaz³y moj¹ ma³¹ gorzelniê. Mam nadziejê, ¿e mnie nie dopadn¹.
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























































