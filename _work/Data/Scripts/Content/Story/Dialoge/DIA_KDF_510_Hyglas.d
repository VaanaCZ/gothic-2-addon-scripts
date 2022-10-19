///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Feuer
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Feuer		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Feuer_Condition;
	information	 = 	DIA_Hyglas_Feuer_Info;
	permanent	 = 	FALSE;
	description	 =  "Po�aduji zkou�ku ohn�.";
};
func int DIA_Hyglas_Feuer_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Pyrokar_FIRE) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Feuer_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_Feuer_15_00"); //Chci vykonat zkou�ku ohn�.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_01"); //Zkou�ka ohn� poch�z� ze star�ch �as� a u� velice dlouho j� nikdo nepodstoupil.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_02"); //Co po�aduje�, je velice nebezpe�n�. Rad�ji si to je�t� rozmysli.
};    
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Hallo		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Hallo_Condition;
	information	 = 	DIA_Hyglas_Hallo_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Hyglas_Hallo_Condition ()
{	
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Hyglas_Hallo_14_00"); //Jsem mistr Hyglas, Str�ce ohn� a Opatrovn�k v�domost�.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_01"); //Tak�e mistr Parlan ti dal svolen� ke studiu svitk�.
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_02"); //Tak�e p�esn� to bys te� m�l d�lat. Studovat, abys ve svat�ch knih�ch na�el osv�cen�.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_JOB		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_JOB_Condition;
	information	 = 	DIA_Hyglas_JOB_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co studuje� ty, Mist�e?";
};
func int DIA_Hyglas_JOB_Condition ()
{	
	return TRUE;
};
func void DIA_Hyglas_JOB_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_JOB_15_00"); //Co studuje� ty, mist�e?
	AI_Output (self, other, "DIA_Hyglas_JOB_14_01"); //M�j v�zkum se zam��uje na ohe� - Innosovu s�lu.
	AI_Output (self, other, "DIA_Hyglas_JOB_14_02"); //Je to jeho dar a z�rove� mocn� zbra� - a j� vytv���m runy, kter� obsahuj� jeho moc.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (other, self, "DIA_Hyglas_JOB_15_03"); //Velmi pou�n�. Mohl bys m� to nau�it?
		AI_Output (self, other, "DIA_Hyglas_JOB_14_04"); //Je to Innos, kdo d�v� dar magie. Jen jeho slu�ebn�k�m, ohniv�m m�g�m, je p��no vl�dnout jeho moc�.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info CONTEST
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_CONTEST		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_CONTEST_Condition;
	information	 = 	DIA_Hyglas_CONTEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Po��dal jsem o zkou�k u ohn�.";
};
func int DIA_Hyglas_CONTEST_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_CONTEST_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_00"); //Po��dal jsem o zkou�ku ohn�. Ulthar mi dal za �kol vytvo�it runu ohniv�ho ��pu.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_01"); //A te� po mn� chce�, abych t� nau�il p��slu�nou formuli?
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_02"); //Nezn�m nikoho jin�ho, kdo by to dok�zal.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_03"); //Hmm...
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_04"); //Dobr�, nau��m t� tu formuli. Ale nejd��v bude� muset naj�t v�echny pot�ebn� ingredience.
	
	B_LogEntry (TOPIC_Rune,"Pokud si obstar�m p��slu�n� ingredience, nau�� m� Hyglas zakl�nadlo pro runu ohniv�ho ��pu.");
};	
///////////////////////////////////////////////////////////////////////
//	Info FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_FIREBOLT		(C_INFO)
{
	npc		 	 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_FIREBOLT_Info;
	permanent	 =  FALSE;
	description	 = 	"Jak� ingredience pot�ebuji na vytvo�en� runy ohniv�ho ��pu?";
};
func int DIA_Hyglas_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_FIREBOLT_15_00"); //Jak� ingredience pot�ebuji na vytvo�en� runy ohniv�ho ��pu?
	AI_Output (self, other, "DIA_Hyglas_FIREBOLT_14_01"); //P�e�ti si to - je to tam v t�ch knih�ch.
};
///////////////////////////////////////////////////////////////////////
//	Info TALENT_FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TALENT_FIREBOLT		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	990;
	condition	 = 	DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Nau� m� vytvo�it runu OHNIV�HO ��PU.";

};
func int DIA_Hyglas_TALENT_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	&& (Npc_HasItems (other,ItMi_RuneBlank) >= 1)
	&& (Npc_HasItems (other,ItSc_Firebolt) >= 1)
	&& (Npc_HasItems (other,ItMi_Sulfur) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TALENT_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_TALENT_FIREBOLT_15_00"); //Nau� m� vytvo�it runu OHNIV�HO ��PU.
	
	if (B_TeachPlayerTalentRunes (self, other, SPL_Firebolt))	
	{
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_01"); //Pokud chce� sestavit runu ohniv�ho ��pu, mus� na runov�m stole spojit s�ru s runov�m kamenem.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_02"); //S�la ze svitku s kouzlem ohniv�ho ��pu vplyne do runy a ty z�sk� Innos�v n�stroj.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_03"); //Tak�e jakmile bude� m�t v�echny pot�ebn� v�ci, p�istup k runov�mu stolu a vytvo� svou runu.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info BLANK_RUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_BLANK_RUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	9;	
	condition	 = 	DIA_Hyglas_BLANK_RUNE_Condition;
	information	 = 	DIA_Hyglas_BLANK_RUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"Kde bych mohl naj�t runov� k�men?";
};
func int DIA_Hyglas_BLANK_RUNE_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_FIREBOLT)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (npc_hasItems (other, ItMI_RuneBlank) < 1) 
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_BLANK_RUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_BLANK_RUNE_15_00"); //Kde bych mohl naj�t runov� k�men?
	AI_Output (self, other, "DIA_Hyglas_BLANK_RUNE_14_01"); //Hele, jsi to ty, kdo po��dal o zkou�ku ohn�, ne j�. Naj�t jej je sou��st� zkou�ky.
};
///////////////////////////////////////////////////////////////////////
//	Info GOTRUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_GOTRUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =  2;
	condition	 = 	DIA_Hyglas_GOTRUNE_Condition;
	information	 = 	DIA_Hyglas_GOTRUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"Vytvo�il jsem tu runu.";
};
func int DIA_Hyglas_GOTRUNE_Condition ()
{
	if (Npc_KnowsInfo (hero,DIA_Ulthar_SUCCESS)== FALSE ) 
	&& (Npc_HasItems (hero, ItRu_Firebolt) >= 1)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_GOTRUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_GOTRUNE_15_00"); //Vytvo�il jsem tu runu.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_01"); //Inu dobr�. Zd� se, �e v t�to ��sti zkou�ky jsi obst�l. Konec konc� to nebylo a� tak t�k�.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_02"); //Jdi tedy za Utharem a uka� mu sv� d�lo.
	
	B_LogEntry (TOPIC_Rune,"Vytvo�il jsem runu ohniv�ho ��pu."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TEACH		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	15;
	condition	 = 	DIA_Hyglas_TEACH_Condition;
	information	 = 	DIA_Hyglas_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"U� m�.";
};
func int DIA_Hyglas_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TEACH_Info ()
{

	var int abletolearn;
	
	abletolearn = 0;
	AI_Output (other, self, "DIA_Hyglas_TEACH_15_00"); //U� m�.
	
	
	Info_ClearChoices (DIA_Hyglas_TEACH);
	Info_AddChoice 	  (DIA_Hyglas_TEACH, DIALOG_BACK,DIA_Hyglas_TEACH_BACK);	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2) 
	&& (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) 
	&& (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firestorm)) ,DIA_Hyglas_TEACH_Firestorm);
		abletolearn = (abletolearn +1);
	};
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4) 
	&& (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = (abletolearn +1);
	};
	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5) 
	&& (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6) 
	&& (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Hyglas_TEACH_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		B_Say (self, other, "$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices (DIA_Hyglas_TEACH);
	};
};
FUNC VOID DIA_Hyglas_TEACH_BACK ()
{
	Info_ClearChoices (DIA_Hyglas_TEACH);
};
FUNC VOID DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_Pyrokinesis()
{	
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);	
};
FUNC VOID DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);	
};
FUNC VOID DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};

//#######################################
//##
//##	Kapitel 2
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#######################################
//##
//##	Kapitel 3
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringBook
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_BringBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent   = FALSE;
	description = "Co je nov�ho?";
};
FUNC INT DIA_Hyglas_BringBook_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_BringBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_00"); //Je n�co nov�ho?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_01"); //Hm, ano. Asi sis u� v�iml t�ch postav v �ern�ch r�b�ch.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_02"); //Setkal jsem se s nimi.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_03"); //To n�s p�iv�d� k j�dru v�ci. V tuhle chv�li jsme sv�dky velice vz�cn� hv�zdn� konstelace.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_04"); //Abych byl p�esn�j��, znamen� Vola je v p�esn� korelaci se znamen�m V�le�n�ka. P�edpokl�d�m, �e v�, co to znamen�.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_05"); //Hmm. No, abych byl up��mn�...
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_06"); //Ano, dobr�, ch�pu. No, nem��u ti te� vysv�tlovat v�echno, ale ka�dop�dn� to p�edznamen�v� velk� zm�ny. A j� nem�m zm�ny r�d.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_07"); //Proto chci, abys mi z m�sta p�inesl jednu knihu. Jmenuje se "Posv�tn� moc hv�zd". Mo�n� ji bude� muset chvilku hledat, ale jsem si jist, �e ji nakonec objev�.
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	Info_AddChoice (DIA_Hyglas_BringBook,"Najdi si tu knihu s�m.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice (DIA_Hyglas_BringBook,"Co z toho budu m�t?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice (DIA_Hyglas_BringBook,"Uvid�m, jestli se mi ji poda�� naj�t.",DIA_Hyglas_BringBook_Yes);
};

FUNC VOID DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetItYourself_15_00"); //Najdi si tu knihu s�m.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_01"); //Jak se opova�uje� se mnou mluvit t�mto t�nem? Tvoje chov�n� postr�d� �ctu, kterou mi jsi povinov�n.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_02"); //B� mi z o�� a p�em��lej o sv�m chov�n�.
	
	MIS_HyglasBringBook = LOG_OBSOLETE;
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_00"); //Co z toho budu m�t?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_01"); //Co t�m mysl�?
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_02"); //R�d bych v�d�l, co dostanu za to, kdy� ti tu knihu p�inesu.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_03"); //Nic. Co bys myslel, �e dostane�? Pokud m� �as d�lat mi ve m�st� posl��ka, je p��mo tvou povinnost� mi pomoci.
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_Yes()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_Yes_15_00"); //Uvid�m, jestli se mi ji poda�� naj�t.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_01"); //To je spr�vn� - z�sk�m tak trochu �asu nav�c, abych se mohl poohl�dnout tak� po n��em jin�m.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_02"); //Ale a� ti to netrv� moc dlouho. Ob�v�m se, �e nem�me �asu nazbyt.
	
	MIS_HyglasBringBook = LOG_RUNNING;
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	
	Log_CreateTopic (TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HyglasBringBook,LOG_RUNNING);
	B_LogEntry (TOPIC_HyglasBringBook,"Hyglas m� po��dal, zda bych mu nena�el knihu 'Bo�sk� moc hv�zd'. Zkus�m se po n� pod�vat u m�stsk�ch obchodn�k�.");
};

//*********************************************************************
//	Ich hab dein Buch
//*********************************************************************

INSTANCE DIA_Hyglas_HaveBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent   = FALSE;
	description = "M�m pro tebe tu knihu.";
};
FUNC INT DIA_Hyglas_HaveBook_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	&& (Npc_HasItems (other,ItWr_Astronomy_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_HaveBook_15_00"); //M�m pro tebe tu knihu.
	
	IF Mis_HyglasBringBook == LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_01"); //V�born�, dej mi ji.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_02"); //Tak�e sis to nakonec p�ece jen rozmyslel. Velmi dob�e. Tak kde ji m�?
	};		
		
	B_GiveInvItems (other,self,ItWr_Astronomy_Mis,1);
	
	Mis_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP (XP_HyglasBringBook);
	
	
	AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_03"); //M��e� j�t. J� p�jdu studovat.
	
};

//#######################################
//##
//##	Kapitel 4
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm4
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_PERM   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 49;
	condition   = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent   = TRUE;
	description = "U� jsi na n�co p�i�el?";
};
FUNC INT DIA_Hyglas_Kap4_PERM_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_00"); //U� jsi na n�co p�i�el?
	
	if (Mis_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_01"); //No, nemohu si b�t �pln� jist�, ale zd� se, �e sou�asn� konstelace hv�zd poukazuje na mnoh� nebezpe��.
		AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_02"); //Jak� nebezpe��?
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_03"); //Inu, vypad� to, �e struktura mezi sv�ty je velice slab�. K vytvo�en� d�ry do t�to struktury je te� zapot�eb� jen zlomek s�ly co obvykle.
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_04"); //Takov�to port�ly pak mohou pou��vat d�moni ke vstupu do na�eho sv�ta, ani� by museli �elit n�jak�mu odporu.
		
		Hyglas_SendsToKarras = TRUE;
	}
	else if (Mis_HyglasBringBook == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_05"); //Ne, st�le �ek�m na tu knihu.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_06"); //�ekl jsem ti, �e st�le prov�d�m v�zkum, ale samoz�ejm� by mi to trvalo mnohem d�le, kdybych nem�l pot�ebn� materi�l.
	};
	
};

//#######################################
//##
//##	Kapitel 5
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hyglas_PICKPOCKET (C_INFO)
{
	npc			= KDF_510_Hyglas;
	nr			= 900;
	condition	= DIA_Hyglas_PICKPOCKET_Condition;
	information	= DIA_Hyglas_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Hyglas_PICKPOCKET_Condition()
{
	C_Beklauen (73, 200);
};
 
FUNC VOID DIA_Hyglas_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_BACK 		,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};
	
func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};

























