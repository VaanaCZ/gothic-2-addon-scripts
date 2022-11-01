///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bengar_EXIT   (C_INFO)
{
	npc         = BAU_960_Bengar;
	nr          = 999;
	condition   = DIA_Bengar_EXIT_Condition;
	information = DIA_Bengar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 ///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	3;
	condition	 = 	DIA_Bengar_HALLO_Condition;
	information	 = 	DIA_Bengar_HALLO_Info;

	description	 = 	"Jesteś tutaj farmerem?";
};

func int DIA_Bengar_HALLO_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Jesteś tutaj farmerem?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Można by tak powiedzieć, ale właściwie to jestem tylko najętym pracownikiem.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Cała okoliczna ziemia należy do jednego, bogatego człowieka.

};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Bengar_WOVONLEBTIHR_Condition;
	information	 = 	DIA_Bengar_WOVONLEBTIHR_Info;

	description	 = 	"Z czego żyjecie?";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_WOVONLEBTIHR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Z czego żyjecie?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //Głównie z polowania i wyrębu drzew. Oczywiście, hodujemy też owce i uprawiamy ziemię.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar obarczył mnie tymi wszystkimi pracownikami i muszę im jakoś wyznaczać zajęcia. Ale tylko kilku z nich potrafi dobrze polować, wiesz?

};


///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	6;
	condition	 = 	DIA_Bengar_TAGELOEHNER_Condition;
	information	 = 	DIA_Bengar_TAGELOEHNER_Info;

	description	 = 	"Zatrudniacie pracowników na dniówkę?";
};

func int DIA_Bengar_TAGELOEHNER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_TAGELOEHNER_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Zatrudniacie pracowników na dniówkę?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar odsyła robotników, którzy nie przydają mu się w gospodarstwie.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Ci właśnie trafiają do mnie. Ja ich karmię i dla mnie tutaj pracują.

};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Bengar_MissingPeople_Info;

	description	 = 	"Czy ostatnimi czasy działo się tu coś dziwnego?";
};

func int DIA_Addon_Bengar_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //Czy ostatnimi czasy działo się tu coś dziwnego?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Tu zawsze dzieje się coś dziwnego.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Jednak najdziwniejsze było nagłe zniknięcie Pardosa.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //To jeden z moich parobków. Na pewno nie był z tych, co to uciekają nocą bez słowa.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Zaginął robotnik farmera Bengara, Pardos."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Masz jakieś sugestie?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Może już mu się znudziło?", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Co było takiego dziwnego w jego zniknięciu?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Co było takiego dziwnego w jego zniknięciu?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos nie był zbyt odważny. Nigdy nie opuszczał farmy.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Wystarczyło, że zobaczył chrząszcza, a już brał nogi za pas.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Nie są to może najładniejsze stworzenia, ale nie są też niebezpieczne.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //Słyszałem, że moi ludzie łapią je i jedzą ich mięso. Obrzydliwe.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Można się do tego przyzwyczaić.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Może już mu się znudziło?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //Bardzo lubił tę pracę, więc ciężko mi sobie wyobrazić, że uciekł.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //U mnie mógł robić, co chciał, więc raczej nie uciekł do innego farmera.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //Masz jakieś sugestie?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Przypuszczam, że porwali go bandyci. Ostatnio często tu ich widujemy.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Kiedyś widziałem, jak prowadzili ze sobą jakiegoś człowieka z miasta.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Wyglądało na to, że nie szedł z własnej woli.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Gdzie ci bandyci mają swój obóz?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Gdzie ci bandyci mają swój obóz?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Za moimi polami znajdziesz wykute w skale schody, które wiodą do małej kotliny. Tam się najpewniej zatrzymali.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Chętnie bym sam poszukał Pardosa, ale nie uśmiecha mi się spotkanie z tymi bandziorami.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //Na twoim miejscu trzymałbym się od nich z daleka. Nie lubią obcych.
	Bengar_ToldAboutRangerBandits = TRUE;
};
func void DIA_Addon_Bengar_MissingPeople_back ()
{
	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_ReturnPardos_Condition;
	information	 = 	DIA_Addon_Bengar_ReturnPardos_Info;

	description	 = 	"Czy Pardos wrócił?";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition ()
{
	if 	(MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&&  (Npc_GetDistToWP (Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Czy Pardos wrócił?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Tak, teraz odpoczywa w domu. Dzięki za wszystko.
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //Nie ma sprawy.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Czekaj, chciałbym ci się jakoś odwdzięczyć, ale nie mam jak...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Nie ma sprawy.
	
	B_GivePlayerXP (XP_Ambient);
};	

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Bengar_FernandosWeapons_Condition;
	information	 = 	DIA_Addon_Bengar_FernandosWeapons_Info;

	description	 = 	"Czy ci bandyci nieśli ze sobą jakąś broń?";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition ()
{
	if (Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		{
			return TRUE;
		};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Czy ci bandyci nieśli ze sobą jakąś broń?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //Głupie pytanie. Widziałeś kiedyś nieuzbrojonego rabusia?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Nie chodzi o to. Pytam, czy nie mieli ze sobą naprawdę sporego jej zapasu. Dużego transportu.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Faktycznie, teraz sobie przypominam. Mieli ze sobą naprawdę sporo oręża.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Część w beczkach, część w workach, a część na wozie.
	 B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	8;
	condition	 = 	DIA_Bengar_REBELLIEREN_Condition;
	information	 = 	DIA_Bengar_REBELLIEREN_Info;

	description	 = 	"Co myślisz o Onarze?";
};

func int DIA_Bengar_REBELLIEREN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Co myślisz o Onarze?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Ach. To chciwy drań, przez którego nas w końcu wszystkich powieszą.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Pewnego dnia paladyni wyjdą z miasta i my, farmerzy, zapłacimy krwią za to, co on tu wyrabia.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Ale nie mam wyboru. Straż przychodzi tu tylko po to, żeby zbierać podatki. Nie chronią gospodarstwa.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Gdybym był lojalny w stosunku do miasta, to w zasadzie zostałbym sam.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Onar przynajmniej od czasu do czasu wysyła najemników, żeby zobaczyć, jak nam idzie.
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	9;
	condition	 = 	DIA_Bengar_PALADINE_Condition;
	information	 = 	DIA_Bengar_PALADINE_Info;

	description	 = 	"Co masz przeciwko królewskim żołnierzom?";
};

func int DIA_Bengar_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) 
		{
				return TRUE;
		};
};

func void DIA_Bengar_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Co masz przeciwko królewskim żołnierzom?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //Wszystko! Od czasu, kiedy paladyni pojawili się w mieście, nic się nie poprawiło. Wprost przeciwnie.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Teraz ci przeklęci strażnicy coraz częściej zaglądają na nasze ziemie i kradną, co im wpadnie w ręce. A paladyni nic z tym nie robią.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Jedyni paladyni, jakich widziałem, to ci dwaj, którzy pilnują przełęczy.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Nie ruszą się o krok, nawet gdyby straż nas wszystkich pozarzynała.

};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	10;
	condition	 = 	DIA_Bengar_PASS_Condition;
	information	 = 	DIA_Bengar_PASS_Info;

	description	 = 	"Przełęczy?";
};

func int DIA_Bengar_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Bengar_PASS_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //Przełęczy?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //Ano. Przełęczy do starej Górniczej Doliny, koło wodospadów po drugiej stronie pastwisk na płaskowyżu.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Spytaj o to Malaka. W zeszłym tygodniu był tam kilka razy.

};

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZ (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_MILIZ_Condition;
	information	= DIA_Bengar_MILIZ_Info;
	permanent 	= FALSE;
	description	= "Mam rozwiązać wasze problemy ze strażą.";
};

func int DIA_Bengar_MILIZ_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Mam rozwiązać wasze problemy ze strażą.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Co? Mówiłem Onarowi, że powinien mi przysłać kilku swoich najemników.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //To moja szansa na to, żeby się wykazać.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Rewelacyjnie. Wiesz, co mi zrobią strażnicy, jak schrzanisz sprawę?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Już myślałem, że nikt nie przyjdzie.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //Mówiłem to Onarowi kilka dni temu. Za co mu płacę czynsz?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Ci dranie przychodzą tu co tydzień i zbierają podatki dla miasta.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Dobrze, że przyszedłeś właśnie teraz. Zazwyczaj zjawiają się o tej porze.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Powinni tu być za chwilę.
};

// ************************************************************
// 			  				Selber vorknöpfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "Dlaczego sami nie staniecie przeciwko straży?";
};

func int DIA_Bengar_Selber_Condition ()
{
	if (MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info ()
{
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Sporo was. Dlaczego sami nie staniecie przeciwko straży?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //To prawda, jest nas wielu. Ale nie jesteśmy zawodowymi żołnierzami jak strażnicy.
};		

// ************************************************************
// 			  				Miliz klatschen 
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN		(C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information	= DIA_Bengar_MILIZKLATSCHEN_Info;
	permanent	= FALSE;
	description	= "Niech no strażnicy przyjdą, zajmę się nimi!";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Niech no strażnicy przyjdą, zajmę się nimi!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Nie mogę się doczekać. Nadchodzą! Widzisz, a nie mówiłem!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Tylko nie nawal!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //No cóż, powodzenia! Pokaż im.
	};

	AI_StopProcessInfos (self);
				
	Npc_ExchangeRoutine	(self,"MilComing"); 
	
	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))
	{
		Npc_ExchangeRoutine	(Rick,"MilComing");
		AI_ContinueRoutine (Rick);
	};
	if (Hlp_IsValidNpc (Rumbold))
	&& (!Npc_IsDead (Rumbold))
	{		
		Npc_ExchangeRoutine	(Rumbold,"MilComing"); 
		AI_ContinueRoutine (Rumbold);
	};
};
	
// ************************************************************
// 			  				Miliz weg 
// ************************************************************
var int Bengar_MilSuccess;

instance DIA_Bengar_MILIZWEG (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 12;
	condition	= DIA_Bengar_MILIZWEG_Condition;
	information	= DIA_Bengar_MILIZWEG_Info;
	permanent	= TRUE;
	description	= "Wasze problemy ze strażą należą już do przeszłości.";
};

func int DIA_Bengar_MILIZWEG_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE)
	{
		if (Npc_IsDead (Rick) && Npc_IsDead (Rumbold))
		|| (Rumbold_Bezahlt == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info ()
{
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //Wasze problemy ze strażą należą już do przeszłości.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Oszalałeś? Wiesz, co mi zrobią, jeśli ciebie nie będzie?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Ciągle tam stoją. Powiedz im, że powinni stąd CAŁKOWICIE zniknąć!
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //Nieźle. Teraz może zostaną nam jakieś drobne na koniec miesiąca. Dzięki.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Chciałeś nawet za mnie zapłacić. To bardzo miłe z twojej strony.
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP (XP_Bengar_MILIZKLATSCHEN);
		};
		
		Bengar_MilSuccess = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	13;
	condition	 = 	DIA_Bengar_BALTHASAR_Condition;
	information	 = 	DIA_Bengar_BALTHASAR_Info;

	description	 = 	"Pasterz Balthasar nie może paść owiec na twoich pastwiskach?";
};

func int DIA_Bengar_BALTHASAR_Condition ()
{
	if 	(
		(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASAR_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Pasterz Balthasar nie może paść owiec na twoich pastwiskach?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //Ach, o to chodzi. Powiedziałem mu, że Sekob powinien mi płacić, jeśli chce korzystać z moich pastwisk.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Mówiąc prawdę, to tylko dokuczanie. Po prostu nie cierpię Balthasara.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Jeśli mam przekonać Bengara, aby wpuścił Balthasara z powrotem na swoje pastwiska, będę musiał wyświadczyć mu przysługę. Na pewno wkrótce nadarzy się ku temu jakaś okazja."); 
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	14;
	condition	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information	 = 	DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;

	description	 = 	"Strażników już nie ma, a Balthasar znowu może korzystać z twoich pastwisk.";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
		&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
		&& (Bengar_MilSuccess == TRUE)
		)
			{
					return TRUE;
			};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Strażników już nie ma, a Balthasar znowu może korzystać z twoich pastwisk.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Dlaczego?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //Bo ja tak powiedziałem.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Hmmm. W porządku, jak sobie życzysz.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //Niech wyprowadza swoje zwierzęta gdzieś za pola uprawne.

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	15;
	condition	 = 	DIA_Bengar_PERMKAP1_Condition;
	information	 = 	DIA_Bengar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Trzymaj się.";
};

func int DIA_Bengar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3)
			{
					return TRUE;
			};
};

func void DIA_Bengar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Trzymaj się.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Ty też.

	AI_StopProcessInfos (self);
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

INSTANCE DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP3_EXIT_Condition;
	information	= DIA_Bengar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	30;
	condition	 = 	DIA_Bengar_ALLEIN_Condition;
	information	 = 	DIA_Bengar_ALLEIN_Info;

	description	 = 	"Jak wygląda sytuacja?";
};

func int DIA_Bengar_ALLEIN_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_ALLEIN_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Jak wygląda sytuacja?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak zniknął i zabrał ze sobą wszystko, i wszystkich, którzy mogli dla mnie pracować. Mówił, że kieruje się w góry.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Nie mógł już tu wytrzymać.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Czasy są ciężkie. Nie wiem, jak długo jeszcze JA to wytrzymam.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Codziennie z przełęczy wypadają hordy potworów i grasują na płaskowyżu. To mnie wykończy.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Gdybym tak miał przynajmniej kilku pomocników albo najemników.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //Był nawet taki jeden, co chciał dla mnie pracować. Ale chyba zmienił zdanie. Zdaje się, że nazywał się Wilk.
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar został na farmie sam. Jego przyjaciel Malak odszedł i zabrał ze sobą pozostałych. Bengar sądzi, że schronili się gdzieś w górach."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Jego farma została bez żadnej ochrony. Prosił mnie o pomoc, wspomniał też coś o najemniku imieniem Wilk. Czy ja przypadkiem nie znam tego człowieka?"); 
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_MALAKTOT_Condition;
	information	 = 	DIA_Bengar_MALAKTOT_Info;

	description	 = 	"Malak nie żyje.";
};

func int DIA_Bengar_MALAKTOT_Condition ()
{
	if (Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKTOT_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak nie żyje.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //A więc sytuacja jeszcze bardziej się pogorszy.
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	32;
	condition	 = 	DIA_Bengar_SLDDA_Condition;
	information	 = 	DIA_Bengar_SLDDA_Info;

	description	 = 	"Znalazłem ci najemnika.";
};

func int DIA_Bengar_SLDDA_Condition ()
{
	if (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_Bengar_SLDDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Znalazłem ci najemnika.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Nie miałem u siebie jeszcze nigdy kogoś takiego. Mam nadzieję, że to się uda.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Proszę, weź to. Sądzę, że ci się przyda.
	CreateInvItems (self, ItMi_Gold, 400);									
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	B_GivePlayerXP (XP_BengarsHelpingSLDArrived);
					
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	35;
	condition	 = 	DIA_Bengar_MALAKWIEDERDA_Condition;
	information	 = 	DIA_Bengar_MALAKWIEDERDA_Info;

	description	 = 	"Malak wrócił.";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition ()
{
	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS)||(NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak))==FALSE)

		{
				return TRUE;
		};
};

func void DIA_Bengar_MALAKWIEDERDA_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak wrócił.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Najwyższa pora. Myślałem, że już nigdy go nie zobaczę.
	B_GivePlayerXP (XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM		(C_INFO)
{
	npc		 = 	BAU_960_Bengar;
	nr		 = 	80;
	condition	 = 	DIA_Bengar_PERM_Condition;
	information	 = 	DIA_Bengar_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wszystko będzie dobrze.";
};

func int DIA_Bengar_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Bengar_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //Wszystko będzie dobrze.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak wrócił, ale sytuacja niewiele się zmieniła.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //Jeśli nie zdarzy się jakiś cud, wszyscy tu zginiemy.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Wilk to dziwny facet, ale chyba sobie poradzi.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Bez Malaka nic tu nie zostanie zrobione. Jeśli wkrótce coś się nie wydarzy, będę musiał opuścić swoje gospodarstwo.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Mam nadzieję, że niedługo wróci.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"Start");
	B_StartOtherRoutine	(SLD_817_Soeldner,"Start");
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

INSTANCE DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP4_EXIT_Condition;
	information	= DIA_Bengar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP5_EXIT_Condition;
	information	= DIA_Bengar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 999;
	condition	= DIA_Bengar_KAP6_EXIT_Condition;
	information	= DIA_Bengar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bengar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bengar_PICKPOCKET (C_INFO)
{
	npc			= BAU_960_Bengar;
	nr			= 900;
	condition	= DIA_Bengar_PICKPOCKET_Condition;
	information	= DIA_Bengar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen (28, 50);
};
 
FUNC VOID DIA_Bengar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bengar_PICKPOCKET);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_BACK 		,DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};
	
func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bengar_PICKPOCKET);
};


















































































