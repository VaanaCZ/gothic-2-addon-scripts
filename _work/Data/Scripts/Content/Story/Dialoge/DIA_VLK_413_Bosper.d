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
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Jestem Bosper. Wyrabiam ³uki i handlujê futrami.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Co ciê sprowadza do Khorinis?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper produkuje ³uki i handluje skórami. Jego sklep mieœci siê przy wschodniej bramie, w dolnej czêœci miasta.");
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
	description = "Muszê siê dostaæ go górnego miasta...";
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
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Muszê siê dostaæ go górnego miasta...
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Tam, gdzie s¹ paladyni? Zapomnij o tym.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Musia³byœ byæ szanowanym obywatelem albo przynajmniej mieæ porz¹dn¹ pracê.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Obcy nie ma szans siê tam dostaæ.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //Zauwa¿y³em..
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Aby uzyskaæ dostêp do górnego miasta, muszê zostaæ szanowanym obywatelem albo znaleŸæ sobie jak¹œ pracê.");
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
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Hmmm - przyda³by mi siê nowy czeladnik.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Poprzedni zrezygnowa³ dwa dni temu.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //A wiêc, znasz siê trochê na polowaniu?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Hmm... Có¿...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //Mogê ciê nauczyæ, jak siê obdziera ze skóry zwierzêta.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Dobrze ci zap³acê za ka¿d¹ skórê, jak¹ mi przyniesiesz.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //Jeœli o to chodzi, to mogê ci dostarczyæ trochê skór.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //Wspaniale! Przynieœ mi tyle skór, ile zdo³asz. Zap³acê ci za nie dobr¹ cenê.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper potrzebuje nowego czeladnika. Móg³bym siê u niego zatrudniæ.");	
 
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
	description = "Chcê zostaæ twoim czeladnikiem.";
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
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Chcê zostaæ twoim czeladnikiem.

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //Hej... Wspaniale! Wygl¹da na to, ¿e ju¿ znasz podstawy.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad uwa¿a, ¿e jesteœ dobrym cz³owiekiem.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ale Harad w¹tpi w twoje umiejêtnoœci.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ale Harad mówi, ¿e nigdy ciê nie widzia³.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben da³ ci swoje b³ogos³awieñstwo. Nie jestem zbyt pobo¿ny, ale mnie to nie przeszkadza.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben poprze ciê tylko wtedy, kiedy zdobêdziesz b³ogos³awieñstwo bogów.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben nie wie, kim jesteœ.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino powiedzia³, ¿e jeœli o niego chodzi, to mo¿esz siê zapisaæ, gdzie chcesz.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino powiedzia³, ¿e zosta³eœ tu w mieœcie oskar¿ony o pope³nienie przestêpstwa. Mam nadziejê, ¿e to jakiœ drobiazg?
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Dopilnuj, ¿eby ta sprawa siê wyjaœni³a.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino nigdy o tobie nie s³ysza³.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //A Matteo mówi, ¿e jesteœ wart swojej wagi w z³ocie.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //A Matteo wspomina³ coœ o d³ugach - lepiej z nim porozmawiaj.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo mówi, ¿e jeszcze z tob¹ o tym nie rozmawia³.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo mówi, ¿e nigdy ciê nie widzia³.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //A to oznacza, ¿e masz poparcie wszystkich mistrzów!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Popiera ciê teraz czterech mistrzów. To wystarczy, ¿eby ciê przyj¹æ na czeladnika.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //Mo¿esz dla mnie pracowaæ, kiedy tylko chcesz.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Dobrze. Pomyœlê o tym.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Wchodzê w to!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Musisz mieæ poparcie co najmniej czterech mistrzów, ¿eby zostaæ czeladnikiem w tym mieœcie.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //To znaczy, ¿e powinieneœ porozmawiaæ z tymi, którzy na razie niezbyt ciê popieraj¹.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Zanim ciê przyjmê, muszê oczywiœcie wiedzieæ, czy w ogóle siê nadajesz.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Zwróci³eœ mi mój ³uk, ale to nie œwiadczy o twoich talentach myœliwskich.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Wchodzê w to!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Nie po¿a³ujesz! Myœlê, ¿e dobrze nam siê bêdzie razem pracowa³o.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper przyj¹³ mnie na swojego czeladnika. Droga do górnego miasta stoi przede mn¹ otworem.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Dobrze. Pomyœlê o tym.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Podejmij dobr¹ decyzjê! By³byœ dla mnie œwietnym kandydatem.
	
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
	description = "A co, jeœli chcê pracowaæ dla innego mistrza?";
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
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //A co, jeœli chcê pracowaæ dla innego mistrza?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //Bzdura!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad i Matteo maj¹ czeladników.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Alchemik Constantino to samotnik - od lat nie mia³ ucznia.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //A co do Thorbena... Wszyscy wiedz¹, ¿e jest kompletnie sp³ukany. Pewnie nie mia³by ci nawet czym zap³aciæ.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Z kolei ja pilnie potrzebujê czeladnika. No i dobrze p³acê.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ale niezale¿nie, gdzie siê chcesz zatrudniæ i tak potrzebna ci bêdzie zgoda wszystkich mistrzów z dolnej czêœci miasta...
	
	
	
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
	description = "Dlaczego twój czeladnik zrezygnowa³?";
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
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Dlaczego twój czeladnik zrezygnowa³?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Powiedzia³ tylko, ¿e w okolicy zrobi³o siê zbyt niebezpiecznie.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Jeœli to ciê naprawdê ciekawi, mo¿esz go zapytaæ.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Nazywa siê Bartok. Pewnie krêci siê gdzieœ ko³o ober¿y Coragona.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //PrzejdŸ ko³o kuŸni, a dalej prosto.
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
	description = "Czy zgodzisz siê, ¿ebym zawar³ umowê z innym mistrzem?";
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
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //Czy zgodzisz siê, ¿ebym zawar³ umowê z innym mistrzem?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //Mia³em nadziejê, ¿e bêdziesz pracowa³ dla mnie.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ale skoro tego chcesz...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //Czy to znaczy, ¿e mnie poprzesz?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Jeœli pozostali mistrzowie nie zaprotestuj¹ - tak.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //W koñcu zwróci³eœ mi mój ³uk.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ale na pewno by³byœ dobrym myœliwym.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Jeœli zechcê zostaæ czeladnikiem, Bosper udzieli mi swojego poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //W porz¹dku! Dostaniesz moj¹ zgodê - ale pod jednym warunkiem.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Pracuj dla mnie, przynajmniej przez jakiœ czas.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Wtedy sam ocenisz, czy odpowiada ci moje rzemios³o.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //A kto wie - mo¿e to polubisz i zostaniesz ze mn¹.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //Jeœli jesteœ doœæ dobry, by pracowaæ dla mnie, to u innych te¿ sobie poradzisz.
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
	description = "Co mam dla ciebie zrobiæ?";
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
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Co mam dla ciebie zrobiæ?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Nauczê ciê, jak obdzieraæ ze skóry zwierzynê, a ty mi przyniesiesz, no powiedzmy, pó³ tuzina wilczych futer.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper mo¿e mnie nauczyæ, jak obdzieraæ ze skóry zwierzêta.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //Przynieœ mi pó³ tuzina wilczych futer.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Wtedy bêdê wiedzia³, ¿e opanowa³eœ swój fach.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Jeœli nie zajmie ci to ca³ego ¿ycia i skóry bêd¹ w znoœnym stanie, to ciê przyjmê.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Albo bêdziesz móg³ naj¹æ siê u innego mistrza. Jeœli tego naprawdê chcesz.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Mam przynieœæ Bosperowi szeœæ wilczych skór. Kiedy ju¿ wykonam zadanie, zatrudni mnie jako swojego czeladnika albo udzieli poparcia, jeœli zechcê pracowaæ u innego mistrza.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"Chcia³bym, ¿eby Bosper nauczy³ mnie oprawiaæ zwierzêta.");
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
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //Jesteœ teraz czeladnikiem innego mistrza. Kupiê od ciebie skóry po zwyk³ej cenie.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //Mam je, proszê.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Wspaniale! Wiedzia³em, ¿e nadajesz siê do tej pracy.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //A oto zap³ata, tak jak obiecywa³em.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //I co? Co myœlisz? Czy to nie lepsza praca ni¿ kucie mieczy po ca³ych dniach albo nape³nianie ma³ych buteleczek w zakurzonej komnacie?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper przyjmie mnie na czeladnika, jeœli pozostali mistrzowie udziel¹ mi swojego poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Umawialiœmy siê na pó³ tuzina, ale masz jeszcze czas. Ruszaj i przynieœ mi te skóry.
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
	description = "Naucz mnie, jak obdzieraæ zwierzynê ze skóry.";
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
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Naucz mnie, jak obdzieraæ zwierzynê ze skóry.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //Dobrze. S³uchaj. To doœæ proste.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Ostrym no¿em rozcinasz brzuch zwierzêcia. Potem robisz ma³e naciêcia po wewnêtrznej stronie ³ap i œci¹gasz skórê.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //Przynieœ mi te wilcze skóry, to zobaczymy...
			B_LogEntry (TOPIC_BosperWolf,"Bosper nauczy³ mnie, jak obdzieraæ zwierzynê ze skóry.");
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
	description	 = 	"Poka¿ mi swoje towary.";
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
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Poka¿ mi swoje towary.
	
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
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Nie jesteœ tu po to, ¿eby ogl¹daæ moje towary! Masz mi przynieœæ te skóry!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Wiêc do roboty!
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
	description	 = "S³ysza³em, ¿e ktoœ ciê okrad³.";
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
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //S³ysza³em, ¿e ktoœ ciê okrad³.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Kto ci to powiedzia³? Pewnie Bartok, co? Nie mia³ nic ciekawszego do powiedzenia? No có¿.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //Mówiê ci, jak dorwê tego drania, to niech siê lepiej modli!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //Wyszed³em ze sklepu tylko na chwilê. Kiedy wróci³em, zd¹¿y³em tylko zobaczyæ, jak wychodzi - z moim ³ukiem na ramieniu.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Od razu wezwa³em stra¿ników, ale ten niegodziwiec uciek³ do portu. I tam go zgubili.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Narobi³em takiego szumu, ¿e stra¿ przetrz¹snê³a ca³¹ dzielnicê portow¹. Ale nic nie znaleŸli.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Cholerne obiboki!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Za³o¿ê siê, ¿e mój ³uk jest ci¹gle w mieœcie. Poinformowa³em stra¿e przy obu bramach i nie widzieli, ¿eby ktoœ wychodzi³ z moim ³ukiem.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Jak dorwê tego ³obuza...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosperowi skradziono ³uk. Z³odziej skierowa³ siê do przystani i tam przepad³ jak kamieñ w wodê. Stra¿nicy miejscy przeszukali ca³¹ dzielnicê portow¹, lecz nie uda³o im siê nic znaleŸæ. Istnieje jednak du¿e prawdopodobieñstwo, ¿e z³odziej nie opuœci³ jeszcze miasta.");
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
	description	 = "S¹dzê, ¿e to twój ³uk...";
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
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //S¹dzê, ¿e to twój ³uk...
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //Mój ³uk! Gdzie go znalaz³eœ?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //W ciemnej norze pe³nej szczurów.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Mam nadziejê, ¿e nie wpakowa³eœ siê w k³opoty...
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //Nie - robi³em ju¿ takie rzeczy wczeœniej.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Hmmm. Tak czy inaczej, dziêkujê. Jestem twoim d³u¿nikiem.
	 
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
	description	 = 	"Co s³ychaæ w mieœcie?";
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
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Co s³ychaæ w mieœcie?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Jeœli orkowie naprawdê zaczn¹ oblegaæ miasto, to bêdzie tu nieprzyjemnie.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Jest tylko jeden statek i pilnuj¹ go paladyni. Nie s¹dzê, ¿eby u¿yli go do ewakuacji obywateli.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Nie ma innego sposobu, ¿eby siê st¹d wydostaæ?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Nie. Nikt nie opuœci wyspy bez statku.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Jak na razie nic nowego. Wpadnij póŸniej.
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
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Zaci¹gn¹³eœ siê do stra¿y, co?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Nie, ¿eby mnie to obchodzi³o. Dopóki poluj¹c na orków i bandytów, nie zapomnisz upolowaæ kilku wilków.
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Wygl¹da na to, ¿e twoja kariera toczy siê jak lawina. Paladyn Króla!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //Nie zapomnij o swoim starym mistrzu...
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Poszed³eœ do klasztoru, co? Mam nadziejê, ¿e bêd¹ ciê wystarczaj¹co czêsto wypuszczaæ, ¿ebyœ nadal zaopatrywa³ mnie w skóry...
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Gdzie siê szwenda³eœ tyle czasu?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Potrzebujê wiêcej skór, przynios³eœ jakieœ?
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
	description	= "Co mam robiæ jako czeladnik?";
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
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Co mam robiæ jako czeladnik?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //To proste. Przynieœ mi tyle futer, ile zdo³asz.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Zap³acê ci za nie lepsz¹ cenê ni¿ ka¿dy inny handlarz.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Poza tym, mo¿esz siê w ogóle nie pokazywaæ w sklepie. Poradzê sobie œwietnie sam.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //A gdzie mam spaæ?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Nie mam tu dla ciebie pokoju. Powinieneœ znaleŸæ jakieœ ³ó¿ko w gospodzie ko³o placu targowego.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper skupuje skóry zwierzêce po wyj¹tkowo dobrej cenie.");
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
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Owcze skóry? Chyba nie zat³uk³eœ jakiemuœ wieœniakowi jego owiec, co?
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //Nawet bym o tym nie pomyœla³...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Wilcza skóra, nieŸle...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //Skóra warga? Te bestie s¹ niebezpieczne...
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //Och, nawet skóra cieniostwora - takie s¹ sporo warte.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //A co TO za skóra?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Zdar³em j¹ z trolla.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //To... to jest warte ma³¹ fortunê.
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Kolejna trollowa skóra... Czy ty na nie polujesz?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //Nie, po prostu korzystam z ka¿dej okazji...
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //No proszê, skóra czarnego trolla!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Dobra robota. PrzyjdŸ do mnie, jak bêdziesz mia³ nastêpne...
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ale pamiêtaj - interesuj¹ mnie tylko skóry wilków, cieniostworów i tym podobne...
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

	description = "Widzê, ¿e masz na sprzeda¿ udzia³y w kopalni.";
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
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Widzê, ¿e masz na sprzeda¿ udzia³y w kopalni.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Eee... Ja nic o tym nie wiem. Mo¿esz je zatrzymaæ, jeœli chcesz.
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








