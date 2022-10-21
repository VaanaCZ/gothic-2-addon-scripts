// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //Witaj w moim sklepie, nieznajomy!
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Jestem Bosper. Wyrabiam �uki i handluj� futrami.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Co ci� sprowadza do Khorinis?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper produkuje �uki i handluje sk�rami. Jego sklep mie�ci si� przy wschodniej bramie, w dolnej cz�ci miasta.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "Musz� si� dosta� go g�rnego miasta...";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Musz� si� dosta� go g�rnego miasta...
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Tam, gdzie s� paladyni? Zapomnij o tym.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Musia�by� by� szanowanym obywatelem albo przynajmniej mie� porz�dn� prac�.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Obcy nie ma szans si� tam dosta�.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //Zauwa�y�em..
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Aby uzyska� dost�p do g�rnego miasta, musz� zosta� szanowanym obywatelem albo znale�� sobie jak�� prac�.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "Szukam pracy.";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //Szukam pracy.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Hmmm - przyda�by mi si� nowy czeladnik.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Poprzedni zrezygnowa� dwa dni temu.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //A wi�c, znasz si� troch� na polowaniu?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Hmm... C�...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Mog� ci� nauczy�, jak si� obdziera ze sk�ry zwierz�ta.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Dobrze ci zap�ac� za ka�d� sk�r�, jak� mi przyniesiesz.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Je�li o to chodzi, to mog� ci dostarczy� troch� sk�r.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Wspaniale! Przynie� mi tyle sk�r, ile zdo�asz. Zap�ac� ci za nie dobr� cen�.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper potrzebuje nowego czeladnika. M�g�bym si� u niego zatrudni�.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "Chc� zosta� twoim czeladnikiem.";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Chc� zosta� twoim czeladnikiem.

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //Hej... Wspaniale! Wygl�da na to, �e ju� znasz podstawy.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad uwa�a, �e jeste� dobrym cz�owiekiem.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ale Harad w�tpi w twoje umiej�tno�ci.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ale Harad m�wi, �e nigdy ci� nie widzia�.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben da� ci swoje b�ogos�awie�stwo. Nie jestem zbyt pobo�ny, ale mnie to nie przeszkadza.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben poprze ci� tylko wtedy, kiedy zdob�dziesz b�ogos�awie�stwo bog�w.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben nie wie, kim jeste�.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino powiedzia�, �e je�li o niego chodzi, to mo�esz si� zapisa�, gdzie chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino powiedzia�, �e zosta�e� tu w mie�cie oskar�ony o pope�nienie przest�pstwa. Mam nadziej�, �e to jaki� drobiazg?
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Dopilnuj, �eby ta sprawa si� wyja�ni�a.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino nigdy o tobie nie s�ysza�.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //A Matteo m�wi, �e jeste� wart swojej wagi w z�ocie.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //A Matteo wspomina� co� o d�ugach - lepiej z nim porozmawiaj.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo m�wi, �e jeszcze z tob� o tym nie rozmawia�.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo m�wi, �e nigdy ci� nie widzia�.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //A to oznacza, �e masz poparcie wszystkich mistrz�w!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Popiera ci� teraz czterech mistrz�w. To wystarczy, �eby ci� przyj�� na czeladnika.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Mo�esz dla mnie pracowa�, kiedy tylko chcesz.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Dobrze. Pomy�l� o tym.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Wchodz� w to!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Musisz mie� poparcie co najmniej czterech mistrz�w, �eby zosta� czeladnikiem w tym mie�cie.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //To znaczy, �e powiniene� porozmawia� z tymi, kt�rzy na razie niezbyt ci� popieraj�.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Zanim ci� przyjm�, musz� oczywi�cie wiedzie�, czy w og�le si� nadajesz.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Zwr�ci�e� mi m�j �uk, ale to nie �wiadczy o twoich talentach my�liwskich.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Wchodz� w to!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Nie po�a�ujesz! My�l�, �e dobrze nam si� b�dzie razem pracowa�o.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper przyj�� mnie na swojego czeladnika. Droga do g�rnego miasta stoi przede mn� otworem.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Dobrze. Pomy�l� o tym.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Podejmij dobr� decyzj�! By�by� dla mnie �wietnym kandydatem.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "A co, je�li chc� pracowa� dla innego mistrza?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //A co, je�li chc� pracowa� dla innego mistrza?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //Bzdura!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad i Matteo maj� czeladnik�w.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Alchemik Constantino to samotnik - od lat nie mia� ucznia.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //A co do Thorbena... Wszyscy wiedz�, �e jest kompletnie sp�ukany. Pewnie nie mia�by ci nawet czym zap�aci�.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Z kolei ja pilnie potrzebuj� czeladnika. No i dobrze p�ac�.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ale niezale�nie, gdzie si� chcesz zatrudni� i tak potrzebna ci b�dzie zgoda wszystkich mistrz�w z dolnej cz�ci miasta...
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "Dlaczego tw�j czeladnik zrezygnowa�?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Dlaczego tw�j czeladnik zrezygnowa�?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Powiedzia� tylko, �e w okolicy zrobi�o si� zbyt niebezpiecznie.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Je�li to ci� naprawd� ciekawi, mo�esz go zapyta�.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Nazywa si� Bartok. Pewnie kr�ci si� gdzie� ko�o ober�y Coragona.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Przejd� ko�o ku�ni, a dalej prosto.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "Czy zgodzisz si�, �ebym zawar� umow� z innym mistrzem?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Czy zgodzisz si�, �ebym zawar� umow� z innym mistrzem?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //Mia�em nadziej�, �e b�dziesz pracowa� dla mnie.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ale skoro tego chcesz...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Czy to znaczy, �e mnie poprzesz?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Je�li pozostali mistrzowie nie zaprotestuj� - tak.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //W ko�cu zwr�ci�e� mi m�j �uk.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ale na pewno by�by� dobrym my�liwym.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Je�li zechc� zosta� czeladnikiem, Bosper udzieli mi swojego poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //W porz�dku! Dostaniesz moj� zgod� - ale pod jednym warunkiem.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Pracuj dla mnie, przynajmniej przez jaki� czas.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Wtedy sam ocenisz, czy odpowiada ci moje rzemios�o.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //A kto wie - mo�e to polubisz i zostaniesz ze mn�.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //Je�li jeste� do�� dobry, by pracowa� dla mnie, to u innych te� sobie poradzisz.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "Co mam dla ciebie zrobi�?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Co mam dla ciebie zrobi�?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Naucz� ci�, jak obdziera� ze sk�ry zwierzyn�, a ty mi przyniesiesz, no powiedzmy, p� tuzina wilczych futer.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper mo�e mnie nauczy�, jak obdziera� ze sk�ry zwierz�ta.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Przynie� mi p� tuzina wilczych futer.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Wtedy b�d� wiedzia�, �e opanowa�e� sw�j fach.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Je�li nie zajmie ci to ca�ego �ycia i sk�ry b�d� w zno�nym stanie, to ci� przyjm�.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Albo b�dziesz m�g� naj�� si� u innego mistrza. Je�li tego naprawd� chcesz.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Mam przynie�� Bosperowi sze�� wilczych sk�r. Kiedy ju� wykonam zadanie, zatrudni mnie jako swojego czeladnika albo udzieli poparcia, je�li zechc� pracowa� u innego mistrza.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Chcia�bym, �eby Bosper nauczy� mnie oprawia� zwierz�ta.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "Co do tych wilczych futer...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Co do tych wilczych futer...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Jeste� teraz czeladnikiem innego mistrza. Kupi� od ciebie sk�ry po zwyk�ej cenie.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Mam je, prosz�.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Wspaniale! Wiedzia�em, �e nadajesz si� do tej pracy.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //A oto zap�ata, tak jak obiecywa�em.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //I co? Co my�lisz? Czy to nie lepsza praca ni� kucie mieczy po ca�ych dniach albo nape�nianie ma�ych buteleczek w zakurzonej komnacie?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper przyjmie mnie na czeladnika, je�li pozostali mistrzowie udziel� mi swojego poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Umawiali�my si� na p� tuzina, ale masz jeszcze czas. Ruszaj i przynie� mi te sk�ry.
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "Naucz mnie, jak obdziera� zwierzyn� ze sk�ry.";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Naucz mnie, jak obdziera� zwierzyn� ze sk�ry.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //Dobrze. S�uchaj. To do�� proste.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Ostrym no�em rozcinasz brzuch zwierz�cia. Potem robisz ma�e naci�cia po wewn�trznej stronie �ap i �ci�gasz sk�r�.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Przynie� mi te wilcze sk�ry, to zobaczymy...
			B_LogEntry (TOPIC_BosperWolf,"Bosper nauczy� mnie, jak obdziera� zwierzyn� ze sk�ry.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"Poka� mi swoje towary.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Poka� mi swoje towary.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Nie jeste� tu po to, �eby ogl�da� moje towary! Masz mi przynie�� te sk�ry!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Wi�c do roboty!
	};
};

// **************************************************************
// 						Von Bogen geh�rt
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "S�ysza�em, �e kto� ci� okrad�.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //S�ysza�em, �e kto� ci� okrad�.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Kto ci to powiedzia�? Pewnie Bartok, co? Nie mia� nic ciekawszego do powiedzenia? No c�.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //M�wi� ci, jak dorw� tego drania, to niech si� lepiej modli!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //Wyszed�em ze sklepu tylko na chwil�. Kiedy wr�ci�em, zd��y�em tylko zobaczy�, jak wychodzi - z moim �ukiem na ramieniu.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Od razu wezwa�em stra�nik�w, ale ten niegodziwiec uciek� do portu. I tam go zgubili.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Narobi�em takiego szumu, �e stra� przetrz�sn�a ca�� dzielnic� portow�. Ale nic nie znale�li.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Cholerne obiboki!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Za�o�� si�, �e m�j �uk jest ci�gle w mie�cie. Poinformowa�em stra�e przy obu bramach i nie widzieli, �eby kto� wychodzi� z moim �ukiem.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Jak dorw� tego �obuza...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosperowi skradziono �uk. Z�odziej skierowa� si� do przystani i tam przepad� jak kamie� w wod�. Stra�nicy miejscy przeszukali ca�� dzielnic� portow�, lecz nie uda�o im si� nic znale��. Istnieje jednak du�e prawdopodobie�stwo, �e z�odziej nie opu�ci� jeszcze miasta.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "S�dz�, �e to tw�j �uk...";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //S�dz�, �e to tw�j �uk...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //M�j �uk! Gdzie go znalaz�e�?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //W ciemnej norze pe�nej szczur�w.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Mam nadziej�, �e nie wpakowa�e� si� w k�opoty...
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //Nie - robi�em ju� takie rzeczy wcze�niej.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Hmmm. Tak czy inaczej, dzi�kuj�. Jestem twoim d�u�nikiem.
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co s�ycha� w mie�cie?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Co s�ycha� w mie�cie?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Je�li orkowie naprawd� zaczn� oblega� miasto, to b�dzie tu nieprzyjemnie.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Jest tylko jeden statek i pilnuj� go paladyni. Nie s�dz�, �eby u�yli go do ewakuacji obywateli.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Nie ma innego sposobu, �eby si� st�d wydosta�?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Nie. Nikt nie opu�ci wyspy bez statku.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Jak na razie nic nowego. Wpadnij p�niej.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Zaci�gn��e� si� do stra�y, co?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Nie, �eby mnie to obchodzi�o. Dop�ki poluj�c na ork�w i bandyt�w, nie zapomnisz upolowa� kilku wilk�w.
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Wygl�da na to, �e twoja kariera toczy si� jak lawina. Paladyn Kr�la!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Nie zapomnij o swoim starym mistrzu...
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Poszed�e� do klasztoru, co? Mam nadziej�, �e b�d� ci� wystarczaj�co cz�sto wypuszcza�, �eby� nadal zaopatrywa� mnie w sk�ry...
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Gdzie si� szwenda�e� tyle czasu?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Potrzebuj� wi�cej sk�r, przynios�e� jakie�?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //A ten znowu to samo...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "Co mam robi� jako czeladnik?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Co mam robi� jako czeladnik?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //To proste. Przynie� mi tyle futer, ile zdo�asz.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Zap�ac� ci za nie lepsz� cen� ni� ka�dy inny handlarz.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Poza tym, mo�esz si� w og�le nie pokazywa� w sklepie. Poradz� sobie �wietnie sam.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //A gdzie mam spa�?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Nie mam tu dla ciebie pokoju. Powiniene� znale�� jakie� ��ko w gospodzie ko�o placu targowego.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper skupuje sk�ry zwierz�ce po wyj�tkowo dobrej cenie.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "Mam dla ciebie kilka sk�r...";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //Mam dla ciebie kilka sk�r...
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Owcze sk�ry? Chyba nie zat�uk�e� jakiemu� wie�niakowi jego owiec, co?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //Nawet bym o tym nie pomy�la�...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Wilcza sk�ra, nie�le...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Sk�ra warga? Te bestie s� niebezpieczne...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Och, nawet sk�ra cieniostwora - takie s� sporo warte.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //A co TO za sk�ra?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Zdar�em j� z trolla.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //To... to jest warte ma�� fortun�.
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Kolejna trollowa sk�ra... Czy ty na nie polujesz?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //Nie, po prostu korzystam z ka�dej okazji...
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //No prosz�, sk�ra czarnego trolla!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Dobra robota. Przyjd� do mnie, jak b�dziesz mia� nast�pne...
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ale pami�taj - interesuj� mnie tylko sk�ry wilk�w, cieniostwor�w i tym podobne...
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "Widz�, �e masz na sprzeda� udzia�y w kopalni.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Widz�, �e masz na sprzeda� udzia�y w kopalni.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Eee... Ja nic o tym nie wiem. Mo�esz je zatrzyma�, je�li chcesz.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};








