// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thekla_EXIT (C_INFO)
{
	npc         = BAU_913_Thekla;
	nr          = 999;
	condition   = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Thekla_HALLO		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 1;
	condition	= DIA_Thekla_HALLO_Condition;
	information	= DIA_Thekla_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Thekla_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //Co dęláš tady v kuchyni?
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 2;
	condition	= DIA_Thekla_Lecker_Condition;
	information	= DIA_Thekla_Lecker_Info;
	permanent 	= FALSE;
	description	= "Nęco tady výbornę voní!";
};

func int DIA_Thekla_Lecker_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Nęco tady výbornę voní!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //No jasnę! Takové jako ty dobâe znám! Takových se tady po okolí potulují spousty.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Nejdâív se snaží vetâít do tvojí pâíznę a pak, když je potâebuješ, nejsou nikde k nalezení!
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------

instance DIA_Thekla_Hunger		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 3;
	condition	= DIA_Thekla_Hunger_Condition;
	information	= DIA_Thekla_Hunger_Info;
	permanent 	= FALSE;
	description	= "Mám hlad!";
};

func int DIA_Thekla_Hunger_Condition ()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //Mám hlad!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Neservíruju tulákům. Jídlo je jen pro lidi, co tu pracují.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(pohrdavę) A pro tu žoldáckou chátru, samozâejmę.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Tady, tvůj dlabanec.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Tady se jídlo vojákům nepodává.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Jak by se dal odmítnout Innosův zmocnęnec?
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************

instance DIA_Thekla_Arbeit		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_Arbeit_Condition;
	information	= DIA_Thekla_Arbeit_Info;
	permanent 	= FALSE;
	description	= "Hledám práci.";
};

func int DIA_Thekla_Arbeit_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //Hledám práci...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Chceš pracovat tady na farmę?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //O tom může rozhodnout pouze Onar. Farma patâí jemu, stejnę jako celé údolí.
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************

instance DIA_Thekla_WannaJoin		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 5;
	condition	= DIA_Thekla_WannaJoin_Condition;
	information	= DIA_Thekla_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "Vlastnę jsem se chtęl pâipojit k žoldnéâům.";
};

func int DIA_Thekla_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //Vlastnę jsem se chtęl pâipojit k žoldnéâům.
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Takže ty jsi další z tęch lotrů z trestanecké kolonie?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //To se dalo čekat! Nech mę na pokoji! Takových jako ty už je tady v okolí až dost!
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************

instance DIA_Thekla_Schlafen		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 6;
	condition	= DIA_Thekla_Schlafen_Condition;
	information	= DIA_Thekla_Schlafen_Info;
	permanent 	= FALSE;
	description	= "Potâebuju se nękde vyspat.";
};

func int DIA_Thekla_Schlafen_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //Potâebuju se nękde vyspat.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Ani nepomysli na to, že by ses mohl vyspat v mojí kuchyni. Najdi si nęco ve stodole.
};
		
// ************************************************************
// 			  				   Problem
// ************************************************************

instance DIA_Thekla_Problem		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Problem_Condition;
	information	= DIA_Thekla_Problem_Info;
	permanent 	= FALSE;
	description	= "Co máš za problémy se žoldáky?";
};

func int DIA_Thekla_Problem_Condition ()
{
	if (kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //Co máš za problémy se žoldáky?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ach, ti pitomci mi vážnę lezou na nervy! Obzvlášă Sylvio a jeho tlustej kámoš Bullco.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Ti dva tu sedí celé dny a ztrpčují mi život.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //Ta polívka je moc horká, maso moc tuhý a tak poâád dokola.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //A proč s tím teda nęco neudęláš?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //A co jako mám dęlat, pane Chytrolín? Praštit je válečkem? To si můžu dovolit na farmáâe, ale tihle podlí bastardi mi to prostę vrátí.
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************

instance DIA_Thekla_Manieren		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Manieren_Condition;
	information	= DIA_Thekla_Manieren_Info;
	permanent 	= FALSE;
	description	= "Chceš, abych ty dva naučil slušným způsobům?";
};

func int DIA_Thekla_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem)) 
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Chceš, abych ty dva naučil slušným způsobům?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Udęláš líp, když to nebudeš zkoušet, drahoušku. Co vím, tak Sylvio má magickou zbroj. Jeho nemůžeš porazit.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //A co Bullco?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ten chlap je silnej jako hovado. Co pamatuju, srazil každýho, kdo jemu nebo Sylviovi dęlal potíže.
};
		
// ************************************************************
// 			  				  After Fight
// ************************************************************

instance DIA_Thekla_AfterFight (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_AfterFight_Condition;
	information	= DIA_Thekla_AfterFight_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Thekla_AfterFight_Condition ()
{
	if (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info ()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Vážnę bys męl nechat Bullca na pokoji, drahoušku.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //To musí být poâádná fuška srazit to tlustý prase.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Dostals docela nakládačku, drahoušku.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //Neâíkala jsem ti to snad? Teë víš, co jsem męla na mysli.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Jsem rád, že se dobâe bavíš.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //Tak teë tak neprotahuj obličej. Nejsi první, kdo od toho neâáda dostal napráskáno.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Tady, dej si trochu vývaru, aă se ti vrátí síla.
	B_GiveInvItems (self, other, ItFo_XPStew, 1);	
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess 
// ************************************************************
instance DIA_Thekla_SagittaPaket (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_SagittaPaket_Condition;
	information	= DIA_Thekla_SagittaPaket_Info;
	permanent 	= TRUE;
	description	= "Tady je balík od Sagitty.";
};

func int DIA_Thekla_SagittaPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info ()
{
	B_GiveInvItems (other, self, ItMi_TheklasPaket, 1);
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Tady je balík od Sagitty.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Díky moc. Tak jsi byl pâece jen k nęčemu dobrý.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_TheklasPaket);		
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------

instance DIA_Thekla_PERM		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 900;
	condition	= DIA_Thekla_PERM_Condition;
	information	= DIA_Thekla_PERM_Info;
	permanent	= TRUE;
	description	= "Můžu dostat ještę trochu toho vývaru?";
};
func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Můžu dostat ještę trochu toho vývaru?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Už nic nemám.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Ani maličkou misku?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Ne.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //A můžu alespoŕ vylízat hrnec?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Necháš toho?!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Když tak prahneš po mém vývaru, męl bys pro to nęco udęlat.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Co?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Zajdi za Sagittou, léčitelkou, co žije za Sekobovou farmou, a pâines mi od ní svazek bylinek.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Když mi pâineseš ty bylinky, udęlám ti trochu vývaru.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Když Thekle pâinesu byliny od léčitelky Sagitty, uvaâí mi ještę další lektvar. Sagitta pâebývá kousek za Sekobovým statkem.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //Dobrá. Tak budu hodná. Tady. Aă mi neumâeš hlady pâed očima.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Hej, hej, hej, ne tak rychle! Dám ti vędęt, až pro tebe najdu nęjakou práci.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //A PAK dostaneš víc vývaru, je to jasný?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //Slyšela jsem, žes pomohl Bennetovi z vęzení. Dobrá práce, hochu.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Ty bastardi od domobrany hodili Benneta do lochu.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Udęlej mi laskavost a dostaŕ ho odtamtud, jo? A já ti zatím udęlám trochu toho báječnýho vývaru.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Už mi nic nezbylo. Vraă se pozdęjc.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Ty jsi poâád hladovej, co? A co vlastnę poâád dęláš?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Sejmul jsem pár draků.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Ó! Tak to mám dojem, že nadešla chvíle na poâádnej hrnec vývaru.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //Pozdę. Už žádný vývar nezbyl.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Žádné bylinky, žádný vývar - víme?
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thekla_PICKPOCKET (C_INFO)
{
	npc			= BAU_913_Thekla;
	nr			= 900;
	condition	= DIA_Thekla_PICKPOCKET_Condition;
	information	= DIA_Thekla_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen (53, 60);
};
 
FUNC VOID DIA_Thekla_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thekla_PICKPOCKET);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_BACK 		,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};
	
func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};























