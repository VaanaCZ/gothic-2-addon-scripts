///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulthar_EXIT   (C_INFO)
{
	npc         = KDF_502_Ulthar;
	nr          = 999;
	condition   = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Ulthar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
	
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_GREET		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_GREET_Condition;
	information	 = 	DIA_Ulthar_GREET_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&&(!Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_GREET_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_GREET_05_00"); //Hle�me, p�ed nejvy��� radou stoj� nov� novic. Innos t� doprov�zej, synu.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_01"); //Co je p�esn� �kolem nejvy��� rady?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_02"); //Na�� povinnost� je hl�sat v�li Innosovu. Jsme to tedy my, kdo ozna�uje novice vyvolen� ke zkou�ce magie.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_03"); //A�koliv �ijeme v �stran�, sledujeme sv�tsk� z�le�itosti, nebo� c�rkev Innosova p�edstavuje nejvy��� pozemsk� z�kon.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_04"); //Ach, tak�e v�s zaj�m�, co se d�je ve sv�t�.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_05"); //Co si tedy mysl�te o t�ch drac�ch, co se usadili v Hornick�m �dol�, a o jejich arm�d�, kter� roste den za dnem?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_06"); //Ch�pu, �e jsi roz�ilen�, ale ne� se rozhodneme n�co podniknout, mus�me v�e d�kladn� zv�it.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_07"); //Kdybychom se te� nechali un�st, ni�eho bychom nedoc�lili. Tak�e spl� to, co m� p�ik�z�no - a my probereme, co je zapot�eb� ud�lat.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_MAGETEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_MAGETEST_Condition;
	information	 = 	DIA_Ulthar_MAGETEST_Info;
	description	 = 	"Pov�z mi o zkou�ce magie.";
};
func int DIA_Ulthar_MAGETEST_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_GREET)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_MAGETEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_MAGETEST_15_00"); //Pov�z mi o zkou�ce magie.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_01"); //Je to �ance pro vybran� novice vstoupit do spole�enstva m�g�. Zkou�ku ov�em m��e splnit jen jeden.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_02"); //Novice si ke zkou�ce vyb�r� s�m Innos.
};
///////////////////////////////////////////////////////////////////////
//	Info WHEN
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_WHEN		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	3;
	condition	 = 	DIA_Ulthar_WHEN_Condition;
	information	 = 	DIA_Ulthar_WHEN_Info;
	permanent	 =  TRUE;
	description	 = 	"Kdy bude ta zkou�ka prob�hat?";
};
func int DIA_Ulthar_WHEN_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Ulthar_MAGETEST)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_WHEN_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_WHEN_15_00"); //Kdy bude ta zkou�ka prob�hat?
	AI_Output (self, other, "DIA_Ulthar_WHEN_05_01"); //Jakmile se dozv�me Innosovu v�li. Zprav�me o n� vybran� novice a podrob�me je zkou�ce.
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_TEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_TEST_Condition;
	information	 = 	DIA_Ulthar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.";
};
func int DIA_Ulthar_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_TEST_15_00"); //Jsem p�ipraven podrobit se tv� zkou�ce, Mist�e.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_01"); //Nep�ekvapuje m�, �e zn� ten star� z�kon.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_02"); //Ale pochybuji, �e si uv�domuje�, jak�mu riziku se vystavuje�. M�j na pam�ti, �e nedo�kav� duch zkou�kou ohn� neprojde.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_03"); //Je to u� stra�n� d�vno, kdy n�kdo tuto zkou�ku podstupoval. A je jen jedin� �lov�k, kter� ji p�e�il a �sp�n� slo�il.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_04"); //Tehdy to byl mlad� ambici�zn� novic, te� u� dlouhou dobu zast�v� vysok� ��ad v nejvy��� rad� - mluv�m o Serpentesovi.
	AI_Output (other, self, "DIA_Ulthar_TEST_15_05"); //Nebude to dlouho trvat a u� nebude jedin�m, kdo tu zkou�ku slo�il.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_06"); //V tom p��pad� t� u� nenech�m dlouho �ekat. Poslouchej zn�n� m� zkou�ky:
	AI_Output (self, other, "DIA_Ulthar_TEST_05_07"); //Vytvo� runu ohniv�ho ��pu. To je v�e - nech� je ti Innos n�pomocen.
	
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rune,LOG_RUNNING);
	B_LogEntry (TOPIC_Rune,"Ulthar mi zadal sv�j �kol - mus�m vytvo�it runu ohniv�ho ��pu.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_RUNNING_Condition;
	information	 = 	DIA_Ulthar_RUNNING_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_RUNNING_Condition ()
{	
	if (MIS_RUNE == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (Npc_HasItems    (other, ItRu_FireBolt) == 0)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_RUNNING_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_RUNNING_05_00"); //Sv�j �kol zn�. V�nuj se mu.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_SUCCESS_Condition;
	information	 = 	DIA_Ulthar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Vytvo�il jsem tu runu!";
};
func int DIA_Ulthar_SUCCESS_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItRu_FireBolt) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_SUCCESS_15_00"); //Vytvo�il jsem tu runu!
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_01"); //Dobr� pr�ce, novici. M��e� si ji nechat, je to tvoje prvn� runa.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_02"); //A� se dostane� do prvn�ho kruhu ohn�, bude� ji moci pou��vat.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_03"); //Splnil jsi svou zkou�ku k m� spokojenosti.
	
	if (MIS_GOLEM == LOG_RUNNING)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	{
		AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_04"); //Ale je�t� po��d p�ed sebou m� nebezpe�n� �kol, kter� pro tebe nachystal Serpentes!
	};
	
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP (XP_RUNE);
	
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

INSTANCE DIA_Ulthar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP3_EXIT_Condition;
	information	= DIA_Ulthar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermAbKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_PermAbKap3		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  99;
	condition	 = 	DIA_Ulthar_PermAbKap3_Condition;
	information	 = 	DIA_Ulthar_PermAbKap3_Info;
	permanent	 = 	TRUE;
	description  =  "Co je nov�ho?";
};
func int DIA_Ulthar_PermAbKap3_Condition ()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Ulthar_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_PermAbKap3_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_PermAbKap3_15_00"); //Co je nov�ho?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_01"); //Moment�ln� nic. B� a spl� sv� �koly. Je�t� toho m� dost na pr�ci.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_02"); //Ne. Nic, co bys u� s�m nev�d�l, brat�e.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineVergiftet
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SCHREINEVERGIFTET		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important	 = 	TRUE;
};

func int DIA_Ulthar_SCHREINEVERGIFTET_Condition ()
{
	if (Pedro_Traitor == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info ()
{
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_00"); //Je�t� jedna v�c. Nep��tel znesv�til n�kter� ze svaty� pod�l cest, kter� byly zasv�ceny Innosovi. P�i�ly o sv� magick� po�ehn�n�.
			AI_Output			(other, self, "DIA_Ulthar_SCHREINEVERGIFTET_15_01"); //Ch�pu. A d�l?
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_02"); //Je na tob�, abys ty svatyn� o�istil, aby se situace je�t� nezhor�ovala.
			CreateInvItems (self, ItMi_UltharsHolyWater_Mis, 1);									
			B_GiveInvItems (self, other, ItMi_UltharsHolyWater_Mis, 1);	
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_03"); //Vezmi si tuto sv�cenou vodu a pokrop s n� z�klady svatyn�.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_04"); //S pomoc� svat�ch slov z�sk� svatyn� op�t svou starou moc.

			if ((Npc_HasItems (other,ItWr_Map_Shrine_MIS))==FALSE)
			{
				if ((Npc_HasItems (Gorax,ItWr_Map_Shrine_MIS)))
				&& ((Npc_IsDead(Gorax))== FALSE)
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_05"); //Gorax ti prod� mapu, na kter� jsou vyzna�en� na�e svatyn�.
				}
				else
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_06"); //Tady m� mapu. Jsou na n� vyzna�en� svatyn�.
					CreateInvItems (self, ItWr_Map_Shrine_MIS, 1);									
					B_GiveInvItems (self, other, ItWr_Map_Shrine_MIS, 1);					
				};
			};

			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_07"); //Te� b� a spl� sv�j �kol.
			MIS_Ulthar_HeileSchreine_PAL = LOG_RUNNING;	
			
			Log_CreateTopic (TOPIC_Ulthar_HeileSchreine_PAL, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL, LOG_RUNNING);
			B_LogEntry (TOPIC_Ulthar_HeileSchreine_PAL,"Ulthar mi nak�zal, abych jeho sv�cenou vodou o�istil v�echny svatyn�, kter� nep��tel poskvrnil."); 
			
			AI_StopProcessInfos (self);
		}
		else
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_08"); //Je�t� jedna drobnost. Dr� se d�l od svatyn� stoj�c�ch pod�l cest. Sly�eli jsme, �e n�kter� z nich byly znesv�ceny.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_09"); //Nikdo netu��, jakou moc te� mohou m�t.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_10"); //Vy�e�it tento probl�m nen� tvoje starost. Postaraj� se o to paladinov�.
			AI_StopProcessInfos (self);
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheilt		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheilt_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheilt_Info;

	description  = 	"O�istil jsem v�echny svatyn�.";
};

func int DIA_Ulthar_SchreineGeheilt_Condition ()
{
	if (MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheilt_Info ()
{
	AI_Output			(other, self, "DIA_Ulthar_SchreineGeheilt_15_00"); //O�istil jsem v�echny svatyn�.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_01"); //V�born�, m�j synu. Jsem na tebe hrd�. Nech� t� Innos st�le doprov�z�.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_02"); //Vezmi si tento Amulet s�ly, mohl by se ti v bitv�ch proti nep��teli hodit.
	CreateInvItems (self, ItAm_Dex_Strg_01, 1);									
	B_GiveInvItems (self, other, ItAm_Dex_Strg_01, 1);
	B_GivePlayerXP (XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP4_EXIT_Condition;
	information	= DIA_Ulthar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheiltNoPAL
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheiltNoPAL		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important	 = 	TRUE;

};

func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition ()
{
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)|| (hero.guild == GIL_KDF))
	&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info ()
{
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_00"); //Dobr� zpr�vy. Svatyn� pod�l cest byly o�i�t�ny. Innosova s�la pomohla paladin�m sm�st tenhle probl�m ze zemsk�ho povrchu.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_01"); //Op�t m��e� Innosovi ob�tovat bez obav a bez v�hrad.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP5_EXIT_Condition;
	information	= DIA_Ulthar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP5_EXIT_Info()
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


INSTANCE DIA_Ulthar_KAP6_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP6_EXIT_Condition;
	information	= DIA_Ulthar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulthar_PICKPOCKET (C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 900;
	condition	= DIA_Ulthar_PICKPOCKET_Condition;
	information	= DIA_Ulthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ulthar_PICKPOCKET_Condition()
{
	C_Beklauen (74, 320);
};
 
FUNC VOID DIA_Ulthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_BACK 		,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
	
func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
































 
























