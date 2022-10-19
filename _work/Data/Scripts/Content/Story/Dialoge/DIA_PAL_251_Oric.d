///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Oric_EXIT   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 999;
	condition   = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Oric_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_HALLO		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_HALLO_Condition;
	information	 = 	DIA_Oric_HALLO_Info;
	permanent	 =  FALSE;
	description	 = 	"Co je tvoje pr�ce?";
};

func int DIA_Oric_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Oric_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Oric_HALLO_15_00"); //Co m� za �kol?
	AI_Output (self, other, "DIA_Oric_HALLO_11_01"); //Jsem kr�lovsk� d�stojn�k pro strategick� z�le�itosti a moment�ln� podl�h�m velen� ctihodn�ho velitele Garonda.
	AI_Output (self, other, "DIA_Oric_HALLO_11_02"); //Jsme posledn� paladinov� tady na hrad�. V�ichni ostatn� ode�li nebo padli.
	AI_Output (self, other, "DIA_Oric_HALLO_11_03"); //Na na�ich bedrech te� spo��v� �sp�ch cel� v�pravy. A my se o to postar�me. U Innose - postar�me se o to.

};

///////////////////////////////////////////////////////////////////////
//	Info Bruder
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Bruder		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	4;
	condition	 = 	DIA_Oric_Bruder_Condition;
	information	 = 	DIA_Oric_Bruder_Info;
	permanent	 =  FALSE;
	description	 = 	"M�m pro tebe zpr�vu.";
};

func int DIA_Oric_Bruder_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Jergan_Burg)
	&& Npc_KnowsInfo (other, DIA_Oric_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Oric_Bruder_Info ()
{
	AI_Output (other, self, "DIA_Oric_Bruder_15_00"); //M�m pro tebe zpr�vu.
	AI_Output (self, other, "DIA_Oric_Bruder_11_01"); //Co je?
	AI_Output (other, self, "DIA_Oric_Bruder_15_02"); //Tv�j bratr zem�el. Dostal se a� do pr�smyku.
	AI_Output (self, other, "DIA_Oric_Bruder_11_03"); //(�ept�)...m�j bratr
	AI_Output (self, other, "DIA_Oric_Bruder_11_04"); //Innos m� krut� zkou��. Ale zem�el jako jeho slu�ebn�k...
	AI_Output (self, other, "DIA_Oric_Bruder_11_05"); //Tahle zpr�va je jako ��p, kter� se mi zabod�v� do srdce. Budu hledat novou s�lu v modlitb�ch.
	OricBruder = TRUE;
	
	B_GivePlayerXP (XP_Ambient);
};

	
//*****************************************
//	Minen Auftrag
//*****************************************

INSTANCE DIA_Oric_ScoutMine   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 1;
	condition   = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent   = FALSE;
	description = "M�m se vydat k dol�m.";
};

FUNC INT DIA_Oric_ScoutMine_Condition()
{
	if 	(MIS_ScoutMine == LOG_RUNNING)
	&&	(Kapitel < 3)
	&& 	(Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&&  (Fajeth_Ore == FALSE)
	&&  (Marcos_Ore == FALSE)
	&&  (Silvestro_Ore == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_ScoutMine_Info()
{
	AI_Output (other,self ,"DIA_Oric_ScoutMine_15_00"); //M�m se vydat k dol�m.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_01"); //Dej si pozor, nebude to ��dn� hra�ka. Nejd��ve ze v�eho vyhledej paladiny. Oni vedou ty t�i skupiny.
	AI_Output (self ,other,"DIA_Oric_ScoutMine_11_02"); //Pokud bys o tom cht�l v�d�t v�c, promluv si s Parcivalem.
};	
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Perm		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	99;
	condition	 = 	DIA_Oric_Perm_Condition;
	information	 = 	DIA_Oric_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"Jak se vede?";
};

func int DIA_Oric_Perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Oric_Perm_Info ()
{
	
	AI_Output (other, self, "DIA_Oric_Perm_15_00"); //Jak to vypad�?
	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_01"); //Mus� naj�t v�echny horn�ky a nav�c i jejich rudu. Potom zkus�me p�ij�t na zp�sob, jak tohle �dol� opustit.
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
 	{
		AI_Output (self, other, "DIA_Oric_Perm_11_02"); //Nad�je v�pravy klesly na �pln� dno. Ale nevzd�me to, proto�e Innos je s n�mi. Vyvede n�s bezpe�n� z �dol�.
	}
	else //noch nicht angenommen
	{
		AI_Output (self, other, "DIA_Oric_Perm_11_03"); //Tv�j p��chod je pro n�s znamen�m nad�je.
		AI_Output (self, other, "DIA_Oric_Perm_11_04"); //Pot�ebujeme t�. B� si promluvit s Garondem - on ti v�echno vysv�tl�.
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

INSTANCE DIA_Oric_KAP3_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP3_EXIT_Condition;
	information	= DIA_Oric_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Oric_KAP4_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP4_EXIT_Condition;
	information	= DIA_Oric_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*****************************************
//	Kann ich irgendwie helfen?
//*****************************************

INSTANCE DIA_Oric_IAmBack   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;

	description = "U� jsem zp�t.";
};

FUNC INT DIA_Oric_IAmBack_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_HALLO))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Oric_IAmBack_Info()
{
	AI_Output (other,self ,"DIA_Oric_IAmBack_15_00"); //U� jsem zp�t.
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_01"); //Nikdy bych ne�ekl, �e t� tu je�t� uvid�m - ne potom, �eho jsem byl sv�dkem, kdy� jsi tu byl p�ed n�kolika dny.
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_02"); //V�t�m t� jm�nem na�eho ��du.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_IAmBack_11_03"); //Vid�m, �e se z tebe stal m�g. M� m� uzn�n�.
	};
	
	AI_Output (self ,other,"DIA_Oric_IAmBack_11_04"); //K� by byl tv�j p��chod dobr�m znamen�m.
};

//***********************************************
//	Kann ich helfen?
//***********************************************

INSTANCE DIA_Oric_CanHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 4;
	condition   = DIA_Oric_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;

	description = "Mohu n�jak pomoci?";
};

FUNC INT DIA_Oric_CanHelp_Condition()
{
	if 	(Kapitel >= 4)
	&&	(Npc_KnowsInfo (other,DIA_Oric_IAmBack))
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_15_00"); //Mohu n�jak pomoci?
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_01"); //Moment�ln� se zd�, �e jsme ud�lali v�echno, co bylo v na�ich sil�ch.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_02"); //Ale p�esto je tady jedna v�c. N�co velice d�le�it�ho, co bys pro n�s mohl ud�lat vn� t�chto zd�.
	AI_Output (self ,other,"DIA_Oric_CanHelp_11_03"); //Chceme useknout hadovi jeho hlavu.
	
	Info_ClearChoices (DIA_Oric_CanHelp);
	Info_AddChoice (DIA_Oric_CanHelp,"Mysl�m, �e se bude� muset poohl�dnout po n�kom jin�m.",DIA_Oric_CanHelp_NotYourMan); 
	Info_AddChoice (DIA_Oric_CanHelp,"Co t�m mysl�?",DIA_Oric_CanHelp_WhatYouMean);

};

FUNC VOID DIA_Oric_CanHelp_NotYourMan ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_NotYourMan_15_00"); //Mysl�m, �e byste si m�li naj�t n�koho jin�ho.
	AI_Output (self ,other,"DIA_Oric_CanHelp_NotYourMan_11_01"); //Nem��u postr�dat jedin�ho ze sv�ch lid� - jsi na�e jedin� nad�je.
};

FUNC VOID DIA_Oric_CanHelp_WhatYouMean ()
{
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_00"); //Co t�m mysl�?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_01"); //V�me o jednom z jejich v�dc�. Jmenuje se Hosh-Pak.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_02"); //Je to jeden z nejvlivn�j��ch �aman� mezi sk�ety.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_03"); //A co m�m ud�lat?
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_04"); //Zabij ho.
	AI_Output (other,self ,"DIA_Oric_CanHelp_WhatYouMean_15_05"); //�ertuje�!?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //Jsi jedin�, koho m��eme postr�dat. V�echny ostatn� ryt��e pot�ebujeme tady.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //Nen� pro m� snadn� cht�t po tob� n�co takov�ho, mist�e. Ale jsi pro tenhle �kol nejvhodn�j�� ze v�ech.
	}
	else
	{	
		AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_08"); //Chce� n�m p�ece pomoci, ne? V tom p��pad�...
	};
	
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_09"); //Hosh-Pak�v stan je za nep��telskou lini�, na ostrohu na jih odsud.
	AI_Output (self ,other,"DIA_Oric_CanHelp_WhatYouMean_11_10"); //Skoro ho m��e� vid�t z okna.
	

	Info_ClearChoices (DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};

//***********************************************
//	Ich brauche noch Ausr�stung.
//***********************************************

INSTANCE DIA_Oric_NeedStuff   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 6;
	condition   = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;

	description = "Budu pot�ebovat n�co v�bavy.";
};

FUNC INT DIA_Oric_NeedStuff_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NeedStuff_Info()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_15_00"); //Budu pot�ebovat p�r v�c�.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_01"); //U� toho nem�me moc, co bychom ti mohli d�t.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_11_02"); //No, ale mohu ti nab�dnout toto.
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
	Info_AddChoice (DIA_Oric_NeedStuff,"nebo 1 elix�r obratnosti",DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice (DIA_Oric_NeedStuff,"nebo 1 elix�r s�ly",DIA_Oric_NeedStuff_Strength);
	Info_AddChoice (DIA_Oric_NeedStuff,"nebo 3 elix�ry many",DIA_Oric_NeedStuff_Mana);	
	Info_AddChoice (DIA_Oric_NeedStuff,"3 elix�ry hojiv� s�ly",DIA_Oric_NeedStuff_Health); 
};

FUNC VOID DIA_Oric_NeedStuff_Health ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Health_15_00"); //Vezmu si ty l��iv� lektvary.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Health_11_01"); //Dobr� volba. A� ti jsou k u�itku.
	
	CreateInvItems (self,ItPo_Health_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Mana ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Mana_15_00"); //Vezmu si ty lektvary s manou.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Mana_11_01"); //Douf�m, �e ti pomohou. Nech� t� Innos ochra�uje.
	
	CreateInvItems (self,ItPo_Mana_03,3);
	B_GiveInvItems (self ,other,ItPo_Health_03,3);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Strength ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Strength_15_00"); //Vezmu si elix�r s�ly.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Strength_11_01"); //Tady je, ur�it� se ti bude hodit. P�eji ti hodn� �t�st�.

	CreateInvItems (self,ItPo_Perm_STR,1);
	B_GiveInvItems (self ,other,ItPo_Perm_STR,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

FUNC VOID DIA_Oric_NeedStuff_Dexterity ()
{
	AI_Output (other,self ,"DIA_Oric_NeedStuff_Dexterity_15_00"); //Vezmu si elix�r obratnosti.
	AI_Output (self ,other,"DIA_Oric_NeedStuff_Dexterity_11_01"); //Nech� tvoje ��py nikdy neminou c�l. Tady ho m�.

	CreateInvItems (self,ItPo_Perm_DEX,1);
	B_GiveInvItems (self ,other,ItPo_Perm_DEX,1);
	
	Info_ClearChoices (DIA_Oric_NeedStuff);
};

//***********************************************
//	ich werde keinen feigen Mord begehen.
//***********************************************

INSTANCE DIA_Oric_NoMurder   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 7;
	condition   = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;

	description = "Nezavra�d�m Hosh-Paka tak zbab�l�m zp�sobem.";
};

FUNC INT DIA_Oric_NoMurder_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	(MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_NoMurder_Info()
{
	AI_Output (other,self ,"DIA_Oric_NoMurder_15_00"); //Nezavra�d�m Hosh-Paka tak zbab�l�m zp�sobem.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_01"); //Dok�e� si v�bec p�edstavit, v jak stra�n� pozici se nach�z�me?
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_02"); //Obl�h� n�s obrovsk� arm�da sk�et�. Doch�zej� n�m z�soby.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_03"); //Pokud se n�m nepoda�� dostat rudu na lo�, zpusto�� sk�eti cel� kr�lovstv�.
	AI_Output (self ,other,"DIA_Oric_NoMurder_11_04"); //V�echno bude zni�eno.
};

//***********************************************
//	Ich werde dir helfen
//***********************************************

INSTANCE DIA_Oric_WillHelp   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 5;
	condition   = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent   = FALSE;
	description = "Dobr�. Zabiju Hosh-Paka.";
};

FUNC INT DIA_Oric_WillHelp_Condition()
{
	if 	(OrikToldMissionChapter4 == TRUE)
	&& 	MIS_KillHoshPak == FALSE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_WillHelp_Info()
{
	AI_Output (other,self ,"DIA_Oric_WillHelp_15_00"); //Dobr�. Zabiju Hosh-Paka.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_01"); //To r�d sly��m.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_02"); //Hosh-Pak�v stan je na mal�m ostrohu. U� jsi ho musel vid�t.
	AI_Output (self ,other,"DIA_Oric_WillHelp_11_03"); //Nen� daleko od cesty vedouc� k na�emu dolu. P��mo ve st�nu t� velk� hory.
	
	Log_CreateTopic (TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry (TOPIC_KillHoshPak,"Oric chce, abych odstranil sk�et�ho �amana Hosh-Paka. Jeho stan najdu na mal�m �tesu kousek za hradem."); 

	MIS_KillHoshPak = LOG_RUNNING;
};

//***********************************************
//	Hosh-Pak ist tot!
//***********************************************

INSTANCE DIA_Oric_HoshDead   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 8;
	condition   = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent   = FALSE;
	description = "Hosh-Pak je mrtv�!";
};

FUNC INT DIA_Oric_HoshDead_Condition()
{
	if 	(Npc_IsDead (Hosh_Pak))
	&& 	(MIS_KillHoshPak == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_HoshDead_Info()
{
	AI_Output (other,self ,"DIA_Oric_HoshDead_15_00"); //Hosh-Pak je mrtv�!
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_01"); //V�born�, to by m�lo zasadit sk�et�m slu�nou r�nu. Mo�n� m�me p�ece jenom n�jakou �anci.
	AI_Output (self ,other,"DIA_Oric_HoshDead_11_02"); //Mysl�m, �e bychom t�m m�li z�skat alespo� t�den �asu.
	
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillHosh_Pak);
};



//***********************************************
//	Irgendwelche Neuigkeiten?
//***********************************************

INSTANCE DIA_Oric_AnyNews   (C_INFO)
{
	npc         = PAL_251_Oric;
	nr          = 9;
	condition   = DIA_Oric_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent	 = 	TRUE;

	description = "Co je nov�ho?";
};

FUNC INT DIA_Oric_AnyNews_Condition()
{
	if 	(Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Oric_AnyNews_Info()
{

	AI_Output (other,self ,"DIA_Oric_AnyNews_15_00"); //Co je nov�ho?
	
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_01"); //Mysl� krom� toho, �e n�s napadli sk�eti?
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_02"); //Ano. Jsi n� hrdina. Zab�t v�echny draky nen� ��dn� proch�zka r��ov�m sadem, �ekl bych.
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_03"); //Zd� se, �e sk�et� se hluboce dotkla Hosh-Pakova smrt.
	}
	else
	{
		AI_Output (self ,other,"DIA_Oric_AnyNews_11_04"); //Sk�et� je ��m d�l t�m v�c. To nen� dobr�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_251_Oric;
	nr			 = 	3;
	condition	 = 	DIA_Oric_DragonPlettBericht_Condition;
	information	 = 	DIA_Oric_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"Pot�ebuju v�c informac� o drac�ch.";
};

func int DIA_Oric_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	&& (MIS_AllDragonsDead == FALSE)
	{
		return TRUE;
	};
};

var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;
func void DIA_Oric_DragonPlettBericht_Info ()
{
	AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_00"); //Pot�ebuju v�c informac� o drac�ch.
	
	if (MIS_KilledDragons == 1)
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_01"); //Jednoho jsem u� zabil. M��e� mi ��ct, kde najdu ty ostatn�?
	}
	else if (MIS_KilledDragons != 0) 
	{
		AI_Output (other, self, "DIA_Oric_DragonPlettBericht_15_02"); //M�m pocit, �e jsem se je�t� nedostal ke v�em drak�m. �e bych n�co p�ehl�dl?
	};
	
	if ((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE))
	&& 	((Oric_SwampdragonInfo_OneTime == FALSE)
		||	(Oric_RockdragonInfo_OneTime == FALSE)
		||	(Oric_FiredragonInfo_OneTime == FALSE)
		||	(Oric_IcedragonInfo_OneTime == FALSE))
	{
		if ((Npc_IsDead(Swampdragon))== FALSE)
		&& (Oric_SwampdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_03"); //Na z�pad od star�ho hradu vznikla b�hem n�kolika posledn�ch dn� velk� ba�ina. Nezd� se ti to n�jak podez�el�?
			B_LogEntry (TOPIC_DRACHENJAGD,"Oric mi dal aspo� n�jakou stopu: z�padn� od hradu se p�ed n�kolika dny zni�ehonic objevila hlubok� ba�ina. To je opravdu podez�el�."); 
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(Rockdragon))==FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_04"); //Daleko za sopkou na jihu je skaln� pevnost.
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_05"); //Na�i �pehov� hl�s�, �e ta pevnost je siln� st�e�en�. Mo�n� se tam ukr�v� jeden z nich.
			B_LogEntry (TOPIC_DRACHENJAGD,"Paladin�t� zv�dov� sd�lili Oricovi, �e kamenn� tvrz za sopkou na jihu je siln� st�e�ena. Oric se domn�v�, �e tam n�kde bude i drak."); 
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(FireDragon))==FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_06"); //Kdy� draci naposledy za�to�ili, ��kalo se, �e jeden zmizel pobl� sopky na jih odsud. M�l bys to tam prozkoumat.
			B_LogEntry (TOPIC_DRACHENJAGD,"Posledn� drak, kter� napadl hrad v Hornick�m �dol�, byl pot� spat�en pobl� sopky."); 
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if ((Npc_IsDead(IceDragon))==FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE)
		{
			AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_07"); //Na z�pad odsud je zamrzl� kraj. Nep�ekvapilo by m�, kdyby se tam ukr�val jeden z drak�.
			B_LogEntry (TOPIC_DRACHENJAGD,"Podle Orica by drak mohl s�dlit v zamrzl� oblasti na z�pad�."); 
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Oric_DragonPlettBericht_11_08"); //V tuto chv�li pro tebe bohu�el nic nem�m.
	};
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

INSTANCE DIA_Oric_KAP5_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP5_EXIT_Condition;
	information	= DIA_Oric_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP5_EXIT_Info()
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


INSTANCE DIA_Oric_KAP6_EXIT(C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 999;
	condition	= DIA_Oric_KAP6_EXIT_Condition;
	information	= DIA_Oric_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Oric_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Oric_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Oric_PICKPOCKET (C_INFO)
{
	npc			= PAL_251_Oric;
	nr			= 900;
	condition	= DIA_Oric_PICKPOCKET_Condition;
	information	= DIA_Oric_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kr�de� tohoto svitku bude zatracen� t�k�.)";
};                       

FUNC INT DIA_Oric_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (85 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Oric_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Oric_PICKPOCKET);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_BACK 		,DIA_Oric_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Oric_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Oric_PICKPOCKET_DoIt);
};

func void DIA_Oric_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 85)
	{
		B_GiveInvItems (self, other, ITSc_PalRepelEvil, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Oric_PICKPOCKET);
	}
	else
	{	
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Oric_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Oric_PICKPOCKET);
};

