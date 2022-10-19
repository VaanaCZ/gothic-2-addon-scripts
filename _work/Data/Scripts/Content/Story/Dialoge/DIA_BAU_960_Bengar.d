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

	description	 = 	"Jesteœ tutaj farmerem?";
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
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Jesteœ tutaj farmerem?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Mo¿na by tak powiedzieæ, ale w³aœciwie to jestem tylko najêtym pracownikiem.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Ca³a okoliczna ziemia nale¿y do jednego, bogatego cz³owieka.

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

	description	 = 	"Z czego ¿yjecie?";
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
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Z czego ¿yjecie?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //G³ównie z polowania i wyrêbu drzew. Oczywiœcie, hodujemy te¿ owce i uprawiamy ziemiê.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar obarczy³ mnie tymi wszystkimi pracownikami i muszê im jakoœ wyznaczaæ zajêcia. Ale tylko kilku z nich potrafi dobrze polowaæ, wiesz?

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

	description	 = 	"Zatrudniacie pracowników na dniówkê?";
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
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Zatrudniacie pracowników na dniówkê?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar odsy³a robotników, którzy nie przydaj¹ mu siê w gospodarstwie.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Ci w³aœnie trafiaj¹ do mnie. Ja ich karmiê i dla mnie tutaj pracuj¹.

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

	description	 = 	"Czy ostatnimi czasy dzia³o siê tu coœ dziwnego?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //Czy ostatnimi czasy dzia³o siê tu coœ dziwnego?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Tu zawsze dzieje siê coœ dziwnego.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Jednak najdziwniejsze by³o nag³e znikniêcie Pardosa.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //To jeden z moich parobków. Na pewno nie by³ z tych, co to uciekaj¹ noc¹ bez s³owa.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Zagin¹³ robotnik farmera Bengara, Pardos."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Masz jakieœ sugestie?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Mo¿e ju¿ mu siê znudzi³o?", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Co by³o takiego dziwnego w jego znikniêciu?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Co by³o takiego dziwnego w jego znikniêciu?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos nie by³ zbyt odwa¿ny. Nigdy nie opuszcza³ farmy.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Wystarczy³o, ¿e zobaczy³ chrz¹szcza, a ju¿ bra³ nogi za pas.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Nie s¹ to mo¿e naj³adniejsze stworzenia, ale nie s¹ te¿ niebezpieczne.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //S³ysza³em, ¿e moi ludzie ³api¹ je i jedz¹ ich miêso. Obrzydliwe.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Mo¿na siê do tego przyzwyczaiæ.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Mo¿e ju¿ mu siê znudzi³o?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //Bardzo lubi³ tê pracê, wiêc ciê¿ko mi sobie wyobraziæ, ¿e uciek³.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //U mnie móg³ robiæ, co chcia³, wiêc raczej nie uciek³ do innego farmera.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //Masz jakieœ sugestie?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Przypuszczam, ¿e porwali go bandyci. Ostatnio czêsto tu ich widujemy.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Kiedyœ widzia³em, jak prowadzili ze sob¹ jakiegoœ cz³owieka z miasta.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Wygl¹da³o na to, ¿e nie szed³ z w³asnej woli.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Gdzie ci bandyci maj¹ swój obóz?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Gdzie ci bandyci maj¹ swój obóz?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Za moimi polami znajdziesz wykute w skale schody, które wiod¹ do ma³ej kotliny. Tam siê najpewniej zatrzymali.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Chêtnie bym sam poszuka³ Pardosa, ale nie uœmiecha mi siê spotkanie z tymi bandziorami.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //Na twoim miejscu trzyma³bym siê od nich z daleka. Nie lubi¹ obcych.
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

	description	 = 	"Czy Pardos wróci³?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //Czy Pardos wróci³?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Tak, teraz odpoczywa w domu. Dziêki za wszystko.
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //Nie ma sprawy.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Czekaj, chcia³bym ci siê jakoœ odwdziêczyæ, ale nie mam jak...
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

	description	 = 	"Czy ci bandyci nieœli ze sob¹ jak¹œ broñ?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Czy ci bandyci nieœli ze sob¹ jak¹œ broñ?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //G³upie pytanie. Widzia³eœ kiedyœ nieuzbrojonego rabusia?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Nie chodzi o to. Pytam, czy nie mieli ze sob¹ naprawdê sporego jej zapasu. Du¿ego transportu.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Faktycznie, teraz sobie przypominam. Mieli ze sob¹ naprawdê sporo orê¿a.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //Czêœæ w beczkach, czêœæ w workach, a czêœæ na wozie.
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

	description	 = 	"Co myœlisz o Onarze?";
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
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Co myœlisz o Onarze?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Ach. To chciwy drañ, przez którego nas w koñcu wszystkich powiesz¹.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Pewnego dnia paladyni wyjd¹ z miasta i my, farmerzy, zap³acimy krwi¹ za to, co on tu wyrabia.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Ale nie mam wyboru. Stra¿ przychodzi tu tylko po to, ¿eby zbieraæ podatki. Nie chroni¹ gospodarstwa.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Gdybym by³ lojalny w stosunku do miasta, to w zasadzie zosta³bym sam.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Onar przynajmniej od czasu do czasu wysy³a najemników, ¿eby zobaczyæ, jak nam idzie.
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

	description	 = 	"Co masz przeciwko królewskim ¿o³nierzom?";
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
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Co masz przeciwko królewskim ¿o³nierzom?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //Wszystko! Od czasu, kiedy paladyni pojawili siê w mieœcie, nic siê nie poprawi³o. Wprost przeciwnie.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Teraz ci przeklêci stra¿nicy coraz czêœciej zagl¹daj¹ na nasze ziemie i kradn¹, co im wpadnie w rêce. A paladyni nic z tym nie robi¹.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Jedyni paladyni, jakich widzia³em, to ci dwaj, którzy pilnuj¹ prze³êczy.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Nie rusz¹ siê o krok, nawet gdyby stra¿ nas wszystkich pozarzyna³a.

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

	description	 = 	"Prze³êczy?";
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
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //Prze³êczy?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //Ano. Prze³êczy do starej Górniczej Doliny, ko³o wodospadów po drugiej stronie pastwisk na p³askowy¿u.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Spytaj o to Malaka. W zesz³ym tygodniu by³ tam kilka razy.

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
	description	= "Mam rozwi¹zaæ wasze problemy ze stra¿¹.";
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
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //Mam rozwi¹zaæ wasze problemy ze stra¿¹.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Co? Mówi³em Onarowi, ¿e powinien mi przys³aæ kilku swoich najemników.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //To moja szansa na to, ¿eby siê wykazaæ.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //Rewelacyjnie. Wiesz, co mi zrobi¹ stra¿nicy, jak schrzanisz sprawê?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Ju¿ myœla³em, ¿e nikt nie przyjdzie.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //Mówi³em to Onarowi kilka dni temu. Za co mu p³acê czynsz?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Ci dranie przychodz¹ tu co tydzieñ i zbieraj¹ podatki dla miasta.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Dobrze, ¿e przyszed³eœ w³aœnie teraz. Zazwyczaj zjawiaj¹ siê o tej porze.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //Powinni tu byæ za chwilê.
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
	description	= "Dlaczego sami nie staniecie przeciwko stra¿y?";
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
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Sporo was. Dlaczego sami nie staniecie przeciwko stra¿y?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //To prawda, jest nas wielu. Ale nie jesteœmy zawodowymi ¿o³nierzami jak stra¿nicy.
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
	description	= "Niech no stra¿nicy przyjd¹, zajmê siê nimi!";
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
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Niech no stra¿nicy przyjd¹, zajmê siê nimi!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Nie mogê siê doczekaæ. Nadchodz¹! Widzisz, a nie mówi³em!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Tylko nie nawal!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //No có¿, powodzenia! Poka¿ im.
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
	description	= "Wasze problemy ze stra¿¹ nale¿¹ ju¿ do przesz³oœci.";
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
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //Wasze problemy ze stra¿¹ nale¿¹ ju¿ do przesz³oœci.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Oszala³eœ? Wiesz, co mi zrobi¹, jeœli ciebie nie bêdzie?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Ci¹gle tam stoj¹. Powiedz im, ¿e powinni st¹d CA£KOWICIE znikn¹æ!
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //NieŸle. Teraz mo¿e zostan¹ nam jakieœ drobne na koniec miesi¹ca. Dziêki.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Chcia³eœ nawet za mnie zap³aciæ. To bardzo mi³e z twojej strony.
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

	description	 = 	"Pasterz Balthasar nie mo¿e paœæ owiec na twoich pastwiskach?";
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
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Pasterz Balthasar nie mo¿e paœæ owiec na twoich pastwiskach?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //Ach, o to chodzi. Powiedzia³em mu, ¿e Sekob powinien mi p³aciæ, jeœli chce korzystaæ z moich pastwisk.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Mówi¹c prawdê, to tylko dokuczanie. Po prostu nie cierpiê Balthasara.
	B_LogEntry (TOPIC_BalthasarsSchafe,"Jeœli mam przekonaæ Bengara, aby wpuœci³ Balthasara z powrotem na swoje pastwiska, bêdê musia³ wyœwiadczyæ mu przys³ugê. Na pewno wkrótce nadarzy siê ku temu jakaœ okazja."); 
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

	description	 = 	"Stra¿ników ju¿ nie ma, a Balthasar znowu mo¿e korzystaæ z twoich pastwisk.";
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
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Stra¿ników ju¿ nie ma, a Balthasar znowu mo¿e korzystaæ z twoich pastwisk.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Dlaczego?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //Bo ja tak powiedzia³em.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Hmmm. W porz¹dku, jak sobie ¿yczysz.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //Niech wyprowadza swoje zwierzêta gdzieœ za pola uprawne.

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

	description	 = 	"Trzymaj siê.";
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
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //Trzymaj siê.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Ty te¿.

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

	description	 = 	"Jak wygl¹da sytuacja?";
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
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Jak wygl¹da sytuacja?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak znikn¹³ i zabra³ ze sob¹ wszystko, i wszystkich, którzy mogli dla mnie pracowaæ. Mówi³, ¿e kieruje siê w góry.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //Nie móg³ ju¿ tu wytrzymaæ.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //Czasy s¹ ciê¿kie. Nie wiem, jak d³ugo jeszcze JA to wytrzymam.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Codziennie z prze³êczy wypadaj¹ hordy potworów i grasuj¹ na p³askowy¿u. To mnie wykoñczy.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Gdybym tak mia³ przynajmniej kilku pomocników albo najemników.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //By³ nawet taki jeden, co chcia³ dla mnie pracowaæ. Ale chyba zmieni³ zdanie. Zdaje siê, ¿e nazywa³ siê Wilk.
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar zosta³ na farmie sam. Jego przyjaciel Malak odszed³ i zabra³ ze sob¹ pozosta³ych. Bengar s¹dzi, ¿e schronili siê gdzieœ w górach."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Jego farma zosta³a bez ¿adnej ochrony. Prosi³ mnie o pomoc, wspomnia³ te¿ coœ o najemniku imieniem Wilk. Czy ja przypadkiem nie znam tego cz³owieka?"); 
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

	description	 = 	"Malak nie ¿yje.";
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
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak nie ¿yje.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //A wiêc sytuacja jeszcze bardziej siê pogorszy.
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

	description	 = 	"Znalaz³em ci najemnika.";
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
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Znalaz³em ci najemnika.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Nie mia³em u siebie jeszcze nigdy kogoœ takiego. Mam nadziejê, ¿e to siê uda.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Proszê, weŸ to. S¹dzê, ¿e ci siê przyda.
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

	description	 = 	"Malak wróci³.";
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
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak wróci³.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //Najwy¿sza pora. Myœla³em, ¿e ju¿ nigdy go nie zobaczê.
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

	description	 = 	"Wszystko bêdzie dobrze.";
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
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //Wszystko bêdzie dobrze.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak wróci³, ale sytuacja niewiele siê zmieni³a.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //Jeœli nie zdarzy siê jakiœ cud, wszyscy tu zginiemy.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Wilk to dziwny facet, ale chyba sobie poradzi.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Bez Malaka nic tu nie zostanie zrobione. Jeœli wkrótce coœ siê nie wydarzy, bêdê musia³ opuœciæ swoje gospodarstwo.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Mam nadziejê, ¿e nied³ugo wróci.
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


















































































