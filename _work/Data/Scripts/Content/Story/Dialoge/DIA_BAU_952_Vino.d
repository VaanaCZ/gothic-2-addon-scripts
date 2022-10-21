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
	AI_Output (other, self, "DIA_Vino_HALLO_15_00"); //A jak jde práce?
	AI_Output (self, other, "DIA_Vino_HALLO_05_01"); //Jako vždycky. Spousta døiny, málo penìz a s trochou smùly zejtra pøijdou skøeti a srovnají naši farmu se zemí.
	
	if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_HALLO_05_02"); //Královští paladinové obsadili celé mìsto. Ale nechce se mi vìøit, že by odtamtud zvedli ty svý velebný zadky a šli nám pomoct, až nás napadnou skøeti.
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
	description	= "Mùžu ti pomoct? Hledám práci.";
	
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
	AI_Output (other, self, "DIA_Vino_SeekWork_15_00"); //Mùžu ti pomoct? Hledám práci.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_01"); //Víš nìco o polních pracech?
		AI_Output (other, self, "DIA_Vino_SeekWork_15_02"); //Co je tom tak složitého?
		AI_Output (self, other, "DIA_Vino_SeekWork_05_03"); //Ach! V tom pøípadì... Mám dojem, že si vystaèíme sami. Díky.
		
		if (!Npc_IsDead(Lobart))
		{
			AI_Output (self, other, "DIA_Vino_SeekWork_05_04"); //Pokud chceš pro Lobarta pracovat jako nádeník, musím tì varovat. Lidem jako ty platí fakt mizernì!
		
			if ( (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == TRUE) || (Npc_HasItems (lobart, itar_bau_l) > 0) )
			&& (Lobart_Kleidung_Verkauft == FALSE)
			&& ( (Npc_KnowsInfo (other, DIA_Lobart_KLEIDUNG)) || (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW)) )
			{
				AI_Output (other, self, "DIA_Vino_SeekWork_15_05"); //Nabídl, že mi prodá nìjaké šaty se slevou, když mu pomùžu na farmì.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_06"); //Hmm. Nemám pro tebe nic, ale mùžeš mnì a chlapùm pøinést nìco k pití.
				AI_Output (self, other, "DIA_Vino_SeekWork_05_07"); //Pøines mi láhev vína a já øeknu Lobartovi, žes nám opravdu pomohl (s výsmìšným úšklebkem).
				
				MIS_Vino_Wein = LOG_RUNNING;
				
				Log_CreateTopic (TOPIC_Vino,LOG_MISSION);
				Log_SetTopicStatus (TOPIC_Vino,LOG_RUNNING);
				B_LogEntry (TOPIC_Vino,"Jestli Vinovi pøinesu láhev vína, poví Lobartovi, že jsem mu pomohl.");
				
			}
			else
			{	
				AI_Output (self, other, "DIA_Vino_SeekWork_05_08"); //Ale ode mì to nemáš, jasný?
			};
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_SeekWork_05_09"); //Neøekl bych. Práce, kterou nabízím, by nìkoho jako ty urèitì nezajímala.
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
	description	= "Tady je to víno.";
	
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
	AI_Output (other, self, "DIA_Vino_BringWine_15_00"); //Tady je to víno.
	B_GiveInvItems (other,self, itfo_wine, 1);
	AI_Output (self, other, "DIA_Vino_BringWine_05_01"); //Radìji se nemám ptát, kdes ho sebral, co? (smích) Koho to zajímá?
	if (!Npc_IsDead (Lobart))
	{
		AI_Output (self, other, "DIA_Vino_BringWine_05_02"); //Jinak díky.

		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Vino_BringWine_05_03"); //Lobart o tobì uslyší jen to nejlepší.
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
	description	= "Mám namíøeno do mìsta.";
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
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_00"); //Mám namíøeno do mìsta.
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_01"); //A?
	AI_Output (other, self, "DIA_Vino_ToTheCity_15_02"); //Mùžeš mi o mìstì øíct nìco zajímavého?
	AI_Output (self, other, "DIA_Vino_ToTheCity_05_03"); //Ne. Ale Maleth tam obèas zajde - snad se od nìj nìco dozvíš - myslím nìco, co by tì mohlo zajímat.
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
	description	= "Nìjaké zajímavé novinky?";
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
	AI_Output (other, self, "DIA_Vino_PERM_15_00"); //Nìjaké zajímavé novinky?
	
	if (Vino_Gossip_Orks == FALSE)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_01"); //Pøísahal bych, že jsem pøede dvìma dny na kraji lesa zahlédl skøeta.
		AI_Output (self, other, "DIA_Vino_PERM_05_02"); //Od té doby mám v noci vždycky alespoò jedno oko otevøené.
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if (Vino_Gossip_Bugs == FALSE)
	&& 		(MIS_AndreHelpLobart == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_03"); //Ti obrovští odporní brouci už jsou vážnì hodnì otravní. Jsou všude. Sežerou, co uvidí, když na to nedáš pozor.
		AI_Output (self, other, "DIA_Vino_PERM_05_04"); //Pøed nìkolika dny jsem ležel v trávì, myslel si na své, chvilku jsem si zdøímnul a najednou koukám, jak mi jedna z tìch zatracenejch vìcí ožužlává botu!
		AI_Output (self, other, "DIA_Vino_PERM_05_05"); //Mìls mì vidìt, jak jsem mazal. Od tý doby se nemùžu ani poøádnì vyspat.
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Vino_PERM_05_06"); //Nìco, co by stálo za øeè? Nic.
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

	description	 = 	"A jak je to s tebou?";
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
	AI_Output			(other, self, "DIA_Vino_DMTAMSTART_15_00"); //A jak je to s tebou?
	
	if (FoundVinosKellerei == TRUE)
	&& (DIA_Vino_DMTAMSTART_OneTime == FALSE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_01"); //Je to mizérie. Domobrana našla mojí palírnu.
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_02"); //Doufám, že nikdy nezjistí, že patøí mnì.
		B_GivePlayerXP (XP_AmbientKap3);
		DIA_Vino_DMTAMSTART_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Vino_DMTAMSTART_05_03"); //Ti bastardi v èerných kápích jsou snad všude. Nìkdo by jim ty jejich kápì mìl omotat kolem krku.
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

	description	 = 	"Co se dìje?";
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
	AI_Output			(other, self, "DIA_Vino_Obesessed_15_00"); //Co je s tebou?
	AI_Output			(self, other, "DIA_Vino_Obesessed_05_01"); //(øve) Zatracenì, zmizni. Jinak mì zabijou.
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

	description	 = 	"Ty vùbec nejsi pøi smyslech.";
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
	AI_Output			(other, self, "DIA_Vino_Heilung_15_00"); //Ty vùbec nejsi pøi smyslech.
	AI_Output			(self, other, "DIA_Vino_Heilung_05_01"); //Moje hlava... Už to nemùžu dýl vydržet.

	if (DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output			(other, self, "DIA_Vino_Heilung_15_02"); //Mìli bychom zajít do kláštera. Pyrokar, nejvyšší mág, ti snad pomùže.
		AI_Output			(self, other, "DIA_Vino_Heilung_05_03"); //Myslíš? Fajn. Tak to zkusíme.
		B_NpcClearObsessionByDMT (self);
		B_StartOtherRoutine  (Vino,"Kloster"); 
		
		B_LogEntry (TOPIC_DEMENTOREN,"Vino je posedlý. Poslal jsem ho do kláštera, kde ho snad vyléèí. Doufám, že tam v poøádku dorazí."); 
	
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

	description	 = 	"Jak se máš?";
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
	AI_Output			(other, self, "DIA_Vino_PERM4OBSESSED_15_00"); //Jak se máš?
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_01"); //Jo, jo, už je to v poøádku. Mám dojem, že mi tihle chlapci mùžou pomoct. Ale ještì je mi dost divnì.

	if (DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Vino_PERM4OBSESSED_05_02"); //Ale musím uznat, že jejich víno je to nejlepší, co jsem zatím mìl možnost ochutnat.
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

	description	 = 	"Co je nového?";
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
	AI_Output			(other, self, "DIA_Vino_PERM45UND6_15_00"); //Co je nového?

	if (hero.guild == GIL_PAL)
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_01"); //Poèet skøetù v okolí se nepøíjemnì zvýšil.
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_02"); //Vy paladinové s nima zatoèíte, ne?
	}
	else	//hero.guild == GIL_DJG
	{
	AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_03"); //Bojím se, že už brzy budeme muset všeho nechat a pøidat se k vám, žoldákùm na Onarovì farmì.
	};
	
	if (FoundVinosKellerei == TRUE)
	&& (hero.guild != GIL_MIL)
	{
		AI_Output			(self, other, "DIA_Vino_PERM45UND6_05_04"); //Bohužel, domobrana mì ještì nepøestala hledat. Jen doufám, že mì nechytí.
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























































