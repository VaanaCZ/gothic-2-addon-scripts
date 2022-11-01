///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_EXIT		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	999;
	condition	 = 	DIA_Akil_EXIT_Condition;
	information	 = 	DIA_Akil_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Akil_EXIT_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Akil_EXIT_Info ()
{
	AI_Output			(other, self, "DIA_Akil_EXIT_15_00"); //Už musím jít.

	if (Akil_Sauer == TRUE)
		{
			AI_Output			(self, other, "DIA_Akil_EXIT_13_01"); //Nenech se zdržovat.
		}
	else
		{
			AI_Output			(self, other, "DIA_Akil_EXIT_13_02"); //Tak zatím. Rád bych pro tebe udęlal nęco víc.
		};
		
		AI_StopProcessInfos (self);
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo mit Söldnern
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Hallo	(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	4;
	condition	 = 	DIA_Akil_Hallo_Condition;
	information	 = 	DIA_Akil_Hallo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Nęjaké problémy?";
};
func int DIA_Akil_Hallo_Condition ()
{
	if 	!(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))	
	{
		return TRUE;
	};
};
func void DIA_Akil_Hallo_Info ()
{
	AI_Output  (other, self, "DIA_Akil_Hallo_15_00"); //Nęjaké problémy?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_01"); //(potí se) Eh... ne, ne... Všechno v poâádku. (nervóznę) Bylo... bylo by lepší, kdybys hned odešel.
	AI_Output  (other, self, "DIA_Akil_Hallo_15_02"); //Jsi si jistý?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_03"); //Eh... jo, jo... všechno je dobrý. Ty... eh... Já... teë s tebou nemůžu mluvit.
	
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akilův statek ohrožují žoldáci."); 

	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info Kann nicht reden
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Nichtjetzt		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	7;
	condition	 = 	DIA_Akil_Nichtjetzt_Condition;
	information	 = 	DIA_Akil_Nichtjetzt_Info;
	permanent    =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Akil_Nichtjetzt_Condition ()
{
	if 	  Npc_IsInState (self, ZS_Talk)
	&&  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))
	&&    Npc_KnowsInfo (other, DIA_Akil_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Akil_Nichtjetzt_Info ()
{
	AI_Output (self, other, "DIA_Akil_Nichtjetzt_13_00"); //Eh... teë ne, teë s tebou nemůžu mluvit.
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info Nach dem Kampf 
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_NachKampf		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	5;
	condition	 = 	DIA_Akil_NachKampf_Condition;
	information	 = 	DIA_Akil_NachKampf_Info;
	permanent	 =  FALSE; 
	important 	 = 	TRUE;
};
func int DIA_Akil_NachKampf_Condition ()
{
	if 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))
	{
		return TRUE;
	};
};
func void DIA_Akil_NachKampf_Info ()
{
	AI_Output (self, other, "DIA_Akil_NachKampf_13_00"); //Díky Innosovi. Už jsem si myslel, že je se mnou konec.
	AI_Output (self, other, "DIA_Akil_NachKampf_13_01"); //Jmenuju se Akil. Obdęlávám tenhle skromnej kousek půdy.
	AI_Output (other, self, "DIA_Akil_NachKampf_15_02"); //Kdo byli ti lidé?

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_03"); //Ty bys je męl znát. Byli to žoldnéâi z Onarovy farmy. Jako ty.
		}
		else
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_04"); //To byli žoldáci z Onarovy farmy. Ty bastardi neznají nic než vraždęní a rabování.
		};
		
	AI_Output (self, other, "DIA_Akil_NachKampf_13_05"); //Obával jsem se nejhoršího.
	AI_Output (self, other, "DIA_Akil_NachKampf_13_06"); //(hluboký povzdech)... Dobrá, díky Innosovi, žes nepâišel pozdę. Âekni mi, proč jsi to pro mę udęlal?
	
	Info_ClearChoices (DIA_Akil_NachKampf);
	Info_AddChoice (DIA_Akil_NachKampf,"Jen tak. Prostę abys to pâečkal ve zdraví.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice (DIA_Akil_NachKampf,"Co takhle trochu zlata?",DIA_Akil_NachKampf_Gold);
	
	Npc_ExchangeRoutine	(self,"Začít"); 

	self.flags = 0;

	if ((Hlp_IsValidNpc (Kati))
	&& (!Npc_IsDead (Kati)))
	{
		Npc_ExchangeRoutine	(Kati,"Začít");
		AI_ContinueRoutine (Kati);
		Kati.flags = 0;
	};
	
	if ((Hlp_IsValidNpc (Randolph))
	&& (!Npc_IsDead (Randolph)))
	{
		Npc_ExchangeRoutine	(Randolph,"Začít");
		AI_ContinueRoutine (Randolph);
		Randolph.flags = 0;
	};
	
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP (XP_Ambient);
};
FUNC VOID DIA_Akil_NachKampf_Ehre()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Ehre_15_00"); //Jen tak. Prostę abys to pâečkal ve zdraví.
	AI_Output (self, other, "DIA_Akil_NachKampf_Ehre_13_01"); //Takoví chlapi se už jen tak nevidí. Aă tę na tvých cestách Innos provází.
	
	B_GivePlayerXP (XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices (DIA_Akil_NachKampf);
};
FUNC VOID DIA_Akil_NachKampf_Gold()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Gold_15_00"); //Co takhle trochu zlata?
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_01"); //Je mi líto, ale asi tę zklamu - jsme jen chudí farmáâi. Je to tak akorát pro skromné živobytí.
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_02"); //Všechno, co ti můžu nabídnout, je nęco k jídlu. Zajdi za Kati, aă se o tebe postará.
	
	B_GivePlayerXP (XP_Akil_SLDWegVomHof);
	Info_ClearChoices (DIA_Akil_NachKampf);
	Kati_Mahlzeit = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info infos
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Soeldner		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	7;
	condition	 = 	DIA_Akil_Soeldner_Condition;
	information	 = 	DIA_Akil_Soeldner_Info;
	permanent    =  FALSE;
	description	 = 	"Co po tobę ti žoldáci chtęli?";
};

func int DIA_Akil_Soeldner_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};
func void DIA_Akil_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Akil_Soeldner_15_00"); //Co po tobę ti žoldáci chtęli?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_01"); //Ty si ze mę utahuješ. Chtęli ode mę vybrat nájem.
		}
	else
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_02"); //Ty to nevíš? Najal je Onar, ten velkostatkáâ. Hlídají jeho farmu a vybírají pro nęj renty.
				AI_Output (self, other, "DIA_Akil_Soeldner_13_03"); //To znamená, že chodí od farmy k farmę a berou si vše, co se jim líbí. A jediné, čím platí, je chuă jejich oceli.
		};
};
///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Akil_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Akil_MissingPeople_Condition;
	information	 = 	DIA_Addon_Akil_MissingPeople_Info;

	description	 = 	"Nezaslechl jsi nęco o pohâešovaných lidech z męsta?";
};

func int DIA_Addon_Akil_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Akil_NachKampf))
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Akil_MissingPeople_15_00"); //Nevíš nęco o tom, že se tu ztratili nęjací lidé?
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_01"); //To bys mę rozesmál! Jestli jsem o tom slyšel? Vždyă se mi ztratilo i pár mých vlastních lidí!
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_02"); //Tonak a Telbor pracovali na mých polích, ale pâed tâemi dny najednou zmizeli.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_03"); //Vím určitę, že ještę ráno úplnę normálnę odcházeli ze statku.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_04"); //Prostę zmizeli a nikdo neví, kam mohli jít.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_05"); //Kdybys na nę nękde narazil, dáš mi vędęt, vië že jo?
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Sedlák Akil postrádá dva čeledíny, Tonaka a Telbora."); 

	MIS_Akil_BringMissPeopleBack = LOG_RUNNING;
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Akil_ReturnPeople		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Akil_ReturnPeople_Condition;
	information	 = 	DIA_Addon_Akil_ReturnPeople_Info;
	permanent	 =  FALSE;
	description	 = 	"K tęm tvým čeledínům...";
};

func int DIA_Addon_Akil_ReturnPeople_Condition ()
{
	if (MIS_Akil_BringMissPeopleBack == LOG_RUNNING) 
	&& (MissingPeopleReturnedHome == TRUE)
	&& ((Npc_GetDistToWP (Tonak_NW,"NW_FARM2_FIELD_TANOK")<= 1000) || (Npc_GetDistToWP (Telbor_NW,"NW_FARM2_FIELD_TELBOR")<= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Akil_ReturnPeople_15_00"); //Co se týče tęch tvých pacholků...
	
	if (Npc_GetDistToWP (Tonak_NW,"NW_FARM2_FIELD_TANOK")<= 1000)
	&& (Npc_GetDistToWP (Telbor_NW,"NW_FARM2_FIELD_TELBOR")<= 1000)
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_01"); //Tys je pâivedl zpátky! Seš dobrej chlap.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_02"); //Aspoŕ jeden z nich pâežil.
	};
	AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_03"); //Vezmi si tohle zlato, abys vidęl, že jsem ti opravdu vdęčný.
	B_GiveInvItems (self, other, itmi_Gold, 100);
	
	B_GivePlayerXP (XP_Ambient);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
};
///////////////////////////////////////////////////////////////////////
//	Info Baltrams Lieferung
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Lieferung		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Lieferung_Condition;
	information	 = 	DIA_Akil_Lieferung_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"Posílá mę Baltram.";
};

func int DIA_Akil_Lieferung_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Akil_NachKampf)
	&& (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Akil_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Akil_Lieferung_15_00"); //Poslal mę Baltram. Mám tu pro nęj vyzvednout nęjaký balík.
	AI_Output (self, other, "DIA_Akil_Lieferung_13_01"); //Tak ty jsi teë jeho nový poslíček. Fajn, už jsem to pâipravil.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
	
	B_LogEntry (TOPIC_Baltram, "Získal jsem tu zásilku. Teë už ji mohu pâinést Baltramovi.");
	B_LogEntry (TOPIC_Nagur,   "Získal jsem tu zásilku. Teë už ji mohu pâinést Nagurovi.");
};

///////////////////////////////////////////////////////////////////////
//	Info Die Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Gegend		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	90;
	condition	 = 	DIA_Akil_Gegend_Condition;
	information	 = 	DIA_Akil_Gegend_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"Určitę se tady kolem vyznáš.";
};

func int DIA_Akil_Gegend_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Akil_Soeldner)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
//-------------------------------
var int Knows_Taverne;
//-------------------------------
func void DIA_Akil_Gegend_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_15_00"); //Určitę se tady kolem vyznáš.
	AI_Output (self, other, "DIA_Akil_Gegend_13_01"); //Jasnę, co potâebuješ vędęt?
};
/*
FUNC VOID DIA_Akil_Gegend_BACK()
{
	Info_ClearChoices (DIA_Akil_Gegend);
};
FUNC VOID DIA_Akil_Gegend_Onar()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Onar_15_00"); //Wo finde ich den Hof von Onar?
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_01"); //Geh einfach wieder die Steinstufen runter und folge dem Weg weiter nach Osten.
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_02"); //Irgendwann kommt eine Taverne. Da gehst du weiter nach Osten bis du zu den großen Feldern kommst. Da lungern dann schon die Söldner rum.
	Knows_Taverne = TRUE;
};
FUNC VOID DIA_Akil_Gegend_Wald()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Wald_15_00"); //Was finde ich in dem Wald hinter deinem Hof?
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_01"); //Da gibt's nur jede Menge Monster - wobei die Wölfe noch die ungefährlichsten sind.
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_02"); //Angeblich sollen da auch ein paar Banditen ihre Höhle haben. Na - meinen Hof haben sie bis jetzt in Ruhe gelassen.
};
FUNC VOID DIA_Akil_Gegend_Taverne ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Taverne_15_00"); //Was ist das für eine Taverne im Osten?
	AI_Output (self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Frag mal Randolph. Er weiß mehr darüber als ich. Er war schon ein paar mal dort.
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Onars Hof
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Hof		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Hof_Condition;
	information	 = 	DIA_Akil_Hof_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"Kde najdu Onarovu farmu?";
};

func int DIA_Akil_Hof_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Akil_Gegend)
	{
		return TRUE;
	};
};
func void DIA_Akil_Hof_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Onar_15_00"); //Kde najdu Onarovu farmu?
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_01"); //Stačí se vrátit ke kamenným schodům a jít po cestę na východ.
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_02"); //Stejnou cestou se dostaneš i do krčmy. Odsud půjdeš dál na východ, dokud nedorazíš k obrovským lánům. To je místo, kde se poflakují žoldáci.
	Knows_Taverne = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Taverne
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Taverne		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Taverne_Condition;
	information	 = 	DIA_Akil_Taverne_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"Co je to za krčmu na východ odsud?";
};

func int DIA_Akil_Taverne_Condition ()
{
	if (Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Akil_Taverne_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Taverne_15_00"); //Co je to za krčmu na východ odsud?
	AI_Output (self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Zeptej se Randolpha. Ví o tom víc než já. Nękolikrát se tam stavil.
};
///////////////////////////////////////////////////////////////////////
//	Info Wald
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Wald		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Wald_Condition;
	information	 = 	DIA_Akil_Wald_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"Co je v tęch lesích za farmou?";
};
func int DIA_Akil_Wald_Condition ()
{

	if  Npc_KnowsInfo(other, DIA_Akil_Gegend)
	{
		return TRUE;
	};

};
func void DIA_Akil_Wald_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Wald_15_00"); //Co je v tęch lesích za farmou?
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_01"); //Jenom nęjaký pâíšery - a vlci jsou z nich ty nejmíŕ nebezpečný.
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_02"); //Taky se povídá, že tam má úkryt nękolik banditů. No, ale už pęknę dlouho nechali moji farmu na pokoji.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Perm		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	32;
	condition	 = 	DIA_Akil_Perm_Condition;
	information	 = 	DIA_Akil_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Stalo se ještę nęco?";
};

func int DIA_Akil_Perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Akil_Soeldner))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Akil_Perm_Info ()
{
	AI_Output (other, self, "DIA_Akil_Perm_15_00"); //Stalo se ještę nęco?

	if (Kapitel == 3)
	{
		if (MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_01"); //Ne. Doufám, že ovce zůstanou tam, co jsou teë.
		}
		else
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_02"); //Moje ovce zmizely. Za chvíli nebudu mít co do úst.
		};
	}
	else //Kapitel 4 & 5
	{
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_03"); //Všude se objevují skâeti. Kdosi nęco âíkal o jejich základnę. Zeptej se na to farmáâe Lobarta.

		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_04"); //Taky tu spatâili spoustu ještęrů. Být tebou, do jeskyní bych vůbec nechodil.

		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_05"); //Hledají tę zakuklenci v černých kápích.
			AI_Output (other, self, "DIA_Akil_Perm_15_06"); //No tak to je novinka.
			AI_Output (self, other, "DIA_Akil_Perm_13_07"); //Dobrá. Prostę jsem myslel, že bych se o tom męl zmínit.
		};		
	};
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

INSTANCE DIA_Akil_KAP3_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP3_EXIT_Condition;
	information	= DIA_Akil_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchafDieb
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_SCHAFDIEB		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	2;
	condition	 = 	DIA_Akil_SCHAFDIEB_Condition;
	information	 = 	DIA_Akil_SCHAFDIEB_Info;

	description	 = 	"Ještę nęjaké novinky?";
};

func int DIA_Akil_SCHAFDIEB_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Akil_SCHAFDIEB_Info ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_15_00"); //Ještę nęjaký zprávy?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_13_01"); //Poslední dobou mi poâád nękdo krade ovce. Už celé noci jsem se poâádnę nevyspal.

	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "To není můj problém.", DIA_Akil_SCHAFDIEB_nein );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "Kolik ovcí ti chybí?", DIA_Akil_SCHAFDIEB_wieviel );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "Kdo by to mohl dęlat?", DIA_Akil_SCHAFDIEB_wer );
	MIS_Akil_SchafDiebe	= LOG_RUNNING;
	Log_CreateTopic (TOPIC_AkilSchafDiebe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilSchafDiebe,"Akilovi nękdo stále krade ovce. Domnívá se, že to mají na svędomí banditi z jeskynę v nedalekém lese."); 
};

func void DIA_Akil_SCHAFDIEB_wer ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wer_15_00"); //Kdo by to mohl dęlat?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_01"); //Tak to nemám ani tušení.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_02"); //Nęjaký fakt odporný chlápci se usadili v jeskyních za tím lesem.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_03"); //Nechce se mi vęâit, že by se živili jen bobulema. Jsem si skoro jistej, že oni jsou ten důvod, proč se mi ztrácejí ovce.
	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wieviel_15_00"); //Kolik ovcí ti chybí?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wieviel_13_01"); //Teë se mi ztratily minimálnę tâi.

};

func void DIA_Akil_SCHAFDIEB_nein ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_nein_15_00"); //To není můj problém.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_nein_13_01"); //Rozumím. Máš na práci jiné vęci.
	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);

};

///////////////////////////////////////////////////////////////////////
//	Info Schafdiebeplatt
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_SCHAFDIEBEPLATT		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	2;
	condition	 = 	DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information	 = 	DIA_Akil_SCHAFDIEBEPLATT_Info;

	description	 = 	"Našel jsem ty zlodęje ovcí.";
};

func int DIA_Akil_SCHAFDIEBEPLATT_Condition ()
{
	if (Kapitel >= 3)
	&& (MIS_Akil_SchafDiebe == LOG_RUNNING)
	&& (Npc_IsDead(BDT_1025_Bandit_H)) 
	&& (Npc_IsDead(BDT_1026_Bandit_H)) 
	&& (Npc_IsDead(BDT_1027_Bandit_H)) 
		{
				return TRUE;
		};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_00"); //Našel jsem ty zlodęje ovcí.
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_01"); //Męl jsi pravdu. Dęlali to ti chlápci z lesní jeskynę. Už ti žádnou další ovci nevezmou.

	if 		((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_02"); //Díky ti, šlechetný služebníku Innose.
			}
	else if (hero.guild == GIL_MIL)
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_03"); //Díky. Tak se pâece jen domobrana dokáže postarat o nás, malé farmáâe.
			}
	else 
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_04"); //Díky. Vážnę jsi divnej žoldák. Vůbec ne jako ti ostatní, co znám.
			};
		
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_05"); //Vezmi si tohle jako malé vyjádâení mých díků za tvou nezištnou pomoc.

	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
	MIS_Akil_SchafDiebe	= LOG_SUCCESS;
	B_GivePlayerXP (XP_Akil_SchafDiebe);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsSchaf
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_AkilsSchaf		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	2;
	condition	 = 	DIA_Akil_AkilsSchaf_Condition;
	information	 = 	DIA_Akil_AkilsSchaf_Info;

	description	 = 	"(Vrátit Akilovi ovci.)";
};

func int DIA_Akil_AkilsSchaf_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_GetDistToNpc(self, Follow_Sheep_AKIL) < 1000 )
	&& (MIS_Akil_SchafDiebe != 0)
		{
				return TRUE;
		};
};

func void DIA_Akil_AkilsSchaf_Info ()
{
	//Joly: AI_Output			(other, self, "DIA_Akil_AkilsSchaf_15_00"); //Ich habe die Schafdiebe gefunden.
	AI_Output			(self, other, "DIA_Akil_AkilsSchaf_13_01"); //Výbornę. Tady máš trochu zlata. Doufám, že to stačí.
	
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
	
	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler; 
	
	B_GivePlayerXP (XP_AkilsSchaf);
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

INSTANCE DIA_Akil_KAP4_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP4_EXIT_Condition;
	information	= DIA_Akil_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP4_EXIT_Info()
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

INSTANCE DIA_Akil_KAP5_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP5_EXIT_Condition;
	information	= DIA_Akil_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP5_EXIT_Info()
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


INSTANCE DIA_Akil_KAP6_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP6_EXIT_Condition;
	information	= DIA_Akil_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Akil_PICKPOCKET (C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 900;
	condition	= DIA_Akil_PICKPOCKET_Condition;
	information	= DIA_Akil_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Akil_PICKPOCKET_Condition()
{
	C_Beklauen (37, 30);
};
 
FUNC VOID DIA_Akil_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Akil_PICKPOCKET);
	Info_AddChoice		(DIA_Akil_PICKPOCKET, DIALOG_BACK 		,DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Akil_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Akil_PICKPOCKET);
};
	
func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Akil_PICKPOCKET);
};


























































