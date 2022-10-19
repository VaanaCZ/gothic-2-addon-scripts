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
			AI_Output			(self, other, "DIA_Akil_EXIT_13_02"); //Tak zatím. Rád bych pro tebe udêlal nêco víc.
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
	description	 = 	"Nêjaké problémy?";
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
	AI_Output  (other, self, "DIA_Akil_Hallo_15_00"); //Nêjaké problémy?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_01"); //(potí se) Eh... ne, ne... Všechno v poâádku. (nervóznê) Bylo... bylo by lepší, kdybys hned odešel.
	AI_Output  (other, self, "DIA_Akil_Hallo_15_02"); //Jsi si jistý?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_03"); //Eh... jo, jo... všechno je dobrý. Ty... eh... Já... teë s tebou nemùžu mluvit.
	
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akilùv statek ohrožují žoldáci."); 

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
	AI_Output (self, other, "DIA_Akil_Nichtjetzt_13_00"); //Eh... teë ne, teë s tebou nemùžu mluvit.
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
	AI_Output (self, other, "DIA_Akil_NachKampf_13_01"); //Jmenuju se Akil. Obdêlávám tenhle skromnej kousek pùdy.
	AI_Output (other, self, "DIA_Akil_NachKampf_15_02"); //Kdo byli ti lidé?

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_03"); //Ty bys je mêl znát. Byli to žoldnéâi z Onarovy farmy. Jako ty.
		}
		else
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_04"); //To byli žoldáci z Onarovy farmy. Ty bastardi neznají nic než vraždêní a rabování.
		};
		
	AI_Output (self, other, "DIA_Akil_NachKampf_13_05"); //Obával jsem se nejhoršího.
	AI_Output (self, other, "DIA_Akil_NachKampf_13_06"); //(hluboký povzdech)... Dobrá, díky Innosovi, žes nepâišel pozdê. Âekni mi, proè jsi to pro mê udêlal?
	
	Info_ClearChoices (DIA_Akil_NachKampf);
	Info_AddChoice (DIA_Akil_NachKampf,"Jen tak. Prostê abys to pâeèkal ve zdraví.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice (DIA_Akil_NachKampf,"Co takhle trochu zlata?",DIA_Akil_NachKampf_Gold);
	
	Npc_ExchangeRoutine	(self,"Zaèít"); 

	self.flags = 0;

	if ((Hlp_IsValidNpc (Kati))
	&& (!Npc_IsDead (Kati)))
	{
		Npc_ExchangeRoutine	(Kati,"Zaèít");
		AI_ContinueRoutine (Kati);
		Kati.flags = 0;
	};
	
	if ((Hlp_IsValidNpc (Randolph))
	&& (!Npc_IsDead (Randolph)))
	{
		Npc_ExchangeRoutine	(Randolph,"Zaèít");
		AI_ContinueRoutine (Randolph);
		Randolph.flags = 0;
	};
	
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP (XP_Ambient);
};
FUNC VOID DIA_Akil_NachKampf_Ehre()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Ehre_15_00"); //Jen tak. Prostê abys to pâeèkal ve zdraví.
	AI_Output (self, other, "DIA_Akil_NachKampf_Ehre_13_01"); //Takoví chlapi se už jen tak nevidí. Aã tê na tvých cestách Innos provází.
	
	B_GivePlayerXP (XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices (DIA_Akil_NachKampf);
};
FUNC VOID DIA_Akil_NachKampf_Gold()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Gold_15_00"); //Co takhle trochu zlata?
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_01"); //Je mi líto, ale asi tê zklamu - jsme jen chudí farmáâi. Je to tak akorát pro skromné živobytí.
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_02"); //Všechno, co ti mùžu nabídnout, je nêco k jídlu. Zajdi za Kati, aã se o tebe postará.
	
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
	description	 = 	"Co po tobê ti žoldáci chtêli?";
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
	AI_Output (other, self, "DIA_Akil_Soeldner_15_00"); //Co po tobê ti žoldáci chtêli?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_01"); //Ty si ze mê utahuješ. Chtêli ode mê vybrat nájem.
		}
	else
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_02"); //Ty to nevíš? Najal je Onar, ten velkostatkáâ. Hlídají jeho farmu a vybírají pro nêj renty.
				AI_Output (self, other, "DIA_Akil_Soeldner_13_03"); //To znamená, že chodí od farmy k farmê a berou si vše, co se jim líbí. A jediné, èím platí, je chuã jejich oceli.
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

	description	 = 	"Nezaslechl jsi nêco o pohâešovaných lidech z mêsta?";
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
	AI_Output	(other, self, "DIA_Addon_Akil_MissingPeople_15_00"); //Nevíš nêco o tom, že se tu ztratili nêjací lidé?
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_01"); //To bys mê rozesmál! Jestli jsem o tom slyšel? Vždyã se mi ztratilo i pár mých vlastních lidí!
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_02"); //Tonak a Telbor pracovali na mých polích, ale pâed tâemi dny najednou zmizeli.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_03"); //Vím urèitê, že ještê ráno úplnê normálnê odcházeli ze statku.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_04"); //Prostê zmizeli a nikdo neví, kam mohli jít.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_05"); //Kdybys na nê nêkde narazil, dáš mi vêdêt, vië že jo?
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Sedlák Akil postrádá dva èeledíny, Tonaka a Telbora."); 

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
	description	 = 	"K têm tvým èeledínùm...";
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
	AI_Output	(other, self, "DIA_Addon_Akil_ReturnPeople_15_00"); //Co se týèe têch tvých pacholkù...
	
	if (Npc_GetDistToWP (Tonak_NW,"NW_FARM2_FIELD_TANOK")<= 1000)
	&& (Npc_GetDistToWP (Telbor_NW,"NW_FARM2_FIELD_TELBOR")<= 1000)
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_01"); //Tys je pâivedl zpátky! Seš dobrej chlap.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_02"); //Aspoà jeden z nich pâežil.
	};
	AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_03"); //Vezmi si tohle zlato, abys vidêl, že jsem ti opravdu vdêèný.
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
	description	 = 	"Posílá mê Baltram.";
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
	AI_Output (other, self, "DIA_Akil_Lieferung_15_00"); //Poslal mê Baltram. Mám tu pro nêj vyzvednout nêjaký balík.
	AI_Output (self, other, "DIA_Akil_Lieferung_13_01"); //Tak ty jsi teë jeho nový poslíèek. Fajn, už jsem to pâipravil.
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
	description	 = 	"Urèitê se tady kolem vyznáš.";
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
	AI_Output (other, self, "DIA_Akil_Gegend_15_00"); //Urèitê se tady kolem vyznáš.
	AI_Output (self, other, "DIA_Akil_Gegend_13_01"); //Jasnê, co potâebuješ vêdêt?
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
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_01"); //Staèí se vrátit ke kamenným schodùm a jít po cestê na východ.
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_02"); //Stejnou cestou se dostaneš i do krèmy. Odsud pùjdeš dál na východ, dokud nedorazíš k obrovským lánùm. To je místo, kde se poflakují žoldáci.
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
	description	 = 	"Co je to za krèmu na východ odsud?";
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
	AI_Output (other, self, "DIA_Akil_Gegend_Taverne_15_00"); //Co je to za krèmu na východ odsud?
	AI_Output (self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Zeptej se Randolpha. Ví o tom víc než já. Nêkolikrát se tam stavil.
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
	description	 = 	"Co je v têch lesích za farmou?";
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
	AI_Output (other, self, "DIA_Akil_Gegend_Wald_15_00"); //Co je v têch lesích za farmou?
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_01"); //Jenom nêjaký pâíšery - a vlci jsou z nich ty nejmíà nebezpeèný.
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_02"); //Taky se povídá, že tam má úkryt nêkolik banditù. No, ale už pêknê dlouho nechali moji farmu na pokoji.
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

	description	 = 	"Stalo se ještê nêco?";
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
	AI_Output (other, self, "DIA_Akil_Perm_15_00"); //Stalo se ještê nêco?

	if (Kapitel == 3)
	{
		if (MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_01"); //Ne. Doufám, že ovce zùstanou tam, co jsou teë.
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
			AI_Output (self, other, "DIA_Akil_Perm_13_03"); //Všude se objevují skâeti. Kdosi nêco âíkal o jejich základnê. Zeptej se na to farmáâe Lobarta.

		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_04"); //Taky tu spatâili spoustu ještêrù. Být tebou, do jeskyní bych vùbec nechodil.

		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_05"); //Hledají tê zakuklenci v èerných kápích.
			AI_Output (other, self, "DIA_Akil_Perm_15_06"); //No tak to je novinka.
			AI_Output (self, other, "DIA_Akil_Perm_13_07"); //Dobrá. Prostê jsem myslel, že bych se o tom mêl zmínit.
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

	description	 = 	"Ještê nêjaké novinky?";
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
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_15_00"); //Ještê nêjaký zprávy?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_13_01"); //Poslední dobou mi poâád nêkdo krade ovce. Už celé noci jsem se poâádnê nevyspal.

	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "To není mùj problém.", DIA_Akil_SCHAFDIEB_nein );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "Kolik ovcí ti chybí?", DIA_Akil_SCHAFDIEB_wieviel );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "Kdo by to mohl dêlat?", DIA_Akil_SCHAFDIEB_wer );
	MIS_Akil_SchafDiebe	= LOG_RUNNING;
	Log_CreateTopic (TOPIC_AkilSchafDiebe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilSchafDiebe,"Akilovi nêkdo stále krade ovce. Domnívá se, že to mají na svêdomí banditi z jeskynê v nedalekém lese."); 
};

func void DIA_Akil_SCHAFDIEB_wer ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wer_15_00"); //Kdo by to mohl dêlat?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_01"); //Tak to nemám ani tušení.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_02"); //Nêjaký fakt odporný chlápci se usadili v jeskyních za tím lesem.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_03"); //Nechce se mi vêâit, že by se živili jen bobulema. Jsem si skoro jistej, že oni jsou ten dùvod, proè se mi ztrácejí ovce.
	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wieviel_15_00"); //Kolik ovcí ti chybí?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wieviel_13_01"); //Teë se mi ztratily minimálnê tâi.

};

func void DIA_Akil_SCHAFDIEB_nein ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_nein_15_00"); //To není mùj problém.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_nein_13_01"); //Rozumím. Máš na práci jiné vêci.
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

	description	 = 	"Našel jsem ty zlodêje ovcí.";
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
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_00"); //Našel jsem ty zlodêje ovcí.
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_01"); //Mêl jsi pravdu. Dêlali to ti chlápci z lesní jeskynê. Už ti žádnou další ovci nevezmou.

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
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_04"); //Díky. Vážnê jsi divnej žoldák. Vùbec ne jako ti ostatní, co znám.
			};
		
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_05"); //Vezmi si tohle jako malé vyjádâení mých díkù za tvou nezištnou pomoc.

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
	AI_Output			(self, other, "DIA_Akil_AkilsSchaf_13_01"); //Výbornê. Tady máš trochu zlata. Doufám, že to staèí.
	
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


























































