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
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //Co děláš tady v kuchyni?
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
	description	= "Něco tady výborně voní!";
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
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Něco tady výborně voní!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //No jasně! Takové jako ty dobře znám! Takových se tady po okolí potulují spousty.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Nejdřív se snaží vetřít do tvojí přízně a pak, když je potřebuješ, nejsou nikde k nalezení!
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
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(pohrdavě) A pro tu žoldáckou chátru, samozřejmě.
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
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Jak by se dal odmítnout Innosův zmocněnec?
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
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Chceš pracovat tady na farmě?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //O tom může rozhodnout pouze Onar. Farma patří jemu, stejně jako celé údolí.
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
	description	= "Vlastně jsem se chtěl připojit k žoldnéřům.";
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
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //Vlastně jsem se chtěl připojit k žoldnéřům.
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Takže ty jsi další z těch lotrů z trestanecké kolonie?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //To se dalo čekat! Nech mě na pokoji! Takových jako ty už je tady v okolí až dost!
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
	description	= "Potřebuju se někde vyspat.";
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
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //Potřebuju se někde vyspat.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Ani nepomysli na to, že by ses mohl vyspat v mojí kuchyni. Najdi si něco ve stodole.
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
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ach, ti pitomci mi vážně lezou na nervy! Obzvlášť Sylvio a jeho tlustej kámoš Bullco.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Ti dva tu sedí celé dny a ztrpčují mi život.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //Ta polívka je moc horká, maso moc tuhý a tak pořád dokola.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //A proč s tím teda něco neuděláš?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //A co jako mám dělat, pane Chytrolín? Praštit je válečkem? To si můžu dovolit na farmáře, ale tihle podlí bastardi mi to prostě vrátí.
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
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Uděláš líp, když to nebudeš zkoušet, drahoušku. Co vím, tak Sylvio má magickou zbroj. Jeho nemůžeš porazit.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //A co Bullco?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ten chlap je silnej jako hovado. Co pamatuju, srazil každýho, kdo jemu nebo Sylviovi dělal potíže.
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
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Vážně bys měl nechat Bullca na pokoji, drahoušku.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //To musí být pořádná fuška srazit to tlustý prase.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Dostals docela nakládačku, drahoušku.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //Neříkala jsem ti to snad? Teď víš, co jsem měla na mysli.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Jsem rád, že se dobře bavíš.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //Tak teď tak neprotahuj obličej. Nejsi první, kdo od toho neřáda dostal napráskáno.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Tady, dej si trochu vývaru, ať se ti vrátí síla.
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
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Díky moc. Tak jsi byl přece jen k něčemu dobrý.
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
	description	= "Můžu dostat ještě trochu toho vývaru?";
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
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Můžu dostat ještě trochu toho vývaru?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Už nic nemám.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Ani maličkou misku?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Ne.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //A můžu alespoň vylízat hrnec?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Necháš toho?!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Když tak prahneš po mém vývaru, měl bys pro to něco udělat.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Co?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Zajdi za Sagittou, léčitelkou, co žije za Sekobovou farmou, a přines mi od ní svazek bylinek.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Když mi přineseš ty bylinky, udělám ti trochu vývaru.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Když Thekle přinesu byliny od léčitelky Sagitty, uvaří mi ještě další lektvar. Sagitta přebývá kousek za Sekobovým statkem.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //Dobrá. Tak budu hodná. Tady. Ať mi neumřeš hlady před očima.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Hej, hej, hej, ne tak rychle! Dám ti vědět, až pro tebe najdu nějakou práci.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //A PAK dostaneš víc vývaru, je to jasný?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //Slyšela jsem, žes pomohl Bennetovi z vězení. Dobrá práce, hochu.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Ty bastardi od domobrany hodili Benneta do lochu.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Udělej mi laskavost a dostaň ho odtamtud, jo? A já ti zatím udělám trochu toho báječnýho vývaru.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Už mi nic nezbylo. Vrať se pozdějc.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Ty jsi pořád hladovej, co? A co vlastně pořád děláš?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Sejmul jsem pár draků.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Ó! Tak to mám dojem, že nadešla chvíle na pořádnej hrnec vývaru.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //Pozdě. Už žádný vývar nezbyl.
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























