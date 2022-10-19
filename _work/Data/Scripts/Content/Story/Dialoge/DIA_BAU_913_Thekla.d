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
	description	= "Co� tutaj wspaniale pachnie!";
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
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //Co� tutaj wspaniale pachnie!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //Och tak! Ju� ja znam takich jak ty! Myszkujecie po ca�ym domu.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Najpierw si� przymilacie, a kiedy cz�owiek chce was o co� poprosi� - nikogo nigdy nie ma!
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
	description	= "Jestem g�odny!";
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
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //Jestem g�odny!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //Nie karmi� w��cz�g�w. Jedzenie jest dla tych, kt�rzy pracuj�.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //I dla tego najemnego mot�ochu, oczywi�cie.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Hej, twoje �arcie.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Nie obs�ugujemy tu stra�nik�w.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //Jak mog�abym odm�wi� pro�bie przedstawiciela Innosa?
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
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //Chcesz pracowa� na farmie?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //Jedynie Onar mo�e o tym decydowa�. Farma, jak i ca�a dolina, nale�� do niego.
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
	description	= "W�a�ciwie to chcia�em si� przy��czy� do najemnik�w...";
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
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //W�a�ciwie to chcia�em si� przy��czy� do najemnik�w...
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //Jeste� wi�c jednym z tych przest�pc�w z kolonii karnej?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //Mog�am si� domy�li�! Zostaw mnie w spokoju! Jest was tu woko�o ju� dostatecznie wielu!
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
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Wybij sobie z g�owy spanie w mojej kuchni. Poszukaj sobie miejsca w stodole.
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
	description	= "Dlaczego tak nie lubisz najemnik�w?";
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
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //Dlaczego tak nie lubisz najemnik�w?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //Ci durnie strasznie graj� mi na nerwach! Szczeg�lnie Sylvio i jego t�usty kumpel, Bullko.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Przesiaduj� tu ca�ymi dniami i uprzykrzaj� mi �ycie.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //Zupa za gor�ca, mi�so za twarde... I tak dalej, i tak dalej.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //Dlaczego wi�c nic z tym nie zrobisz?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //A co ja mog�, Panie M�dralo? Pogrozi� im wa�kiem? Na wie�niak�w to mo�e dzia�a, ale na tych �mierdz�cych drani nie.
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
	description	= "Mo�e ja nauczy�bym tych dw�ch dobrych manier?";
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
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //Mo�e ja nauczy�bym tych dw�ch dobrych manier?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Lepiej uwa�aj, kochaniutki. Z tego co wiem, Sylvio nosi magiczn� zbroj�, trudno go pokona�.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //A Bullko?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ten facet jest silny jak w�. Jak dot�d za�atwi� wszystkich, kt�rzy sprzeciwiali si� jemu b�d� Sylviowi.
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
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Pokaza�e� Bullkowi, gdzie jego miejsce, kochaniutki.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //Pokonanie tej opas�ej �wini musia�o by� strasznie m�cz�ce.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Nie�le ci si� oberwa�o.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //A nie m�wi�am? Teraz ju� wiesz, co mia�am na my�li.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Widz�, �e �wietnie si� bawisz.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //No ju�, nie r�b takiej miny. Nie ty pierwszy oberwa�e� od tego �miecia.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Masz, zjedz co� - to powinno doda� ci si�.
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
	description	= "Mam tu przesy�k� od Sagitty.";
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
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Mam tu przesy�k� od Sagitty.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Wielkie dzi�ki. Jednak na co� si� przyda�e�.
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
	description	= "Dostan� jeszcze troch� gulaszu?";
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
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //Dostan� jeszcze troch� gulaszu?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //Ju� nie ma.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //Nawet ma�ej miseczki?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //Nawet miseczki.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //Mog� wyliza� garnek?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //Daj spok�j!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Skoro tak ci smakuje m�j gulasz, b�dziesz musia� co� zrobi�, by go dosta�.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //Co takiego?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Udaj si� do Sagitty, wied�my mieszkaj�cej za farm� Sekoba, i przynie� mi od niej paczk� zi�.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Je�li przyniesiesz zio�a, ugotuj� gulasz.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Je�li przynios� Thekli zio�a od uzdrawiaczki Sagitty, mog� liczy� na kolejny posi�ek. Sagitta mieszka za farm� Sekoba.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //W porz�dku. Znaj moje dobre serce. Prosz�, nie chc�, �eby� si� biedaczku zag�odzi�.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //Hej, hej, hej! Nie tak �apczywie! Dam ci zna�, je�li b�d� mia�a dla ciebie jakie� zadanie.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //Wtedy dostaniesz wi�cej gulaszu, zrozumiano?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //S�ysza�am, �e pomog�e� Bennetowi. Dobra robota, ch�opcze.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Te psubraty ze stra�y uwi�zi�y Benneta!
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Zr�b co� dla mnie i wyci�gnij tego nieszcz�nika. W mi�dzyczasie ugotuj� troch� smakowitego gulaszu.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //Nic ju� nie zosta�o. Przyjd� p�niej.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Nigdy nie przestajesz by� g�odny? Czym ty si� w�a�ciwie zajmujesz?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //W�a�nie posieka�em kilka smok�w.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //Och! W takim razie zas�u�y�e� chyba na porz�dn� mich� gulaszu.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //To wszystko, nie ma ju� wi�cej.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Nie ma zi�, nie ma gulaszu - jasne?
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























