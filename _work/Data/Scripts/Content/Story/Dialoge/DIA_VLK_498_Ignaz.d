///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_EXIT   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 999;
	condition   = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ignaz_PICKPOCKET (C_INFO)
{
	npc			= VLK_498_Ignaz;
	nr			= 900;
	condition	= DIA_Ignaz_PICKPOCKET_Condition;
	information	= DIA_Ignaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ignaz_PICKPOCKET_Condition()
{
	C_Beklauen (38, 50);
};
 
FUNC VOID DIA_Ignaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_BACK 		,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
	
func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Hallo   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ignaz_Hallo_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Hallo_Info()
{
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_00");//� - p�i�el jsi pr�v� v�as. Pot�ebuju pro sv� magick� pokusy n�jak�ho asistenta.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_01");//Jsem si jist�, �e jsi cel� nedo�kav�, jak mi ve v�deck�m z�jmu ud�lat malou laskavost.
	AI_Output (other, self, "DIA_Ignaz_Hallo_15_02");//Pomalu, p��teli. Nejd��v mi �ekni, o co vlastn� jde.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_03");//Vymyslel jsem nov� kouzlo. Kouzlo zapomn�n�.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_04");//U� jsem �sp�n� provedl n�kolik praktick�ch zkou�ek, ale na fin�ln� test se mi nedost�v� �asu.
};
///////////////////////////////////////////////////////////////////////
//	Info Lerninhalte Traenke
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Traenke   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 3;
	condition   = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent   = FALSE;
	description = "Co z toho budu m�t, kdy� ti pom��u?";
};

FUNC INT DIA_Ignaz_Traenke_Condition()
{	
	if (MIS_Ignaz_Charm != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Traenke_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Traenke_15_00");//Co z toho budu m�t, kdy� ti pom��u?
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_01");//M��u t� nau�it, jak se p�ipravuj� lektvary.
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_02");//Zn�m recepty na l��ivou esenci, esenci many a lektvar rychlosti.
	//AI_Output (self, other, "DIA_Ignaz_Traenke_14_03");//Au�erdem kann ich dir beibringen, wie du ein Elixier der Geschicklichkeit herstellst.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Experiment
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Experiment   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 4;
	condition   = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent   = FALSE;
	description = "�ekni mi o tom experimentu a kouzlu v�c.";
};

FUNC INT DIA_Ignaz_Experiment_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Ignaz_Experiment_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_00");//�ekni mi o tom experimentu a kouzlu v�c.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_01");//To kouzlo m� za n�sledek, �e si ur�it� osoba nepamatuje r�zn� ud�losti.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_02");//U� se mi poda�ilo zjistit, �e to funguje, pokud je doty�n� osoba na�tvan� - nap��klad pokud j� n�kdo pr�v� dal nakl�da�ku, nebo ji oloupil.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_03");//Dokonce i kdy� je jen sv�dkem takov� ud�losti, tak se j� to pak vyma�e z pam�ti.
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_04");//To bych jako m�l n�koho srazit na zem a pak na n�j seslat kouzlo?
	AI_Output (other, self, "DIA_Ignaz_Add_15_00"); //Funguje to jen v p��pad�, �e je ob�� po boji OPRAVDU na�tvan�.
	AI_Output (other, self, "DIA_Ignaz_Add_15_01"); //(pro sebe) Tady v p��stavn� �tvrti se to ml�t� po��d. Rad�ji bych si m�l ob�� vyhl�dnout n�kde jinde.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_05");//Ano, m�m dojem, �es trefil h�eb��ek na hlavi�ku. Ale abys n�koho na�tval, sta��, abys ho napadl, nemus� ho srazit k zemi.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_06");//Tak�e by sis m�l vybrat n�koho, kdo je o samot� - pokud kolem budou lid�, jen se dostane� do pot�� s lordem Andrem.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_07");//Taky nem� ��dn� smysl ses�lat kouzlo na n�koho, kdo na tebe pr�v� �to��. Po�kej na ten spr�vn� okam�ik.
};	
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_teilnehmen   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 5;
	condition   = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent   = FALSE;
	description = "Dobr�, vyzkou��m to kouzlo.";
};

FUNC INT DIA_Ignaz_teilnehmen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Ignaz_Experiment)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_teilnehmen_Info()
{
	AI_Output (other, self, "DIA_Ignaz_teilnehmen_15_00");//Dobr�, vyzkou��m to kouzlo.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_01");//Tak si vezmi tenhle svitek a vyzkou�ej si �ivot pokusn� my�i.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_02");//A� to provede�, tak se vra� o tom poreferovat.
	
	B_GiveInvItems (self, other, ITSC_Charm,1);
	MIS_Ignaz_Charm = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ignaz,LOG_RUNNING);
	B_LogEntry (TOPIC_Ignaz,"M�m vyzkou�et nov� Ignazovo kouzlo - kouzlo zapomn�n�. Kdy� se na m� n�kdo p�i bitce nebo z jin�ho d�vodu rozhn�v�, ur�it� se se mnou u� nebude cht�t bavit. A tehdy nastane prav� chv�le pro pou�it� tohoto zakl�nadla.");
	B_LogEntry (TOPIC_Ignaz,"Tohle je ide�ln� p��le�itost vyzkou�et to kouzlo - pod jeho p�soben�m tak� zapomene ohl�sit mimo��dnou ud�lost. Nemysl�m si, �e by men�� rva�ka v p��stavu vzbudila velk� rozruch.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Running   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent   = FALSE;
	description = "K tomu experimentu...";
};

FUNC INT DIA_Ignaz_Running_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_RUNNING)
	&& (Charm_Test == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Running_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Running_15_00");//K tomu experimentu...
	AI_Output (self, other, "DIA_Ignaz_Running_14_01");//Tak co, usp�l jsi? Nebo jsi to kouzlo jen tak zb�hdarma vypl�tval? Co?
	AI_Output (self, other, "DIA_Ignaz_Running_14_02");//Jestli pot�ebuje� dal�� svitky, tak si je ode m� m��e� koupit.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Danach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent   = FALSE;
	description = "Pou�il jsem ten svitek.";
};
FUNC INT DIA_Ignaz_Danach_Condition()
{	
	if (Charm_Test == TRUE)
	&& (MIS_Ignaz_Charm == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Danach_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Danach_15_00");//Pou�il jsem ten svitek.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_01");//Fajn, fajn. A povedlo se?
	AI_Output (other, self, "DIA_Ignaz_Danach_15_02");//Ano, funguje to.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_03");//V�born�. Mal� krok pro v�du, ale obrovsk� pro m�!
	AI_Output (self, other, "DIA_Ignaz_Danach_14_04");//Te� m��u n�co ze sv�ho �asu vyu��t na to, abych t� zasv�til do taj� alchymie.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_05");//Taky ti m��u d�t n�kolik u�ite�n�ch v�c�, jestli m� z�jem.
	
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Ignaz mi uk�e n�kter� recepty na m�ch�n� lektvar�. �ije v p��stavn� �tvrti.");
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP (XP_MIS_Ignaz_Charm);
	
	//PATCH fallls alle Scrolls aufgekauft oder gepl�ndert wurden
	CreateInvItems (self,ITSC_Charm		, 3);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Trade   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent   = TRUE;
	trade 		= TRUE;
	description = "Uka� mi sv� zbo��.";
};
FUNC INT DIA_Ignaz_Trade_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_SUCCESS)
	|| (Npc_KnowsInfo (other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Ignaz_Trade_15_00");//Uka� mi sv� zbo��.
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Teach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent   = TRUE;
	description = "Nau� m� n�co z alchymie.";
};
//----------------------------------------
var int DIA_Ignaz_Teach_permanent;
//----------------------------------------

FUNC INT DIA_Ignaz_Teach_Condition()
{	
	if (DIA_Ignaz_Teach_permanent == FALSE)
	&& (Ignaz_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Ignaz_Teach_15_00");//Nau� m� n�co z alchymie.
	
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_ClearChoices (DIA_Ignaz_Teach);
		Info_AddChoice (DIA_Ignaz_Teach,DIALOG_BACK,DIA_Ignaz_Teach_BACK);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Lektvar rychlosti", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esence many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esence hojiv� s�ly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)) ,DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};
	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_01"); //K p��prav� lektvaru s pomoc� alchymistick� kolony pot�ebuje� laboratorn� ba�ku.
			AI_Output (self, other,"DIA_Ignaz_Teach_14_02"); //Na ka�d� lektvar bude� taky pot�ebovat r�zn� rostliny a dal�� ingredience.
			//AI_Output (self, other,"DIA_Ignaz_Teach_14_03"); //Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die ben�tigten Pflanzen daf�r sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_04"); //Co bys r�d v�d�l?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Ignaz_Teach_14_05"); //U� zn� v�echno, �emu bych t� mohl nau�it.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};
	
FUNC VOID DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices (DIA_Ignaz_Teach);
};

