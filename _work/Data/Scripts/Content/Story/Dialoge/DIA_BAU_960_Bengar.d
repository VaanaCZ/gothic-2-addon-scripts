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

	description	 = 	"Ty jsi tady farm��em?";
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
	AI_Output			(other, self, "DIA_Bengar_HALLO_15_00"); //Ty jsi tady farm��em?
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_01"); //Dalo by se to tak ��ct, ale jsem jen n�jemce.
	AI_Output			(self, other, "DIA_Bengar_HALLO_10_02"); //Ve�ker� pozemky pat�� velkostatk��i.

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

	description	 = 	"Jak si obstar�v� ob�ivu?";
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
	AI_Output			(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //Jak si obstar�v� ob�ivu?
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //V�t�inou lovem a k�cen�m strom�. Taky samoz�ejm� chov�me ovce a obd�l�v�me p�du.
	AI_Output			(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //Onar mi sem poslal v�echny tyhle lidi a j� je mus�m �ivit. A jen m�lo z nich um� vz�t za pr�ci, jak sis asi s�m v�iml.

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

	description	 = 	"Zam�stn�v� n�den�ky?";
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
	AI_Output			(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //Zam�stn�v� n�den�ky?
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //Onar vyhodil lidi, co mu na jeho farm� nebyli k ni�emu.
	AI_Output			(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //Pak je poslal ke mn�. D�v�m jim naj�st a oni pro m� pracuj�.

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

	description	 = 	"Neud�lo se tu posledn� dobou n�co divn�ho?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //Neseb�hlo se tu v posledn� dob� n�co divn�ho?
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //Posledn� dobou se tu d�j� divn� v�ci.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //Ale nic nen� divn�j��ho ne� to z�hadn� zmizen� Parda.
	AI_Output	(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //B�val jedn�m z d�ln�k� na poli a rozhodn� nepat�il k t�m, co by najednou se v��m pra�tili, sebrali se a takhle utekli.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Sedl�k Bengar postr�d� sv�ho �eled�na Pardose."); 

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP (XP_Ambient);

	Info_ClearChoices	(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Napad� t�, pro� zmizel?", DIA_Addon_Bengar_MissingPeople_Hint );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Mo�n� u� m�l prost� v�eho dost.", DIA_Addon_Bengar_MissingPeople_voll );
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Co je na jeho zmizen� tak divn�ho?", DIA_Addon_Bengar_MissingPeople_was );
};
func void DIA_Addon_Bengar_MissingPeople_was ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //Co p�esn� je na tom jeho zmizen� divn�ho?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //Pardos je trochu b�zliv� - jak�iv nebyl d�l ne� na kraji m�ch pol�.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //Zdrhnul by, i kdyby n�kde zahl�dnul �ravou �t�nici.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //Na tu sice nen� p�kn� pohled, ale rozhodn� se ned� ��ct, �e by �lo o nebezpe�nou potvoru.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //(znechucen�) A to se pr� najdou lidi, kte�� je jed�. Fuj tajbl.
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //Na to si zvykne�.
};
func void DIA_Addon_Bengar_MissingPeople_voll ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //Mo�n� u� toho m�l prost� pln� zuby.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //On prac� na pol�ch �il. Nedok�u si p�edstavit, �e by utekl makat na jin� statek.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //U m� si mohl d�lat, co cht�l.
	
};
func void DIA_Addon_Bengar_MissingPeople_Hint ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //M� n�jak� stopy?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //Mysl�m, �e ho museli odvl�ct ti banditi. U� p�r dn� se tu potulovali kolem.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //Jednou jsem vid�l, jak do sv�ho t�bora t�hli n�koho z m�sta.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //Vypadalo to, �e z n�j cht�j� ud�lat otroka.
	Info_AddChoice	(DIA_Addon_Bengar_MissingPeople, "Kde le�� t�bor bandit�?", DIA_Addon_Bengar_MissingPeople_Lager );
};
var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager ()
{
	AI_Output			(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //Kde le�� ten t�bor bandit�?
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //Na konci m�ch polnost� jsou schody, kter� vedou do mal�ho �dol��ka. Tam se ti lapkov� usadili.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //Moc r�d bych si tam pro Parda za�el, ale j� proti t�m chlap�m nem�m ��dnou �anci.
	AI_Output			(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //A ty by ses jim m�l taky na sto hon� vyhnout. Nemaj� zrovna smysl pro humor.
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

	description	 = 	"Vr�til se Pardos zp�tky?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //U� se Pardos vr�til?
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //Ano, u� je doma a odpo��v�. D�ky za v�echno, co jsi...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //To nestoj� za �e�.
	AI_Output	(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //Po�kej, chci se ti odm�nit, ale nem�m...
	AI_Output	(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //Ka�li na to.
	
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

	description	 = 	"Kdy� tudy ti bandit� proch�zeli, m�li u sebe zbran�?";
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
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //Kdy� tudy ti bandit� proch�zeli, nem�li u sebe n�jak� zbran�?
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //Co je to za hloupou ot�zku? Copak by tu banditi pob�hali jen tak beze zbran�?
	AI_Output	(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //Mysl�m SPOUSTU zbran�. Velkou dod�vku.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //Ch�pu. Jo, kdy� o tom mluv�, tak toho v�n� nesli hromady.
	AI_Output	(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //N�co v sudech, n�co ve vac�ch a n�co i na vozech, kter� s sebou m�li.
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

	description	 = 	"Co si mysl� o Onarovi?";
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
	AI_Output (other, self, "DIA_Bengar_REBELLIEREN_15_00"); //Co si mysl� o Onarovi?
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_01"); //Je to nena�ranej parchant, co n�s nakonec v�echny dostane na �ibenici.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_02"); //Jednou sem paladinov� z m�sta doraz� a kv�li tomu bastardovi n�s porubaj�.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_03"); //Ale j� nem�m na v�b�r. Domobrana si sem chod� jen proto, aby si odnesla na�e zbo��, ale chr�nit n�s ji ani nenapadne.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_04"); //Kdybych z�stal v�rn� m�stu, byl bych na to te� s�m.
	AI_Output (self, other, "DIA_Bengar_REBELLIEREN_10_05"); //Kdy� u� nic jin�ho, Onar po�le p�r sv�ch �old�k� hned a pak, aby se pod�vali, jak jsme dopadli.
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

	description	 = 	"Co m� proti kr�lovsk�m vojsk�m?";
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
	AI_Output			(other, self, "DIA_Bengar_PALADINE_15_00"); //Co m� proti kr�lovsk�m vojsk�m?
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_01"); //To je p�ece jasn�. Od t� doby, co jsou paladinov� ve m�st�, se nic nezlep�ilo. Pr�v� naopak.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_02"); //Te� ti zatracen� voj�ci z domobrany p�ich�zej� na na�e pozemky st�le �ast�ji a kradou, co se jim zachce. A paladinov� proti tomu nehnou ani prstem.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_03"); //Jedin� paladinov�, kter� jsem kdy vid�l, jsou ti dva str�ci u pr�smyku.
	AI_Output			(self, other, "DIA_Bengar_PALADINE_10_04"); //Nehodlaj� hnout ani prstem, dokud n�s domobrana v�echny nepovra�d�.

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

	description	 = 	"Pr�smyk?";
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
	AI_Output			(other, self, "DIA_Bengar_PASS_15_00"); //U jak�ho pr�smyku?
	AI_Output			(self, other, "DIA_Bengar_PASS_10_01"); //U pr�smyku do star�ho Hornick�ho �dol� u vodop�d� na druh�m konci n�horn�ch pastvin.
	AI_Output			(self, other, "DIA_Bengar_PASS_10_02"); //Zeptej se na to Malaka. Tenhle t�den m� spoustu �asu.

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
	description	= "�ekn�me, �e se na ten v� probl�m s domobranou pod�v�m.";
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
	AI_Output (other, self, "DIA_Bengar_MILIZ_15_00"); //�ekn�me, �e se na ten v� probl�m s domobranou pod�v�m.
		
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_01"); //Co? �ekl jsem Onarovi, �e by m�l poslat p�r �OLD�K�.
		AI_Output (other, self, "DIA_Bengar_MILIZ_15_02"); //Je to p��le�itost, jak se p�esv�d�it o sv�ch kvalit�ch.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_03"); //V�born�. Um� si p�edstavit, co se mnou domobrana ud�l�, kdy� to zpack�?
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_04"); //Nem�l jsem dojem, �e by sem te� cht�l n�kdo z nich p�ij�t.
		AI_Output (self, other, "DIA_Bengar_MILIZ_10_05"); //U� jsem o tom Onarovi ��kal p�ed p�r dny. Za co mu tu rentu teda plat�m?
	};
	
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_06"); //Ti bastardi sem chod� jednou do t�dne a vyb�raj� dan� pro m�sto.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_07"); //Je fajn, �es p�i�el pr�v� te�. V tuhle dobu obvykle p�ich�zej�.
	AI_Output (self, other, "DIA_Bengar_MILIZ_10_08"); //M�li by tu b�t ka�dou chv�li.
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
	description	= "A pro� se tedy t� domobran� nepostav� s�m?";
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
	AI_Output (other, self, "DIA_Bengar_Selber_15_00"); //Je v�s tu tolik. Pro� se domobran� prost� nepostav�te sami?
	AI_Output (self, other, "DIA_Bengar_Selber_10_01"); //Je pravda, �e n�s tu je jak ps�. Ale nem�me v�cvik na boj s domobranou.
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
	description	= "Jen a� si teda domobrana doraz�, j� u� to s nimi vy��d�m!";
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
	AI_Output (other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //Jen a� si teda domobrana doraz�, j� u� to s nimi vy��d�m!
	AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //Nem��u se do�kat. U� p�ich�zej�. ��kal jsem ti to.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //Jen to nezpackej!
	}
	else //SLD oder DJG
	{
		AI_Output (self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //Tak dobr�, hodn� �t�st�! Uka� jim to.
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
	description	= "V� probl�m s domobranou u� je minulost�.";
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
	AI_Output (other, self, "DIA_Bengar_MILIZWEG_15_00"); //V� probl�m s domobranou u� je minulost�.
	if (Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead (Rumbold) == FALSE)
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_01"); //Jsi bl�zen? V�, co mi ti chlapi ud�laj�, a� odsud odejde�?
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_02"); //Po��d tu okoun�j�. �ekni jim, a� odt�hnou �PLN�!
	}
	else
	{
		AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_03"); //To nen� �patn�. Mo�n� n�m te� na konci m�s�ce zbude n�co i pro obchod. D�ky.

		if (Rumbold_Bezahlt == TRUE)
		{		
			AI_Output (self, other, "DIA_Bengar_MILIZWEG_10_04"); //Dokonce jsi za m� cht�l zaplatit. To je od tebe velmi mil�.
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

	description	 = 	"Ov��k Balthazar na va�e pastviny nesm�?";
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
	AI_Output			(other, self, "DIA_Bengar_BALTHASAR_15_00"); //Ov��k Balthazar na va�e pastviny nesm�?
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_01"); //No, ano. To je takhle: �ekl jsem Sekobovi, �e by mi m�l platit, kdy� chce sv� ovce p�st na m�ch pozemc�ch.
	AI_Output			(self, other, "DIA_Bengar_BALTHASAR_10_02"); //Ale pravda je, �e jsem to �ekl jen proto, aby u� sem nechodil. Nem��u Balthazara vyst�t.
	B_LogEntry (TOPIC_BalthasarsSchafe,"M�m-li p�esv�d�it Bengara, aby Balthazara pustil na sv� pastviny, mus�m mu u�init laskavost. Ur�it� se k tomu n�jak� p��le�itost naskytne."); 
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

	description	 = 	"Domobrana je pry� a Balthazar m��e tvoji pastvinu znovu vyu��vat.";
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
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //Domobrana je pry� a Balthazar m��e tvoji pastvinu znovu vyu��vat.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //Pro�?
	AI_Output			(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //(v�hru�n�) Proto�e jsem to �ekl.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //Mmh. Dobr�, jak chce�.
	AI_Output			(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //A� si najde m�sto pro svoje zv��ata n�kde mezi poli.

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

	description	 = 	"D�vej na sebe pozor.";
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
	AI_Output			(other, self, "DIA_Bengar_PERMKAP1_15_00"); //D�vej na sebe pozor.
	AI_Output			(self, other, "DIA_Bengar_PERMKAP1_10_01"); //Ty tady.

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

	description	 = 	"Jak se vede?";
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
	AI_Output			(other, self, "DIA_Bengar_ALLEIN_15_00"); //Jak to vypad�?

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak,"FARM3")<3000)== FALSE))
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_01"); //Malak zmizel a vzal s sebou v�echno a ka�d�ho, kdo pro m� pracoval. ��kal, �e m� nam��eno do hor.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_02"); //U� to tu nemohl vydr�et.
	MIS_GetMalakBack 		= LOG_RUNNING; 
	}
	else
	{
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_03"); //�asy jsou zl�. Nev�m, jak dlouho tu je�t� vydr��m.
	};
	
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_04"); //Vyt��� m�, jak z pr�smyku te� proud� z�plavy p��er, aby plundrovaly n�horn� pastviny.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_05"); //Kdybych tu tak alespo� m�l n�jakou pomoc do �old�k�.
	AI_Output			(self, other, "DIA_Bengar_ALLEIN_10_06"); //Jeden z nich se chystal, �e pro m� bude pracovat. Asi zm�nil n�zor. M�m dojem, �e se jmenoval "Vlk".
	MIS_BengarsHelpingSLD 	= LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry (TOPIC_BengarALLEIN,"Bengar z�stal na sv�m statku docela s�m. Jeho p��tel Malak zmizel a v�ichni ostatn� ode�li s n�m. Podle Bengara se nejsp� uch�lili do hor."); 
	B_LogEntry (TOPIC_BengarALLEIN,"Jeho statek je te� �pln� nechr�n�n� a pot�ebuje pomoc. Zmi�oval se o n�jak�m �oldn��i jm�nem Vlk. Copak j� toho chl�pka nezn�m?"); 
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

	description	 = 	"Malak je mrtv�.";
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
	AI_Output			(other, self, "DIA_Bengar_MALAKTOT_15_00"); //Malak je mrtv�.
	AI_Output			(self, other, "DIA_Bengar_MALAKTOT_10_01"); //Te� se v�echno obrac� k hor��mu.
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

	description	 = 	"Najal jsem ty �old�ky, kter� jsi cht�l.";
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
	AI_Output			(other, self, "DIA_Bengar_SLDDA_15_00"); //Najal jsem ty �old�ky, kter� jsi cht�l.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_01"); //Nikdy jsem na sv� farm� nikoho podobn�ho nem�l. Jen douf�m, �e to bude fungovat.
	AI_Output			(self, other, "DIA_Bengar_SLDDA_10_02"); //Tady, vezmi si tohle. M�m dojem, �e se ti to bude hodit.
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

	description	 = 	"Malak se vr�til.";
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
	AI_Output			(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //Malak se vr�til.
	AI_Output			(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //U� bylo na�ase. Myslel jsem, �e u� ho v�ckr�t neuvid�m.
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

	description	 = 	"To bude v po��dku.";
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
	AI_Output			(other, self, "DIA_Bengar_PERM_15_00"); //To bude v po��dku.

	if (Npc_GetDistToWP(Malak,"FARM3")<3000)
	&& ((Npc_IsDead(Malak))==FALSE)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_01"); //Malak se sice vr�til, ale na situaci to moc nem�n�.
		AI_Output			(self, other, "DIA_Bengar_PERM_10_02"); //Pokud se nestane n�jak� z�zrak, v�ichni to tu odsk��eme.
	}
	else if (Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
		&& ((Npc_IsDead(SLD_Wolf))==FALSE)
		&& (Npc_GetDistToWP(SLD_Wolf,"FARM3")<3000)
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_03"); //Vlk je divnej chlap, ale mysl�m, �e to n�jak zvl�dneme.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bengar_PERM_10_04"); //Bez Malaka tu nic nefunguje. Jestli se brzy n�co nestane, vzd�m se farmy.

		if (Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak))== FALSE)
		{
			AI_Output			(self, other, "DIA_Bengar_PERM_10_05"); //Snad se brzy vr�t�.
		};
	};
	AI_StopProcessInfos (self);
	
	if (Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
	B_StartOtherRoutine	(SLD_815_Soeldner,"Za��t");
	B_StartOtherRoutine	(SLD_817_Soeldner,"Za��t");
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


















































































