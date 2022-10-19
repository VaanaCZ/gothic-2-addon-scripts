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
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //Co robisz w mojej kuchni?
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
	description	= "Coœ tutaj wspaniale pachnie!";
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
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Coœ tutaj wspaniale pachnie!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //Och tak! Ju¿ ja znam takich jak ty! Myszkujecie po ca³ym domu.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Najpierw siê przymilacie, a kiedy cz³owiek chce was o coœ poprosiæ - nikogo nigdy nie ma!
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
	description	= "Jestem g³odny!";
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
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //Jestem g³odny!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Nie karmiê w³óczêgów. Jedzenie jest dla tych, którzy pracuj¹.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //I dla tego najemnego mot³ochu, oczywiœcie.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Hej, twoje ¿arcie.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Nie obs³ugujemy tu stra¿ników.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Jak mog³abym odmówiæ proœbie przedstawiciela Innosa?
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
	description	= "Szukam pracy.";
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
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //Szukam pracy...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Chcesz pracowaæ na farmie?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //Jedynie Onar mo¿e o tym decydowaæ. Farma, jak i ca³a dolina, nale¿¹ do niego.
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
	description	= "W³aœciwie to chcia³em siê przy³¹czyæ do najemników...";
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
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //W³aœciwie to chcia³em siê przy³¹czyæ do najemników...
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Jesteœ wiêc jednym z tych przestêpców z kolonii karnej?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //Mog³am siê domyœliæ! Zostaw mnie w spokoju! Jest was tu woko³o ju¿ dostatecznie wielu!
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
	description	= "Szukam miejsca na nocleg.";
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
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //Szukam miejsca na nocleg.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Wybij sobie z g³owy spanie w mojej kuchni. Poszukaj sobie miejsca w stodole.
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
	description	= "Dlaczego tak nie lubisz najemników?";
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
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //Dlaczego tak nie lubisz najemników?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ci durnie strasznie graj¹ mi na nerwach! Szczególnie Sylvio i jego t³usty kumpel, Bullko.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Przesiaduj¹ tu ca³ymi dniami i uprzykrzaj¹ mi ¿ycie.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //Zupa za gor¹ca, miêso za twarde... I tak dalej, i tak dalej.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //Dlaczego wiêc nic z tym nie zrobisz?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //A co ja mogê, Panie M¹dralo? Pogroziæ im wa³kiem? Na wieœniaków to mo¿e dzia³a, ale na tych œmierdz¹cych drani nie.
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
	description	= "Mo¿e ja nauczy³bym tych dwóch dobrych manier?";
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
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Mo¿e ja nauczy³bym tych dwóch dobrych manier?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Lepiej uwa¿aj, kochaniutki. Z tego co wiem, Sylvio nosi magiczn¹ zbrojê, trudno go pokonaæ.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //A Bullko?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ten facet jest silny jak wó³. Jak dot¹d za³atwi³ wszystkich, którzy sprzeciwiali siê jemu b¹dŸ Sylviowi.
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
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Pokaza³eœ Bullkowi, gdzie jego miejsce, kochaniutki.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //Pokonanie tej opas³ej œwini musia³o byæ strasznie mêcz¹ce.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //NieŸle ci siê oberwa³o.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //A nie mówi³am? Teraz ju¿ wiesz, co mia³am na myœli.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Widzê, ¿e œwietnie siê bawisz.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //No ju¿, nie rób takiej miny. Nie ty pierwszy oberwa³eœ od tego œmiecia.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Masz, zjedz coœ - to powinno dodaæ ci si³.
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
	description	= "Mam tu przesy³kê od Sagitty.";
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
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Mam tu przesy³kê od Sagitty.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Wielkie dziêki. Jednak na coœ siê przyda³eœ.
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
	description	= "Dostanê jeszcze trochê gulaszu?";
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
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Dostanê jeszcze trochê gulaszu?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Ju¿ nie ma.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Nawet ma³ej miseczki?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Nawet miseczki.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //Mogê wylizaæ garnek?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Daj spokój!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Skoro tak ci smakuje mój gulasz, bêdziesz musia³ coœ zrobiæ, by go dostaæ.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Co takiego?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Udaj siê do Sagitty, wiedŸmy mieszkaj¹cej za farm¹ Sekoba, i przynieœ mi od niej paczkê zió³.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Jeœli przyniesiesz zio³a, ugotujê gulasz.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Jeœli przyniosê Thekli zio³a od uzdrawiaczki Sagitty, mogê liczyæ na kolejny posi³ek. Sagitta mieszka za farm¹ Sekoba.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //W porz¹dku. Znaj moje dobre serce. Proszê, nie chcê, ¿ebyœ siê biedaczku zag³odzi³.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Hej, hej, hej! Nie tak ³apczywie! Dam ci znaæ, jeœli bêdê mia³a dla ciebie jakieœ zadanie.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //Wtedy dostaniesz wiêcej gulaszu, zrozumiano?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //S³ysza³am, ¿e pomog³eœ Bennetowi. Dobra robota, ch³opcze.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Te psubraty ze stra¿y uwiêzi³y Benneta!
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Zrób coœ dla mnie i wyci¹gnij tego nieszczêœnika. W miêdzyczasie ugotujê trochê smakowitego gulaszu.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Nic ju¿ nie zosta³o. PrzyjdŸ póŸniej.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Nigdy nie przestajesz byæ g³odny? Czym ty siê w³aœciwie zajmujesz?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //W³aœnie posieka³em kilka smoków.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Och! W takim razie zas³u¿y³eœ chyba na porz¹dn¹ michê gulaszu.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //To wszystko, nie ma ju¿ wiêcej.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Nie ma zió³, nie ma gulaszu - jasne?
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























