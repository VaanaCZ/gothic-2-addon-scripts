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
	AI_Output			(other, self, "DIA_Akil_EXIT_15_00"); //U� mus�m j�t.

	if (Akil_Sauer == TRUE)
		{
			AI_Output			(self, other, "DIA_Akil_EXIT_13_01"); //Nenech se zdr�ovat.
		}
	else
		{
			AI_Output			(self, other, "DIA_Akil_EXIT_13_02"); //Tak zat�m. R�d bych pro tebe ud�lal n�co v�c.
		};
		
		AI_StopProcessInfos (self);
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo mit S�ldnern
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Hallo	(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	4;
	condition	 = 	DIA_Akil_Hallo_Condition;
	information	 = 	DIA_Akil_Hallo_Info;
	permanent	 = 	FALSE;
	description	 = 	"N�jak� probl�my?";
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
	AI_Output  (other, self, "DIA_Akil_Hallo_15_00"); //N�jak� probl�my?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_01"); //(pot� se) Eh... ne, ne... V�echno v po��dku. (nerv�zn�) Bylo... bylo by lep��, kdybys hned ode�el.
	AI_Output  (other, self, "DIA_Akil_Hallo_15_02"); //Jsi si jist�?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_03"); //Eh... jo, jo... v�echno je dobr�. Ty... eh... J�... te� s tebou nem��u mluvit.
	
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akil�v statek ohro�uj� �old�ci."); 

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
	AI_Output (self, other, "DIA_Akil_Nichtjetzt_13_00"); //Eh... te� ne, te� s tebou nem��u mluvit.
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
	AI_Output (self, other, "DIA_Akil_NachKampf_13_00"); //D�ky Innosovi. U� jsem si myslel, �e je se mnou konec.
	AI_Output (self, other, "DIA_Akil_NachKampf_13_01"); //Jmenuju se Akil. Obd�l�v�m tenhle skromnej kousek p�dy.
	AI_Output (other, self, "DIA_Akil_NachKampf_15_02"); //Kdo byli ti lid�?

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_03"); //Ty bys je m�l zn�t. Byli to �oldn��i z Onarovy farmy. Jako ty.
		}
		else
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_04"); //To byli �old�ci z Onarovy farmy. Ty bastardi neznaj� nic ne� vra�d�n� a rabov�n�.
		};
		
	AI_Output (self, other, "DIA_Akil_NachKampf_13_05"); //Ob�val jsem se nejhor��ho.
	AI_Output (self, other, "DIA_Akil_NachKampf_13_06"); //(hlubok� povzdech)... Dobr�, d�ky Innosovi, �es nep�i�el pozd�. �ekni mi, pro� jsi to pro m� ud�lal?
	
	Info_ClearChoices (DIA_Akil_NachKampf);
	Info_AddChoice (DIA_Akil_NachKampf,"Jen tak. Prost� abys to p�e�kal ve zdrav�.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice (DIA_Akil_NachKampf,"Co takhle trochu zlata?",DIA_Akil_NachKampf_Gold);
	
	Npc_ExchangeRoutine	(self,"Za��t"); 

	self.flags = 0;

	if ((Hlp_IsValidNpc (Kati))
	&& (!Npc_IsDead (Kati)))
	{
		Npc_ExchangeRoutine	(Kati,"Za��t");
		AI_ContinueRoutine (Kati);
		Kati.flags = 0;
	};
	
	if ((Hlp_IsValidNpc (Randolph))
	&& (!Npc_IsDead (Randolph)))
	{
		Npc_ExchangeRoutine	(Randolph,"Za��t");
		AI_ContinueRoutine (Randolph);
		Randolph.flags = 0;
	};
	
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP (XP_Ambient);
};
FUNC VOID DIA_Akil_NachKampf_Ehre()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Ehre_15_00"); //Jen tak. Prost� abys to p�e�kal ve zdrav�.
	AI_Output (self, other, "DIA_Akil_NachKampf_Ehre_13_01"); //Takov� chlapi se u� jen tak nevid�. A� t� na tv�ch cest�ch Innos prov�z�.
	
	B_GivePlayerXP (XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices (DIA_Akil_NachKampf);
};
FUNC VOID DIA_Akil_NachKampf_Gold()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Gold_15_00"); //Co takhle trochu zlata?
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_01"); //Je mi l�to, ale asi t� zklamu - jsme jen chud� farm��i. Je to tak akor�t pro skromn� �ivobyt�.
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_02"); //V�echno, co ti m��u nab�dnout, je n�co k j�dlu. Zajdi za Kati, a� se o tebe postar�.
	
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
	description	 = 	"Co po tob� ti �old�ci cht�li?";
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
	AI_Output (other, self, "DIA_Akil_Soeldner_15_00"); //Co po tob� ti �old�ci cht�li?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_01"); //Ty si ze m� utahuje�. Cht�li ode m� vybrat n�jem.
		}
	else
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_02"); //Ty to nev�? Najal je Onar, ten velkostatk��. Hl�daj� jeho farmu a vyb�raj� pro n�j renty.
				AI_Output (self, other, "DIA_Akil_Soeldner_13_03"); //To znamen�, �e chod� od farmy k farm� a berou si v�e, co se jim l�b�. A jedin�, ��m plat�, je chu� jejich oceli.
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

	description	 = 	"Nezaslechl jsi n�co o poh�e�ovan�ch lidech z m�sta?";
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
	AI_Output	(other, self, "DIA_Addon_Akil_MissingPeople_15_00"); //Nev� n�co o tom, �e se tu ztratili n�jac� lid�?
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_01"); //To bys m� rozesm�l! Jestli jsem o tom sly�el? V�dy� se mi ztratilo i p�r m�ch vlastn�ch lid�!
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_02"); //Tonak a Telbor pracovali na m�ch pol�ch, ale p�ed t�emi dny najednou zmizeli.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_03"); //V�m ur�it�, �e je�t� r�no �pln� norm�ln� odch�zeli ze statku.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_04"); //Prost� zmizeli a nikdo nev�, kam mohli j�t.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_05"); //Kdybys na n� n�kde narazil, d� mi v�d�t, vi� �e jo?
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Sedl�k Akil postr�d� dva �eled�ny, Tonaka a Telbora."); 

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
	description	 = 	"K t�m tv�m �eled�n�m...";
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
	AI_Output	(other, self, "DIA_Addon_Akil_ReturnPeople_15_00"); //Co se t��e t�ch tv�ch pacholk�...
	
	if (Npc_GetDistToWP (Tonak_NW,"NW_FARM2_FIELD_TANOK")<= 1000)
	&& (Npc_GetDistToWP (Telbor_NW,"NW_FARM2_FIELD_TELBOR")<= 1000)
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_01"); //Tys je p�ivedl zp�tky! Se� dobrej chlap.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_02"); //Aspo� jeden z nich p�e�il.
	};
	AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_03"); //Vezmi si tohle zlato, abys vid�l, �e jsem ti opravdu vd��n�.
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
	description	 = 	"Pos�l� m� Baltram.";
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
	AI_Output (other, self, "DIA_Akil_Lieferung_15_00"); //Poslal m� Baltram. M�m tu pro n�j vyzvednout n�jak� bal�k.
	AI_Output (self, other, "DIA_Akil_Lieferung_13_01"); //Tak ty jsi te� jeho nov� posl��ek. Fajn, u� jsem to p�ipravil.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
	
	B_LogEntry (TOPIC_Baltram, "Z�skal jsem tu z�silku. Te� u� ji mohu p�in�st Baltramovi.");
	B_LogEntry (TOPIC_Nagur,   "Z�skal jsem tu z�silku. Te� u� ji mohu p�in�st Nagurovi.");
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
	description	 = 	"Ur�it� se tady kolem vyzn�.";
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
	AI_Output (other, self, "DIA_Akil_Gegend_15_00"); //Ur�it� se tady kolem vyzn�.
	AI_Output (self, other, "DIA_Akil_Gegend_13_01"); //Jasn�, co pot�ebuje� v�d�t?
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
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_02"); //Irgendwann kommt eine Taverne. Da gehst du weiter nach Osten bis du zu den gro�en Feldern kommst. Da lungern dann schon die S�ldner rum.
	Knows_Taverne = TRUE;
};
FUNC VOID DIA_Akil_Gegend_Wald()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Wald_15_00"); //Was finde ich in dem Wald hinter deinem Hof?
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_01"); //Da gibt's nur jede Menge Monster - wobei die W�lfe noch die ungef�hrlichsten sind.
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_02"); //Angeblich sollen da auch ein paar Banditen ihre H�hle haben. Na - meinen Hof haben sie bis jetzt in Ruhe gelassen.
};
FUNC VOID DIA_Akil_Gegend_Taverne ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Taverne_15_00"); //Was ist das f�r eine Taverne im Osten?
	AI_Output (self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Frag mal Randolph. Er wei� mehr dar�ber als ich. Er war schon ein paar mal dort.
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
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_01"); //Sta�� se vr�tit ke kamenn�m schod�m a j�t po cest� na v�chod.
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_02"); //Stejnou cestou se dostane� i do kr�my. Odsud p�jde� d�l na v�chod, dokud nedoraz� k obrovsk�m l�n�m. To je m�sto, kde se poflakuj� �old�ci.
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
	description	 = 	"Co je to za kr�mu na v�chod odsud?";
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
	AI_Output (other, self, "DIA_Akil_Gegend_Taverne_15_00"); //Co je to za kr�mu na v�chod odsud?
	AI_Output (self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Zeptej se Randolpha. V� o tom v�c ne� j�. N�kolikr�t se tam stavil.
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
	description	 = 	"Co je v t�ch les�ch za farmou?";
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
	AI_Output (other, self, "DIA_Akil_Gegend_Wald_15_00"); //Co je v t�ch les�ch za farmou?
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_01"); //Jenom n�jak� p��ery - a vlci jsou z nich ty nejm�� nebezpe�n�.
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_02"); //Taky se pov�d�, �e tam m� �kryt n�kolik bandit�. No, ale u� p�kn� dlouho nechali moji farmu na pokoji.
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

	description	 = 	"Stalo se je�t� n�co?";
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
	AI_Output (other, self, "DIA_Akil_Perm_15_00"); //Stalo se je�t� n�co?

	if (Kapitel == 3)
	{
		if (MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_01"); //Ne. Douf�m, �e ovce z�stanou tam, co jsou te�.
		}
		else
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_02"); //Moje ovce zmizely. Za chv�li nebudu m�t co do �st.
		};
	}
	else //Kapitel 4 & 5
	{
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_03"); //V�ude se objevuj� sk�eti. Kdosi n�co ��kal o jejich z�kladn�. Zeptej se na to farm��e Lobarta.

		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_04"); //Taky tu spat�ili spoustu je�t�r�. B�t tebou, do jeskyn� bych v�bec nechodil.

		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_05"); //Hledaj� t� zakuklenci v �ern�ch k�p�ch.
			AI_Output (other, self, "DIA_Akil_Perm_15_06"); //No tak to je novinka.
			AI_Output (self, other, "DIA_Akil_Perm_13_07"); //Dobr�. Prost� jsem myslel, �e bych se o tom m�l zm�nit.
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

	description	 = 	"Je�t� n�jak� novinky?";
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
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_15_00"); //Je�t� n�jak� zpr�vy?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_13_01"); //Posledn� dobou mi po��d n�kdo krade ovce. U� cel� noci jsem se po��dn� nevyspal.

	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "To nen� m�j probl�m.", DIA_Akil_SCHAFDIEB_nein );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "Kolik ovc� ti chyb�?", DIA_Akil_SCHAFDIEB_wieviel );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "Kdo by to mohl d�lat?", DIA_Akil_SCHAFDIEB_wer );
	MIS_Akil_SchafDiebe	= LOG_RUNNING;
	Log_CreateTopic (TOPIC_AkilSchafDiebe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilSchafDiebe,"Akilovi n�kdo st�le krade ovce. Domn�v� se, �e to maj� na sv�dom� banditi z jeskyn� v nedalek�m lese."); 
};

func void DIA_Akil_SCHAFDIEB_wer ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wer_15_00"); //Kdo by to mohl d�lat?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_01"); //Tak to nem�m ani tu�en�.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_02"); //N�jak� fakt odporn� chl�pci se usadili v jeskyn�ch za t�m lesem.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_03"); //Nechce se mi v��it, �e by se �ivili jen bobulema. Jsem si skoro jistej, �e oni jsou ten d�vod, pro� se mi ztr�cej� ovce.
	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wieviel_15_00"); //Kolik ovc� ti chyb�?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wieviel_13_01"); //Te� se mi ztratily minim�ln� t�i.

};

func void DIA_Akil_SCHAFDIEB_nein ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_nein_15_00"); //To nen� m�j probl�m.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_nein_13_01"); //Rozum�m. M� na pr�ci jin� v�ci.
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

	description	 = 	"Na�el jsem ty zlod�je ovc�.";
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
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_00"); //Na�el jsem ty zlod�je ovc�.
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_01"); //M�l jsi pravdu. D�lali to ti chl�pci z lesn� jeskyn�. U� ti ��dnou dal�� ovci nevezmou.

	if 		((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_02"); //D�ky ti, �lechetn� slu�ebn�ku Innose.
			}
	else if (hero.guild == GIL_MIL)
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_03"); //D�ky. Tak se p�ece jen domobrana dok�e postarat o n�s, mal� farm��e.
			}
	else 
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_04"); //D�ky. V�n� jsi divnej �old�k. V�bec ne jako ti ostatn�, co zn�m.
			};
		
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_05"); //Vezmi si tohle jako mal� vyj�d�en� m�ch d�k� za tvou nezi�tnou pomoc.

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

	description	 = 	"(Vr�tit Akilovi ovci.)";
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
	AI_Output			(self, other, "DIA_Akil_AkilsSchaf_13_01"); //V�born�. Tady m� trochu zlata. Douf�m, �e to sta��.
	
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


























































