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

	description	 = 	"Jeste� tutaj farmerem?";
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
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Jeste� tutaj farmerem?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Mo�na by tak powiedzie�, ale w�a�ciwie to jestem tylko naj�tym pracownikiem.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Ca�a okoliczna ziemia nale�y do jednego, bogatego cz�owieka.

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

	description	 = 	"Z czego �yjecie?";
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
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Z czego �yjecie?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //G��wnie z polowania i wyr�bu drzew. Oczywi�cie, hodujemy te� owce i uprawiamy ziemi�.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar obarczy� mnie tymi wszystkimi pracownikami i musz� im jako� wyznacza� zaj�cia. Ale tylko kilku z nich potrafi dobrze polowa�, wiesz?

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

	description	 = 	"Zatrudniacie pracownik�w na dni�wk�?";
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
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Zatrudniacie pracownik�w na dni�wk�?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar odsy�a robotnik�w, kt�rzy nie przydaj� mu si� w gospodarstwie.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Ci w�a�nie trafiaj� do mnie. Ja ich karmi� i dla mnie tutaj pracuj�.

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

	description	 = 	"Czy ostatnimi czasy dzia�o si� tu co� dziwnego?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //Czy ostatnimi czasy dzia�o si� tu co� dziwnego?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Tu zawsze dzieje si� co� dziwnego.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Jednak najdziwniejsze by�o nag�e znikni�cie Pardosa.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //To jeden z moich parobk�w. Na pewno nie by� z tych, co to uciekaj� noc� bez s�owa.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Zagin�� robotnik farmera Bengara, Pardos."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Masz jakie� sugestie?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Mo�e ju� mu si� znudzi�o?", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Co by�o takiego dziwnego w jego znikni�ciu?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Co by�o takiego dziwnego w jego znikni�ciu?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos nie by� zbyt odwa�ny. Nigdy nie opuszcza� farmy.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Wystarczy�o, �e zobaczy� chrz�szcza, a ju� bra� nogi za pas.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Nie s� to mo�e naj�adniejsze stworzenia, ale nie s� te� niebezpieczne.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //S�ysza�em, �e moi ludzie �api� je i jedz� ich mi�so. Obrzydliwe.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Mo�na si� do tego przyzwyczai�.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Mo�e ju� mu si� znudzi�o?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //Bardzo lubi� t� prac�, wi�c ci�ko mi sobie wyobrazi�, �e uciek�.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //U mnie m�g� robi�, co chcia�, wi�c raczej nie uciek� do innego farmera.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //Masz jakie� sugestie?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Przypuszczam, �e porwali go bandyci. Ostatnio cz�sto tu ich widujemy.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Kiedy� widzia�em, jak prowadzili ze sob� jakiego� cz�owieka z miasta.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Wygl�da�o na to, �e nie szed� z w�asnej woli.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Gdzie ci bandyci maj� sw�j ob�z?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Gdzie ci bandyci maj� sw�j ob�z?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Za moimi polami znajdziesz wykute w skale schody, kt�re wiod� do ma�ej kotliny. Tam si� najpewniej zatrzymali.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Ch�tnie bym sam poszuka� Pardosa, ale nie u�miecha mi si� spotkanie z tymi bandziorami.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //Na twoim miejscu trzyma�bym si� od nich z daleka. Nie lubi� obcych.
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

	description	 = 	"Czy Pardos wr�ci�?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Czy Pardos wr�ci�?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Tak, teraz odpoczywa w domu. Dzi�ki za wszystko.
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //Nie ma sprawy.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Czekaj, chcia�bym ci si� jako� odwdzi�czy�, ale nie mam jak...
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

	description	 = 	"Czy ci bandyci nie�li ze sob� jak�� bro�?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Czy ci bandyci nie�li ze sob� jak�� bro�?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //G�upie pytanie. Widzia�e� kiedy� nieuzbrojonego rabusia?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Nie chodzi o to. Pytam, czy nie mieli ze sob� naprawd� sporego jej zapasu. Du�ego transportu.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Faktycznie, teraz sobie przypominam. Mieli ze sob� naprawd� sporo or�a.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Cz�� w beczkach, cz�� w workach, a cz�� na wozie.
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

	description	 = 	"Co my�lisz o Onarze?";
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
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Co my�lisz o Onarze?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Ach. To chciwy dra�, przez kt�rego nas w ko�cu wszystkich powiesz�.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Pewnego dnia paladyni wyjd� z miasta i my, farmerzy, zap�acimy krwi� za to, co on tu wyrabia.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Ale nie mam wyboru. Stra� przychodzi tu tylko po to, �eby zbiera� podatki. Nie chroni� gospodarstwa.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Gdybym by� lojalny w stosunku do miasta, to w zasadzie zosta�bym sam.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Onar przynajmniej od czasu do czasu wysy�a najemnik�w, �eby zobaczy�, jak nam idzie.
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

	description	 = 	"Co masz przeciwko kr�lewskim �o�nierzom?";
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
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Co masz przeciwko kr�lewskim �o�nierzom?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //Wszystko! Od czasu, kiedy paladyni pojawili si� w mie�cie, nic si� nie poprawi�o. Wprost przeciwnie.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Teraz ci przekl�ci stra�nicy coraz cz�ciej zagl�daj� na nasze ziemie i kradn�, co im wpadnie w r�ce. A paladyni nic z tym nie robi�.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Jedyni paladyni, jakich widzia�em, to ci dwaj, kt�rzy pilnuj� prze��czy.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Nie rusz� si� o krok, nawet gdyby stra� nas wszystkich pozarzyna�a.

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

	description	 = 	"Prze��czy?";
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
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //Prze��czy?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //Ano. Prze��czy do starej G�rniczej Doliny, ko�o wodospad�w po drugiej stronie pastwisk na p�askowy�u.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Spytaj o to Malaka. W zesz�ym tygodniu by� tam kilka razy.

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
	description	= "Mam rozwi�za� wasze problemy ze stra��.";
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
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Mam rozwi�za� wasze problemy ze stra��.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Co? M�wi�em Onarowi, �e powinien mi przys�a� kilku swoich najemnik�w.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //To moja szansa na to, �eby si� wykaza�.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Rewelacyjnie. Wiesz, co mi zrobi� stra�nicy, jak schrzanisz spraw�?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Ju� my�la�em, �e nikt nie przyjdzie.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //M�wi�em to Onarowi kilka dni temu. Za co mu p�ac� czynsz?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Ci dranie przychodz� tu co tydzie� i zbieraj� podatki dla miasta.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Dobrze, �e przyszed�e� w�a�nie teraz. Zazwyczaj zjawiaj� si� o tej porze.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Powinni tu by� za chwil�.
};

// ************************************************************
// 			  				Selber vorkn�pfen
// ************************************************************
instance DIA_Bengar_Selber (C_INFO)
{
	npc		 	= BAU_960_Bengar;
	nr		 	= 11;
	condition	= DIA_Bengar_Selber_Condition;
	information	= DIA_Bengar_Selber_Info;
	permanent 	= FALSE;
	description	= "Dlaczego sami nie staniecie przeciwko stra�y?";
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
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Sporo was. Dlaczego sami nie staniecie przeciwko stra�y?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //To prawda, jest nas wielu. Ale nie jeste�my zawodowymi �o�nierzami jak stra�nicy.
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
	description	= "Niech no stra�nicy przyjd�, zajm� si� nimi!";
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
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Niech no stra�nicy przyjd�, zajm� si� nimi!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Nie mog� si� doczeka�. Nadchodz�! Widzisz, a nie m�wi�em!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Tylko nie nawal!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //No c�, powodzenia! Poka� im.
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
	description	= "Wasze problemy ze stra�� nale�� ju� do przesz�o�ci.";
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
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //Wasze problemy ze stra�� nale�� ju� do przesz�o�ci.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Oszala�e�? Wiesz, co mi zrobi�, je�li ciebie nie b�dzie?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Ci�gle tam stoj�. Powiedz im, �e powinni st�d CA�KOWICIE znikn��!
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //Nie�le. Teraz mo�e zostan� nam jakie� drobne na koniec miesi�ca. Dzi�ki.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Chcia�e� nawet za mnie zap�aci�. To bardzo mi�e z twojej strony.
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

	description	 = 	"Pasterz Balthasar nie mo�e pa�� owiec na twoich pastwiskach?";
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
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Pasterz Balthasar nie mo�e pa�� owiec na twoich pastwiskach?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //Ach, o to chodzi. Powiedzia�em mu, �e Sekob powinien mi p�aci�, je�li chce korzysta� z moich pastwisk.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //M�wi�c prawd�, to tylko dokuczanie. Po prostu nie cierpi� Balthasara.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Je�li mam przekona� Bengara, aby wpu�ci� Balthasara z powrotem na swoje pastwiska, b�d� musia� wy�wiadczy� mu przys�ug�. Na pewno wkr�tce nadarzy si� ku temu jaka� okazja."); 
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

	description	 = 	"Stra�nik�w ju� nie ma, a Balthasar znowu mo�e korzysta� z twoich pastwisk.";
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
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Stra�nik�w ju� nie ma, a Balthasar znowu mo�e korzysta� z twoich pastwisk.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Dlaczego?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //Bo ja tak powiedzia�em.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Hmmm. W porz�dku, jak sobie �yczysz.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //Niech wyprowadza swoje zwierz�ta gdzie� za pola uprawne.

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

	description	 = 	"Trzymaj si�.";
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
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Trzymaj si�.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Ty te�.

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

	description	 = 	"Jak wygl�da sytuacja?";
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
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Jak wygl�da sytuacja?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak znikn�� i zabra� ze sob� wszystko, i wszystkich, kt�rzy mogli dla mnie pracowa�. M�wi�, �e kieruje si� w g�ry.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Nie m�g� ju� tu wytrzyma�.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Czasy s� ci�kie. Nie wiem, jak d�ugo jeszcze JA to wytrzymam.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Codziennie z prze��czy wypadaj� hordy potwor�w i grasuj� na p�askowy�u. To mnie wyko�czy.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Gdybym tak mia� przynajmniej kilku pomocnik�w albo najemnik�w.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //By� nawet taki jeden, co chcia� dla mnie pracowa�. Ale chyba zmieni� zdanie. Zdaje si�, �e nazywa� si� Wilk.
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar zosta� na farmie sam. Jego przyjaciel Malak odszed� i zabra� ze sob� pozosta�ych. Bengar s�dzi, �e schronili si� gdzie� w g�rach."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Jego farma zosta�a bez �adnej ochrony. Prosi� mnie o pomoc, wspomnia� te� co� o najemniku imieniem Wilk. Czy ja przypadkiem nie znam tego cz�owieka?"); 
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

	description	 = 	"Malak nie �yje.";
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
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak nie �yje.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //A wi�c sytuacja jeszcze bardziej si� pogorszy.
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

	description	 = 	"Znalaz�em ci najemnika.";
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
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Znalaz�em ci najemnika.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Nie mia�em u siebie jeszcze nigdy kogo� takiego. Mam nadziej�, �e to si� uda.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Prosz�, we� to. S�dz�, �e ci si� przyda.
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

	description	 = 	"Malak wr�ci�.";
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
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak wr�ci�.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Najwy�sza pora. My�la�em, �e ju� nigdy go nie zobacz�.
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

	description	 = 	"Wszystko b�dzie dobrze.";
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
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //Wszystko b�dzie dobrze.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak wr�ci�, ale sytuacja niewiele si� zmieni�a.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //Je�li nie zdarzy si� jaki� cud, wszyscy tu zginiemy.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Wilk to dziwny facet, ale chyba sobie poradzi.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Bez Malaka nic tu nie zostanie zrobione. Je�li wkr�tce co� si� nie wydarzy, b�d� musia� opu�ci� swoje gospodarstwo.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Mam nadziej�, �e nied�ugo wr�ci.
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


















































































