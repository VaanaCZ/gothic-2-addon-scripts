///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kati_EXIT   (C_INFO)
{
	npc         = BAU_941_Kati;
	nr          = 999;
	condition   = DIA_Kati_EXIT_Condition;
	information = DIA_Kati_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kati_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SLDnochda
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_SLDNOCHDA		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_SLDNOCHDA_Condition;
	information	 = 	DIA_Kati_SLDNOCHDA_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Kati_SLDNOCHDA_Condition ()
{
	if  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))	
	&&  (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kati_SLDNOCHDA_Info ()
{
	//--------------------------------------
	var int Hilfe;
	//--------------------------------------
	
	if (Hilfe == FALSE)
	{
		AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_00"); //Ti hrdlo�ezov� m�mu mu�i vyhro�uj�! Jsme ��dn�mi ob�any m�sta, v�rn�mi kr�li, a �old�ci n�s cht�j� oloupit o v�echno!
		Hilfe = TRUE;
	};
	AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_01"); //Tak tady jen tak nest�j. D�lej n�co! Pomoz n�m.
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Akil�v statek ohro�uj� �old�ci."); 

	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HALLO		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	5;
	condition	 = 	DIA_Kati_HALLO_Condition;
	information	 = 	DIA_Kati_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jsi v po��dku?";
};

func int DIA_Kati_HALLO_Condition ()
{	
	if (Npc_IsDead (Alvares))
	&& (Npc_IsDead (Engardo))
	{
		return TRUE;
	};
};
func void DIA_Kati_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Kati_HALLO_15_00"); //Jsi v po��dku?
	
	if (Npc_IsDead (Akil))
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_01"); //(vzlyk�) M�j milovan� man�el je mrtv�! � Innosi, za� m� tak tvrd� trest�?
		
		Npc_ExchangeRoutine	(self,"Za��t");
		B_StartOtherRoutine	(Randolph,"Za��t");

		B_GivePlayerXP (XP_Akil_Tot);	
	}
	else
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_02"); //Je mi dob�e. D�ky.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Essen
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ESSEN		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	12;
	condition	 = 	DIA_Kati_ESSEN_Condition;
	information	 = 	DIA_Kati_ESSEN_Info;
	permanent 	 =  FALSE;
	description	 = 	"Akil ��kal, �e pro m� bude� m�t n�co k j�dlu.";
};

func int DIA_Kati_ESSEN_Condition ()
{
	if (Kati_Mahlzeit == TRUE)
	&& ((Npc_IsDead(Akil))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_ESSEN_Info ()
{
	AI_Output (other, self, "DIA_Kati_ESSEN_15_00"); //Akil ��kal, �e pro m� bude� m�t n�co k j�dlu.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_01"); //Od t� doby, co bari�ra vzala za sv�, u� tu nen� bezpe�no a my jsme za�ili dost �patn� �asy.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_02"); //Tady m� bochn�k chleba, trochu masa a n�jakou vodu. Je mi l�to, ale to je v�e, co mohu postr�dat.
	
	B_GiveInvItems (self, other, ItFo_Bread, 1);			
	B_GiveInvItems (self, other, ItFo_Water, 1);			
	B_GiveInvItems (self, other, ItFoMutton, 1);			

};

///////////////////////////////////////////////////////////////////////
//	Info Akil ist tot Kati ist der Ersatz 
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_Baltram		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_Baltram_Condition;
	information	 = 	DIA_Kati_Baltram_Info;
	permanent	 = 	FALSE;
	description	 = "Pos�l� m� Baltram.";
};
func int DIA_Kati_Baltram_Condition ()
{
	if  (Npc_IsDead (Akil))
	&&  (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&&  (Lieferung_Geholt == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_Baltram_Info ()
{
	AI_Output (other, self, "DIA_Kati_Baltram_15_00"); //Poslal m� Baltram. M�m pro n�j vyzvednout n�jak� bal�k.
	AI_Output (self, other, "DIA_Kati_Baltram_16_01"); //Ano, samoz�ejm�. Tady, u� jsem to zabalil.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};
	
///////////////////////////////////////////////////////////////////////
//	Info Bauernaufstand
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_BAUERNAUFSTAND		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	6;
	condition	 = 	DIA_Kati_BAUERNAUFSTAND_Condition;
	information	 = 	DIA_Kati_BAUERNAUFSTAND_Info;
	permanent    =  FALSE;
	description	 = 	"Pro� se sami nebr�n�te proti Onarov� tyranii?";
};

func int DIA_Kati_BAUERNAUFSTAND_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_BAUERNAUFSTAND_Info ()
{
	AI_Output (other, self, "DIA_Kati_BAUERNAUFSTAND_15_00"); //Pro� se sami nebr�n�te proti Onarov� tyranii?
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_01"); //Pro n�s, co m�me farmy bl�zko m�sta, m� v�t�� smysl z�stat na stran� domobrany ne� se spol�hat na Onarovy �old�ky.
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_02"); //Na druhou stranu, jsou tu i takov� jako Bengar a Sekob, co by se rad�ji vzdali sv�ch farem, ne� by pracovali pro kr�le.

};

///////////////////////////////////////////////////////////////////////
//	Info AndereHoefe
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ANDEREHOEFE		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	7;
	condition	 = 	DIA_Kati_ANDEREHOEFE_Condition;
	information	 = 	DIA_Kati_ANDEREHOEFE_Info;
	permanent	 =  FALSE;
	description	 = 	"Kde najdu farmy Sekoba a Bengara?";
};

func int DIA_Kati_ANDEREHOEFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info ()
{
	AI_Output (other, self, "DIA_Kati_ANDEREHOEFE_15_00"); //Kde najdu farmy Sekoba a Bengara?
	AI_Output (self, other, "DIA_Kati_ANDEREHOEFE_16_01"); //Nen� to daleko od farmy, na kter� velkostatk�� �ije. Nalezne� je, kdy� odsud p�jde� na v�chod.
};

///////////////////////////////////////////////////////////////////////
//	Info HierWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HIERWEG		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	9;
	condition	 = 	DIA_Kati_HIERWEG_Condition;
	information	 = 	DIA_Kati_HIERWEG_Info;
	permanent	 =  FALSE;
	description	 = 	"Pom��leli jste n�kdy na to, �e byste odsud ode�li?";
};

func int DIA_Kati_HIERWEG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info ()
{
	AI_Output (other, self, "DIA_Kati_HIERWEG_15_00"); //Pom��leli jste n�kdy na to, �e byste odsud ode�li?
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_01"); //Nen� zrovna snadn� se dostat z tohodle kousku zem�. Cel� kraj je obklopen vysok�m a nep�ekonateln�m horsk�m masivem.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_02"); //Jedin� dv� cesty ven jsou pr�smyk do Hornick�ho �dol� a p��stav v Korinidu.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_03"); //Proto�e si nem��eme dovolit cestu lod� a z Hornick�ho �dol� nen� n�vratu, z�st�v�me tady.
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PASS		(C_INFO)
{
	npc		 	 = 	BAU_941_Kati;
	nr			 = 	10;
	condition	 = 	DIA_Kati_PASS_Condition;
	information	 = 	DIA_Kati_PASS_Info;
	permanent	 =  FALSE;
	description	 = 	"Co v� o tom pr�smyku?";
};

func int DIA_Kati_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info ()
{
	AI_Output (other, self, "DIA_Kati_PASS_15_00"); //Co v� o tom pr�smyku?
	AI_Output (self, other, "DIA_Kati_PASS_16_01"); //Nikdy jsem tam osobn� nebyla. Mus� to b�t n�kde pobl� Bengarovy farmy na n�horn�ch pastvin�ch.
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERMKAP1		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	11;
	condition	 = 	DIA_Kati_PERMKAP1_Condition;
	information	 = 	DIA_Kati_PERMKAP1_Info;
	permanent	 = 	TRUE;
	description	 = 	"D�vej pozor na sv�ho man�ela.";
};

func int DIA_Kati_PERMKAP1_Condition ()
{
	if 	(
		(!C_NpcIsDown (Akil))
		&& (Npc_KnowsInfo(other, DIA_KATI_HALLO))
		&& (Npc_KnowsInfo(other, DIA_KATI_BAUERNAUFSTAND))
		&& (Npc_KnowsInfo(other, DIA_KATI_ANDEREHOEFE))
		&& (Npc_KnowsInfo(other, DIA_KATI_HIERWEG))
		&& (Npc_KnowsInfo(other, DIA_KATI_PASS))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Kati_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERMKAP1_15_00"); //D�vej pozor na sv�ho man�ela.
	AI_Output			(self, other, "DIA_Kati_PERMKAP1_16_01"); //Ud�l�m, co m��u.
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

INSTANCE DIA_Kati_KAP3_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP3_EXIT_Condition;
	information	= DIA_Kati_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERM		(C_INFO)
{
	npc		 = 	BAU_941_Kati;
	nr		 = 	3;
	condition	 = 	DIA_Kati_PERM_Condition;
	information	 = 	DIA_Kati_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je�t� po��d ti nic nesch�z�?";
};

func int DIA_Kati_PERM_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERM_15_00"); //Je�t� po��d ti nic nesch�z�?
	AI_Output			(self, other, "DIA_Kati_PERM_16_01"); //D� se to p�e��t. Jen by m� zaj�malo, jak dlouho tu je�t� budeme muset sn�et ty ��bly v �ern�m.
	AI_Output			(self, other, "DIA_Kati_PERM_16_02"); //U� to je k nevydr�en�. Pl�� se kolem domu a vyd�vaj� ty divn� zvuky.
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

INSTANCE DIA_Kati_KAP4_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP4_EXIT_Condition;
	information	= DIA_Kati_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP4_EXIT_Info()
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

INSTANCE DIA_Kati_KAP5_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP5_EXIT_Condition;
	information	= DIA_Kati_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP5_EXIT_Info()
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


INSTANCE DIA_Kati_KAP6_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP6_EXIT_Condition;
	information	= DIA_Kati_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kati_PICKPOCKET (C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 900;
	condition	= DIA_Kati_PICKPOCKET_Condition;
	information	= DIA_Kati_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Kati_PICKPOCKET_Condition()
{
	C_Beklauen (13, 15);
};
 
FUNC VOID DIA_Kati_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kati_PICKPOCKET);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_BACK 		,DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};
	
func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};






























