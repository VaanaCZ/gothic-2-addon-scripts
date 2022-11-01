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
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Jestem Bosper. Wyrabiam łuki i handluję futrami.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Co cię sprowadza do Khorinis?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper produkuje łuki i handluje skórami. Jego sklep mieści się przy wschodniej bramie, w dolnej części miasta.");
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
	description = "Muszę się dostać go górnego miasta...";
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
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Muszę się dostać go górnego miasta...
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Tam, gdzie są paladyni? Zapomnij o tym.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Musiałbyś być szanowanym obywatelem albo przynajmniej mieć porządną pracę.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Obcy nie ma szans się tam dostać.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //Zauważyłem..
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Aby uzyskać dostęp do górnego miasta, muszę zostać szanowanym obywatelem albo znaleźć sobie jakąś pracę.");
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
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Hmmm - przydałby mi się nowy czeladnik.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Poprzedni zrezygnował dwa dni temu.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //A więc, znasz się trochę na polowaniu?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Hmm... Cóż...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Mogę cię nauczyć, jak się obdziera ze skóry zwierzęta.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Dobrze ci zapłacę za każdą skórę, jaką mi przyniesiesz.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Jeśli o to chodzi, to mogę ci dostarczyć trochę skór.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Wspaniale! Przynieś mi tyle skór, ile zdołasz. Zapłacę ci za nie dobrą cenę.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper potrzebuje nowego czeladnika. Mógłbym się u niego zatrudnić.");	
 
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
	description = "Chcę zostać twoim czeladnikiem.";
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
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Chcę zostać twoim czeladnikiem.

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //Hej... Wspaniale! Wygląda na to, że już znasz podstawy.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad uważa, że jesteś dobrym człowiekiem.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ale Harad wątpi w twoje umiejętności.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ale Harad mówi, że nigdy cię nie widział.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben dał ci swoje błogosławieństwo. Nie jestem zbyt pobożny, ale mnie to nie przeszkadza.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben poprze cię tylko wtedy, kiedy zdobędziesz błogosławieństwo bogów.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben nie wie, kim jesteś.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino powiedział, że jeśli o niego chodzi, to możesz się zapisać, gdzie chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino powiedział, że zostałeś tu w mieście oskarżony o popełnienie przestępstwa. Mam nadzieję, że to jakiś drobiazg?
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Dopilnuj, żeby ta sprawa się wyjaśniła.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino nigdy o tobie nie słyszał.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //A Matteo mówi, że jesteś wart swojej wagi w złocie.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //A Matteo wspominał coś o długach - lepiej z nim porozmawiaj.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo mówi, że jeszcze z tobą o tym nie rozmawiał.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo mówi, że nigdy cię nie widział.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //A to oznacza, że masz poparcie wszystkich mistrzów!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Popiera cię teraz czterech mistrzów. To wystarczy, żeby cię przyjąć na czeladnika.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Możesz dla mnie pracować, kiedy tylko chcesz.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Dobrze. Pomyślę o tym.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Wchodzę w to!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Musisz mieć poparcie co najmniej czterech mistrzów, żeby zostać czeladnikiem w tym mieście.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //To znaczy, że powinieneś porozmawiać z tymi, którzy na razie niezbyt cię popierają.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Zanim cię przyjmę, muszę oczywiście wiedzieć, czy w ogóle się nadajesz.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Zwróciłeś mi mój łuk, ale to nie świadczy o twoich talentach myśliwskich.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Wchodzę w to!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Nie pożałujesz! Myślę, że dobrze nam się będzie razem pracowało.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper przyjął mnie na swojego czeladnika. Droga do górnego miasta stoi przede mną otworem.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Dobrze. Pomyślę o tym.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Podejmij dobrą decyzję! Byłbyś dla mnie świetnym kandydatem.
	
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
	description = "A co, jeśli chcę pracować dla innego mistrza?";
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
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //A co, jeśli chcę pracować dla innego mistrza?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //Bzdura!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad i Matteo mają czeladników.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Alchemik Constantino to samotnik - od lat nie miał ucznia.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //A co do Thorbena... Wszyscy wiedzą, że jest kompletnie spłukany. Pewnie nie miałby ci nawet czym zapłacić.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Z kolei ja pilnie potrzebuję czeladnika. No i dobrze płacę.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ale niezależnie, gdzie się chcesz zatrudnić i tak potrzebna ci będzie zgoda wszystkich mistrzów z dolnej części miasta...
	
	
	
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
	description = "Dlaczego twój czeladnik zrezygnował?";
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
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Dlaczego twój czeladnik zrezygnował?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Powiedział tylko, że w okolicy zrobiło się zbyt niebezpiecznie.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Jeśli to cię naprawdę ciekawi, możesz go zapytać.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Nazywa się Bartok. Pewnie kręci się gdzieś koło oberży Coragona.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Przejdź koło kuźni, a dalej prosto.
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
	description = "Czy zgodzisz się, żebym zawarł umowę z innym mistrzem?";
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
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Czy zgodzisz się, żebym zawarł umowę z innym mistrzem?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //Miałem nadzieję, że będziesz pracował dla mnie.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ale skoro tego chcesz...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Czy to znaczy, że mnie poprzesz?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Jeśli pozostali mistrzowie nie zaprotestują - tak.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //W końcu zwróciłeś mi mój łuk.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ale na pewno byłbyś dobrym myśliwym.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Jeśli zechcę zostać czeladnikiem, Bosper udzieli mi swojego poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //W porządku! Dostaniesz moją zgodę - ale pod jednym warunkiem.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Pracuj dla mnie, przynajmniej przez jakiś czas.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Wtedy sam ocenisz, czy odpowiada ci moje rzemiosło.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //A kto wie - może to polubisz i zostaniesz ze mną.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //Jeśli jesteś dość dobry, by pracować dla mnie, to u innych też sobie poradzisz.
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
	description = "Co mam dla ciebie zrobić?";
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
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Co mam dla ciebie zrobić?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Nauczę cię, jak obdzierać ze skóry zwierzynę, a ty mi przyniesiesz, no powiedzmy, pół tuzina wilczych futer.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper może mnie nauczyć, jak obdzierać ze skóry zwierzęta.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Przynieś mi pół tuzina wilczych futer.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Wtedy będę wiedział, że opanowałeś swój fach.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Jeśli nie zajmie ci to całego życia i skóry będą w znośnym stanie, to cię przyjmę.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Albo będziesz mógł nająć się u innego mistrza. Jeśli tego naprawdę chcesz.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Mam przynieść Bosperowi sześć wilczych skór. Kiedy już wykonam zadanie, zatrudni mnie jako swojego czeladnika albo udzieli poparcia, jeśli zechcę pracować u innego mistrza.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Chciałbym, żeby Bosper nauczył mnie oprawiać zwierzęta.");
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
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Jesteś teraz czeladnikiem innego mistrza. Kupię od ciebie skóry po zwykłej cenie.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Mam je, proszę.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Wspaniale! Wiedziałem, że nadajesz się do tej pracy.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //A oto zapłata, tak jak obiecywałem.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //I co? Co myślisz? Czy to nie lepsza praca niż kucie mieczy po całych dniach albo napełnianie małych buteleczek w zakurzonej komnacie?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper przyjmie mnie na czeladnika, jeśli pozostali mistrzowie udzielą mi swojego poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Umawialiśmy się na pół tuzina, ale masz jeszcze czas. Ruszaj i przynieś mi te skóry.
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
	description = "Naucz mnie, jak obdzierać zwierzynę ze skóry.";
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
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Naucz mnie, jak obdzierać zwierzynę ze skóry.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //Dobrze. Słuchaj. To dość proste.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Ostrym nożem rozcinasz brzuch zwierzęcia. Potem robisz małe nacięcia po wewnętrznej stronie łap i ściągasz skórę.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Przynieś mi te wilcze skóry, to zobaczymy...
			B_LogEntry (TOPIC_BosperWolf,"Bosper nauczył mnie, jak obdzierać zwierzynę ze skóry.");
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
	description	 = 	"Pokaż mi swoje towary.";
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
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Pokaż mi swoje towary.
	
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
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Nie jesteś tu po to, żeby oglądać moje towary! Masz mi przynieść te skóry!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Więc do roboty!
	};
};

// **************************************************************
// 						Von Bogen gehört
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "Słyszałem, że ktoś cię okradł.";
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
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //Słyszałem, że ktoś cię okradł.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Kto ci to powiedział? Pewnie Bartok, co? Nie miał nic ciekawszego do powiedzenia? No cóż.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //Mówię ci, jak dorwę tego drania, to niech się lepiej modli!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //Wyszedłem ze sklepu tylko na chwilę. Kiedy wróciłem, zdążyłem tylko zobaczyć, jak wychodzi - z moim łukiem na ramieniu.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Od razu wezwałem strażników, ale ten niegodziwiec uciekł do portu. I tam go zgubili.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Narobiłem takiego szumu, że straż przetrząsnęła całą dzielnicę portową. Ale nic nie znaleźli.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Cholerne obiboki!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Założę się, że mój łuk jest ciągle w mieście. Poinformowałem straże przy obu bramach i nie widzieli, żeby ktoś wychodził z moim łukiem.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Jak dorwę tego łobuza...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosperowi skradziono łuk. Złodziej skierował się do przystani i tam przepadł jak kamień w wodę. Strażnicy miejscy przeszukali całą dzielnicę portową, lecz nie udało im się nic znaleźć. Istnieje jednak duże prawdopodobieństwo, że złodziej nie opuścił jeszcze miasta.");
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
	description	 = "Sądzę, że to twój łuk...";
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
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //Sądzę, że to twój łuk...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //Mój łuk! Gdzie go znalazłeś?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //W ciemnej norze pełnej szczurów.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Mam nadzieję, że nie wpakowałeś się w kłopoty...
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //Nie - robiłem już takie rzeczy wcześniej.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Hmmm. Tak czy inaczej, dziękuję. Jestem twoim dłużnikiem.
	 
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
	description	 = 	"Co słychać w mieście?";
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
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Co słychać w mieście?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Jeśli orkowie naprawdę zaczną oblegać miasto, to będzie tu nieprzyjemnie.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Jest tylko jeden statek i pilnują go paladyni. Nie sądzę, żeby użyli go do ewakuacji obywateli.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Nie ma innego sposobu, żeby się stąd wydostać?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Nie. Nikt nie opuści wyspy bez statku.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Jak na razie nic nowego. Wpadnij później.
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
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Zaciągnąłeś się do straży, co?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Nie, żeby mnie to obchodziło. Dopóki polując na orków i bandytów, nie zapomnisz upolować kilku wilków.
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Wygląda na to, że twoja kariera toczy się jak lawina. Paladyn Króla!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Nie zapomnij o swoim starym mistrzu...
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Poszedłeś do klasztoru, co? Mam nadzieję, że będą cię wystarczająco często wypuszczać, żebyś nadal zaopatrywał mnie w skóry...
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Gdzie się szwendałeś tyle czasu?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Potrzebuję więcej skór, przyniosłeś jakieś?
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
	description	= "Co mam robić jako czeladnik?";
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
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Co mam robić jako czeladnik?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //To proste. Przynieś mi tyle futer, ile zdołasz.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Zapłacę ci za nie lepszą cenę niż każdy inny handlarz.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Poza tym, możesz się w ogóle nie pokazywać w sklepie. Poradzę sobie świetnie sam.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //A gdzie mam spać?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Nie mam tu dla ciebie pokoju. Powinieneś znaleźć jakieś łóżko w gospodzie koło placu targowego.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper skupuje skóry zwierzęce po wyjątkowo dobrej cenie.");
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
	description	= "Mam dla ciebie kilka skór...";
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
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //Mam dla ciebie kilka skór...
	
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
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Owcze skóry? Chyba nie zatłukłeś jakiemuś wieśniakowi jego owiec, co?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //Nawet bym o tym nie pomyślał...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Wilcza skóra, nieźle...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Skóra warga? Te bestie są niebezpieczne...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Och, nawet skóra cieniostwora - takie są sporo warte.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //A co TO za skóra?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Zdarłem ją z trolla.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //To... to jest warte małą fortunę.
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Kolejna trollowa skóra... Czy ty na nie polujesz?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //Nie, po prostu korzystam z każdej okazji...
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //No proszę, skóra czarnego trolla!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Dobra robota. Przyjdź do mnie, jak będziesz miał następne...
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ale pamiętaj - interesują mnie tylko skóry wilków, cieniostworów i tym podobne...
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

	description = "Widzę, że masz na sprzedaż udziały w kopalni.";
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
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Widzę, że masz na sprzedaż udziały w kopalni.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Eee... Ja nic o tym nie wiem. Możesz je zatrzymać, jeśli chcesz.
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








