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
	description	= "Coś tutaj wspaniale pachnie!";
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
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Coś tutaj wspaniale pachnie!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //Och tak! Już ja znam takich jak ty! Myszkujecie po całym domu.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Najpierw się przymilacie, a kiedy człowiek chce was o coś poprosić - nikogo nigdy nie ma!
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
	description	= "Jestem głodny!";
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
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //Jestem głodny!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Nie karmię włóczęgów. Jedzenie jest dla tych, którzy pracują.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //I dla tego najemnego motłochu, oczywiście.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Hej, twoje żarcie.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Nie obsługujemy tu strażników.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Jak mogłabym odmówić prośbie przedstawiciela Innosa?
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
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Chcesz pracować na farmie?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //Jedynie Onar może o tym decydować. Farma, jak i cała dolina, należą do niego.
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
	description	= "Właściwie to chciałem się przyłączyć do najemników...";
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
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //Właściwie to chciałem się przyłączyć do najemników...
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Jesteś więc jednym z tych przestępców z kolonii karnej?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //Mogłam się domyślić! Zostaw mnie w spokoju! Jest was tu wokoło już dostatecznie wielu!
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
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Wybij sobie z głowy spanie w mojej kuchni. Poszukaj sobie miejsca w stodole.
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
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ci durnie strasznie grają mi na nerwach! Szczególnie Sylvio i jego tłusty kumpel, Bullko.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Przesiadują tu całymi dniami i uprzykrzają mi życie.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //Zupa za gorąca, mięso za twarde... I tak dalej, i tak dalej.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //Dlaczego więc nic z tym nie zrobisz?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //A co ja mogę, Panie Mądralo? Pogrozić im wałkiem? Na wieśniaków to może działa, ale na tych śmierdzących drani nie.
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
	description	= "Może ja nauczyłbym tych dwóch dobrych manier?";
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
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Może ja nauczyłbym tych dwóch dobrych manier?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Lepiej uważaj, kochaniutki. Z tego co wiem, Sylvio nosi magiczną zbroję, trudno go pokonać.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //A Bullko?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ten facet jest silny jak wół. Jak dotąd załatwił wszystkich, którzy sprzeciwiali się jemu bądź Sylviowi.
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
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Pokazałeś Bullkowi, gdzie jego miejsce, kochaniutki.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //Pokonanie tej opasłej świni musiało być strasznie męczące.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Nieźle ci się oberwało.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //A nie mówiłam? Teraz już wiesz, co miałam na myśli.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Widzę, że świetnie się bawisz.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //No już, nie rób takiej miny. Nie ty pierwszy oberwałeś od tego śmiecia.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Masz, zjedz coś - to powinno dodać ci sił.
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
	description	= "Mam tu przesyłkę od Sagitty.";
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
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Mam tu przesyłkę od Sagitty.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Wielkie dzięki. Jednak na coś się przydałeś.
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
	description	= "Dostanę jeszcze trochę gulaszu?";
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
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Dostanę jeszcze trochę gulaszu?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Już nie ma.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Nawet małej miseczki?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Nawet miseczki.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //Mogę wylizać garnek?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Daj spokój!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Skoro tak ci smakuje mój gulasz, będziesz musiał coś zrobić, by go dostać.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Co takiego?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Udaj się do Sagitty, wiedźmy mieszkającej za farmą Sekoba, i przynieś mi od niej paczkę ziół.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Jeśli przyniesiesz zioła, ugotuję gulasz.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Jeśli przyniosę Thekli zioła od uzdrawiaczki Sagitty, mogę liczyć na kolejny posiłek. Sagitta mieszka za farmą Sekoba.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //W porządku. Znaj moje dobre serce. Proszę, nie chcę, żebyś się biedaczku zagłodził.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Hej, hej, hej! Nie tak łapczywie! Dam ci znać, jeśli będę miała dla ciebie jakieś zadanie.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //Wtedy dostaniesz więcej gulaszu, zrozumiano?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //Słyszałam, że pomogłeś Bennetowi. Dobra robota, chłopcze.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Te psubraty ze straży uwięziły Benneta!
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Zrób coś dla mnie i wyciągnij tego nieszczęśnika. W międzyczasie ugotuję trochę smakowitego gulaszu.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Nic już nie zostało. Przyjdź później.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Nigdy nie przestajesz być głodny? Czym ty się właściwie zajmujesz?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Właśnie posiekałem kilka smoków.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Och! W takim razie zasłużyłeś chyba na porządną michę gulaszu.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //To wszystko, nie ma już więcej.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Nie ma ziół, nie ma gulaszu - jasne?
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























