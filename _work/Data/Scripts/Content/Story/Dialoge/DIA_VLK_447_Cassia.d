//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_EXIT   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 999;
	condition   = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Cassia_PICKME (C_INFO)
{
	npc			= VLK_447_Cassia;
	nr			= 900;
	condition	= DIA_Cassia_PICKME_Condition;
	information	= DIA_Cassia_PICKME_Info;
	permanent	= TRUE;
	description = Pickpocket_100_Female;
};                       

FUNC INT DIA_Cassia_PICKME_Condition()
{
	C_Beklauen (100, 400);
};
 
FUNC VOID DIA_Cassia_PICKME_Info()
{	
	Info_ClearChoices	(DIA_Cassia_PICKME);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_BACK 		,DIA_Cassia_PICKME_BACK);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_PICKPOCKET	,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cassia_PICKME);
};
	
func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices (DIA_Cassia_PICKME);
};
//////////////////////////////////////////////////////////////////////
//	Info Gilde
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Gilde   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Cassia_Gilde_Condition()
{	
	if (Cassia_Gildencheck == TRUE)
	&& (Join_Thiefs == TRUE)
	&& ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Gilde_Info()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Vid�m, �e ses p�idal na stranu pr�va a ��du.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//Nevad�, �e ses stal slu�ebn�kem Innose. Jsi jedn�m z n�s. A j� douf�m, �e se n�jak� zp�sob najde.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//Tak te� pat�� k Innosov� c�rkvi. Fajn, ale je�t� po��d jsi jedn�m z n�s - douf�m, �e jsi na to nezapomn�l.
	};
	
	
	AI_StopProcessInfos (self);
	
};
//////////////////////////////////////////////////////////////////////
//	Info Frist abgelaufen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Abgelaufen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Cassia_Abgelaufen_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Cassia_Frist == TRUE)  
	&& (Cassia_Day < (B_GetDayPlus() -2))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Abgelaufen_Info()
{
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Tv�j �as vypr�el. Nem�l ses vracet.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0); 
};
//////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_News   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Cassia_News_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_News_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Vid�m, �e jsi dostal n� dar. Jsem Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Dobr�, Cassio, tak mi �ekni, pro� jsem tady.
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Upoutal jsi na�i pozornost t�m, �e jsi dok�zal z�skat d�v�ru jednoho z na�ich p��tel.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//A my ti chceme d�t �anci. M��e� se k n�m p�idat.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//To se pod�vejme, kdo sem na�el cestu. Attila t� podcenil. Nehodl�m ud�lat stejnou chybu.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//Co to tady kujete?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Chceme t� p�ipravit o �ivot za to, �e jsi don�el na na�eho p��tele. Proto jsme poslali Attilu.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Nicm�n� - tvoje p��tomnost n�m poskytuje nov� mo�nosti...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//...co mi chce� nab�dnout?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//M��e� se k n�m p�idat.
	};
	if  (Npc_GetTrueGuild (other) == GIL_NONE)
	||  (Npc_GetTrueGuild (other) == GIL_NOV)
	{	
		Cassia_Gildencheck = TRUE;
	};
	
	DG_gefunden = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Erz�hle mir mehr 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_mehr   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent   = FALSE;
	description = "�ekni mi o va�� organizaci v�c.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//�ekni mi o va�� organizaci v�c.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//Lid� z m�sta jsou n�mi trochu znepokojeni. Ale nikdo nezn� n� �kryt.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Ta hrstka lid�, co v� o existenci stok, v���, �e jsou zam�en� a nikdo se do nich nem��e dostat.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//A dokud se do nich nikdo nedostane, m��eme v klidu pracovat.
};

//////////////////////////////////////////////////////////////////////
//	Vermisste Leute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_MissingPeople   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent   = FALSE;
	description = "Co v� o t�ch zmizel�ch lidech?";
};

FUNC INT DIA_Cassia_MissingPeople_Condition()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cassia_MissingPeople_Info()
{
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //V� n�co v�c o t�ch poh�e�ovan�ch lidech?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //A co je ti vlastn� po tom?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Chci zjistit, co se s nimi stalo.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Kdy� vyleze� ze stok, plavej chv�li d�l pod�l pob�e�� doprava.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //Tam najde� odpov�di.
};


//////////////////////////////////////////////////////////////////////
//	Info Was habe ich davon? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Vorteil   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent   = FALSE;
	description = "Co z toho budu m�t, kdy� se k v�m p�id�m?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//Co z toho budu m�t, kdy� se k v�m p�id�m?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//M��e� se od n�s nau�it p�r zaj�mavejch v�c� - schopnosti, kter� ti umo�n� ��t v p�epychu.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Ale nemus�m se skr�vat tady dole, nebo jo?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//(tich� sm�ch) Ne. Mus� jen dodr�ovat na�e pravidla. To je v�echno.
};
//////////////////////////////////////////////////////////////////////
//	Info Was kann ich bei euch lernen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Lernen  (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 4;
	condition   = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent   = FALSE;
	description = "Co se od v�s m��u nau�it?";
};

FUNC INT DIA_Cassia_Lernen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Lernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//Co se od v�s m��u nau�it?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper je mistrem v pl�en�. Uk�e ti, jak se nehlu�n� pohybovat.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ramirez je v�jime�n� nadan� zlod�j. Jeho ru�i�k�m neodol� ��dn� z�mek.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//A j� t� nau��m, jak si p�ivlast�ovat obsahy kapes. Ciz�ch.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Taky ti pom��u s t�m, jak dos�hnout v�t�� obratnosti. Proto�e obratnost je kl��em ke tv�m schopnostem.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia m� nau�� kaps��stv� a pom��e mi zv��it obratnost.");
	B_LogEntry(Topic_CityTeacher,"Ramirez m� nau��, jak p��it z�mky.");
	B_LogEntry(Topic_CityTeacher,"Jesper m� nau�� pl�en�.");
};
//////////////////////////////////////////////////////////////////////
//	Info Regeln 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Regeln   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent   = FALSE;
	description = "Jak� jsou va�e pravidla?";
};

FUNC INT DIA_Cassia_Regeln_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Regeln_Info()
{
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//Jak� jsou va�e pravidla?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//Za prv�: Ne�pitne� o n�s ani sl�vko. Nikomu. Nikdy.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Za druh�: Nenech� se chytit.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Za t�et�: Jestli tady dole na n�koho vyt�hne� zbra�, zabijeme t�.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//A �tvrt�, posledn� pravidlo je: Ka�d�, kdo se k n�m chce p�idat, mus� prok�zat, �e k n��emu je.
};
//////////////////////////////////////////////////////////////////////
//	Info Was passiert, wenn ich erwischt werde? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Erwischen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent   = FALSE;
	description = "Co se stane, kdy� m� chytnou?";
};

FUNC INT DIA_Cassia_Erwischen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Erwischen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//Co se stane, kdy� m� chytnou?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Prost� se nenech chytit, jasn�?
};
//////////////////////////////////////////////////////////////////////
//	Info Wie muss ich mich beweisen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_beweisen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent   = TRUE;
	description = "Jak m�m dok�zat, �e jsem co k �emu?";
};
//--------------------------------------
var int DIA_Cassia_beweisen_permanent;
//-------------------------------------
FUNC INT DIA_Cassia_beweisen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	&& (DIA_Cassia_beweisen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_beweisen_Info()
{
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//Jak m�m dok�zat, �e jsem co k �emu?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Tak p�id� se k n�m, nebo ne?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Ten pali�atej starej alchymista - Constantino - m� n�dhern� prsten.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Ale jemu v�n� nen� k ni�emu. Chci, aby zdobil mou ruku.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia po mn� chce, abych j� p�inesl Constantin�v prsten.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Beitreten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Beitreten   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent   = FALSE;
	description = "OK, jdu do toho.";
};

FUNC INT DIA_Cassia_Beitreten_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Beitreten_Info()
{
	AI_Output (other, self, "DIA_Cassia_Beitreten_15_00");//Dobr�, jdu do toho.
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//V�born�. Dostal jsi �anci prok�zat, co v tob� v�z�. A jestli se chce� od n�s n��emu p�iu�it, jsi tady v�t�n.
	
	Join_Thiefs = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Und wenn ich euch nicht beitrete...? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Ablehnen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 9;
	condition   = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent   = FALSE;
	description = "A co kdy� se k v�m nebudu cht�t p�idat?";
};

FUNC INT DIA_Cassia_Ablehnen_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//A co kdy� se k v�m nebudu cht�t p�idat...?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Zahazuje� �anci, kter� se naskytne jen jednou, ale m��e� j�t.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(v�n�) A ani nepomysli na to, �e bys n�s n�komu prozradil. Mohl bys toho trpce litovat.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Mus�m si to rozmyslet.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//V tom p��pad� t� zabiju.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"OK, jdu do toho.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"No tak si m� zkus zab�t.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//Dobr�, jdu do toho.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(usm�v� se) U�inil jsi spr�vn� rozhodnut�. Jestli usp�je� ve zkou�ce, m��e� roz���it na�e �ady.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Jestli se chce� nejprve nau�it zlod�jsk� dovednosti, poslu� si - bude� je pot�ebovat.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//No tak si m� zkus zab�t.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//To je zl�. M�l jsem dojem, �e jsi chyt�ej��.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Mus�m si to rozmyslet.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Jak chce�. D�v�m ti dva dny na rozmy�lenou. Po uplynut� lh�ty u� se tu nesm� uk�zat.
	
	Cassia_Day = B_GetDayPlus ();
	Cassia_Frist = TRUE;
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};


//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_BevorLernen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 5;
	condition   = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent   = TRUE;
	description = "M��e� m� n�co nau�it?";
};
FUNC INT DIA_Cassia_BevorLernen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& ((Cassia_TeachPickpocket == FALSE)
	|| (Cassia_TeachDEX == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//M��e� m� n�co nau�it?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Jasn�, ��dn� probl�m. Prost� mi dej v�d�t, a� bude� p�ipraven.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Jasn�. Kaps��stv� a obratnost t� bude ka�d� st�t 100 zlat�ch.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Mo�n� pozd�ji. (ZP�T)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Cht�l bych se nau�it kaps��sk�mu um�n� (zaplatit 100 zla��k�).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Chci se st�t obratn�j��m (zaplatit 100 zla��k�).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices (DIA_Cassia_BevorLernen);
};
FUNC VOID DIA_Cassia_BevorLernen_DEX()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Chci dos�hnout v�t�� obratnosti. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//M��eme za��t hned, jak bude� p�ipraven.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Vra� se, a� bude� m�t zlato.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Chci se dozv�d�t n�co o kaps��stv�. Tady je zlato.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//M��eme za��t hned, jak bude� p�ipraven.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Vra� se, a� bude� m�t zlato.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_447_Cassia;
	nr			 = 	12;
	condition	 = 	DIA_Cassia_TEACH_Condition;
	information	 = 	DIA_Cassia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Cht�l bych b�t o n�co obratn�j��.";
};
func int DIA_Cassia_TEACH_Condition ()
{	
	if (Cassia_TeachDEX == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_Cassia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Cht�l bych b�t o n�co obratn�j��.
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
};
func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Cassia_TEACH);
};
func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Pickpocket   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent   = TRUE;
	description = "Uka� mi, jak vyb�rat ciz� kapsy. (10 VB)";
};

FUNC INT DIA_Cassia_Pickpocket_Condition()
{	
	if (Cassia_TeachPickpocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Pickpocket_Info()
{
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Uka� mi, jak se vyb�raj� kapsy.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Jestli chce� n�komu vypr�zdnit kapsy, rozptyl ho. Prost� si s n�m za�ni pov�dat, ho�te �e�.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Zat�mco na n�j mluv�, po��dn� si ho odhadni. V��mej si nacpan�ch kapes, �perk� nebo ko�en�ch �em�nk� kolem krku. A hlavn� si hl�dej, jak moc je ten chl�pek v��mav�.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Obrat nalit�ho n�den�ka nen� to sam� jako okr�st ostra�it�ho obchodn�ka, m�j to na pam�ti.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Kdy� bude� neohraban�, tak samoz�ejm� bude �uchat zradu. Tak hlavn� kl�dek.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Aufnahme
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Aufnahme   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent   = FALSE;
	description = "Dostal jsem Constantin�v prsten.";
};

FUNC INT DIA_Cassia_Aufnahme_Condition()
{	
	if (MIS_CassiaRing == LOG_RUNNING)
	&& (Npc_HasItems (other, ItRi_Prot_Point_01_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Aufnahme_Info()
{
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//Dostal jsem Constantin�v prsten.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Gratuluju. Pro�el jsi vstupn� zkou�kou. Te� jsi opravdu jedn�m z n�s.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Vezmi si tenhle kl��. Je od dve�� od hotelu. (�sm�v) Tak nebude� muset poka�d� plavat.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//Taky bys m�l v�d�t, �e m�me tajn� znamen�. Zvl�tn� k�vnut�.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//P�esn�. Kdy� bude� mluvit s t�m prav�m �lov�kem a ud�l� tenhle posunek, bude v�d�t, �e jsi jedn�m z n�s.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Byl jsem p�ijat do zlod�jsk�ho cechu."); 
	B_LogEntry (Topic_Diebesgilde,"Nau�il jsem se zlod�jsk� sign�l - kdy� jej uk�u t�m spr�vn�m lidem, poznaj�, �e jsem jedn�m z nich.");
	 
	
};
//////////////////////////////////////////////////////////////////////
//	Info Versteck
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Versteck   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent   = FALSE;
	description = "Tak kde ukr�v�te svou ko�ist?";
};

FUNC INT DIA_Cassia_Versteck_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Ramirez_Beute)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Versteck_Info()
{
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//Tak kde ukr�v�te svou ko�ist?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Hele, snad si v�n� nemysl�, �e ti tohle �eknu?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Bude� m�t dost p��le�itost�, aby sis u�il sv� vlastn� ko�isti. Pamatuj - kdo je moc nenasytn�, skon�� s pr�zdn�ma rukama.
};
//////////////////////////////////////////////////////////////////////
//	Info Blutkelche
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Blutkelche   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent   = FALSE;
	description = "M� pro m� pr�ci?";
};

FUNC INT DIA_Cassia_Blutkelche_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (MIS_CassiaKelche != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Blutkelche_Info()
{
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//M� pro m� pr�ci?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//Ne do t� doby, co t� ve m�st� budou zn�t jako zlod�je.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Nejd��v uklidni situaci - zapla� pokutu nebo se zbav sv�dk�, je mi to jedno. Prost� to n�jak vy�e�.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//Ano. Je tady sada kalich�. Je jich �est.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//Kr�l Rhobar je z�skal na jedn� ze sv�ch v�le�n�ch v�prav -  ale ob�toval mnoho mu�� na to, aby si je mohl odv�zt. Proto se jim ��k� krvav� kalichy.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//��dn� z t�ch kalich� nem� s�m o sob� velkou cenu - ale v�ech �est pohromad� p�edstavuje cel� jm�n�.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//Kde jsou ty kalichy?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Jsou tady, ve m�st� - pat�� bohat�m obchodn�k�m z horn� �tvrti.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//P�ines mi je. J� se zat�m pokusit sehnat na n� kupce.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//Co z toho budu m�t?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//Bu� polovinu zisku, nebo si m��e� vz�t jeden zaj�mav� p�edm�t z m� ko�isti.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia m� po��dala, abych j� p�inesl �est krvav�ch kalich�. Nejsp� je v�echny najdu kdesi ve m�st�.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Kelche abgeben
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_abgeben   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent   = TRUE;
	description = "Co se t�k� t�ch kalich�...";
};

FUNC INT DIA_Cassia_abgeben_Condition()
{	
	if (MIS_CassiaKelche == LOG_RUNNING)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_abgeben_Info()
{
	AI_Output (other, self, "DIA_Cassia_abgeben_15_00");//Pokud jde o ty kalichy...
	
	if B_GiveInvItems (other, self, ItMi_BloodCup_MIS,6)
	{
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//M�m t�ch �est kalich�.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Dobr� pr�ce. J� jsem zat�m na�la kupce.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//M��e� si hned vz�t svou odm�nu. D�k, �es to pro m� ud�lal.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//U� pro tebe nem�m nic na pr�ci - ale m��e� se ode m� kdykoli n��emu nau�it. A nav�c, na tomhle ostrov� je toho dost, co jen �ek�, a� si to n�kdo vezme. (usm�v� se)
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//M��u ty kalichy prodat jen jako sadu. P�ines mi je v�echny.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Belohung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Belohnung   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent   = FALSE;
	description = "P�i�el jsem si pro svoji odm�nu.";
};

FUNC INT DIA_Cassia_Belohnung_Condition()
{	
	if (MIS_CassiaKelche == LOG_SUCCESS)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Belohnung_Info()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//P�i�el jsem si pro svoji odm�nu.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//Co sis vybral?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 zla��k�.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 elix�ry hojiv� s�ly",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice (DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING ,DIA_Cassia_Belohnung_Ring);
	
};
FUNC VOID DIA_Cassia_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_02");//Dej mi zlato.
	B_GiveInvItems (self, other, ItmI_Gold,400);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Trank()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_03");//Dej mi lektvary.
	B_GiveInvItems (self, other, ItPo_Health_03,4);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Ring()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_04");//Dej mi prsten.
	B_GiveInvItems (self, other, ItRi_Hp_01,1);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
