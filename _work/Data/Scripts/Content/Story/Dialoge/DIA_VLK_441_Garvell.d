///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Garvell_EXIT   (C_INFO)
{
	npc         = VLK_441_Garvell;
	nr          = 999;
	condition   = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garvell_PICKPOCKET (C_INFO)
{
	npc			= VLK_441_Garvell;
	nr			= 900;
	condition	= DIA_Garvell_PICKPOCKET_Condition;
	information	= DIA_Garvell_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukr�st mu pen�enku by m�lo b�t lehk� jak hra�ka.)";
};                       

FUNC INT DIA_Garvell_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket25) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garvell_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garvell_PICKPOCKET);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_BACK 		,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 10)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket25, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garvell_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_GREET		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_GREET_Condition;
	information	 = 	DIA_Garvell_GREET_Info;
	description	 = 	"Co tady d�l�?";
};
func int DIA_Garvell_GREET_Condition ()
{	
	if (Wld_IsTime (05,00,19,00))
	{	
			return TRUE;
	};
};
func void DIA_Garvell_GREET_Info ()
{
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //Co tady d�l�?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Stav�m lo�, proto�e se chci odsud dostat - co nejrychleji to p�jde.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Ale jak to tak vypad�, tu lo� nikdy nedokon��m.
};
///////////////////////////////////////////////////////////////////////
//	Info eilig
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_eilig		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_eilig_Condition;
	information	 = 	DIA_Garvell_eilig_Info;
	description	 = 	"Pro� tolik posp�ch�?";
};
func int DIA_Garvell_eilig_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_eilig_Info ()
{
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Pro� tolik posp�ch�?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Co nevid�t doraz� sk�eti a srovnaj� m�sto se zem�.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Pro� si to mysl�?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Hochu, copak jsi nevid�l ty paladiny, co pob�haj v�ude kolem? Pro� si mysl�, ze jsou tady?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //��k�m ti, jsou tady, proto�e sk�eti brzy za�to��. A nebude to nic hezk�ho.
};

///////////////////////////////////////////////////////////////////////
//	Info Schiff
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Schiff		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_Schiff_Condition;
	information	 = 	DIA_Garvell_Schiff_Info;
	description	 = 	"Pro� nem��e� dokon�it lo�?";
};
func int DIA_Garvell_Schiff_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_Schiff_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Pro� nem��e� dokon�it lo�?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(pohrdav�) M�me mili�n probl�m�. Trup je�t� nen� dostate�n� pevn� a po��d n�m je�t� chyb� spousta fo�en.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Ale na nov� materi�l u� nem�m moc zlata, a posledn� dod�vka byla prolezl� �ervoto�em.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Moji chlapi nepracujou po��dn�. Jeden chce jen rychlou lo� a druh� se zase zaj�m� jen o jej� v�zdobu!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Jako kdybychom nem�li d�le�it�j�� v�ci na pr�ci!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //A jeden z m�ch lid� najednou �pln� p�estal chodit do pr�ce. Za��n�m m�t obavy, �e s takovou se na�e pr�ce je�t� v�c opozd�.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Garvell_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_441_Garvell;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Garvell_MissingPeople_Condition;
	information	 = 	DIA_Addon_Garvell_MissingPeople_Info;

	description	 = 	"Tob� chyb� n�jak� d�ln�k?";
};

func int DIA_Addon_Garvell_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Garvell_Schiff)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{	
			return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Ty jsi p�i�el o d�ln�ka?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Jo. Jmenuje se Monty a zmizel jako p�ra nad hrncem.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Ten l�nej �mejd nejsp� odt�hnul n�kam na statek a tam si �ije jako prase v �it�. Nikdy jsem mu nem�l platit dop�edu.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell si st�uje, �e jeho d�ln�k Monty se u� cel� den neuk�zal v pr�ci. Domn�v� se, �e si te� �ije na vysok� noze n�kde s n�jak�mi sedl�ky."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Sly�el jsem, �e se poh�e�uj� i n�jac� dal�� lid�.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Kdy jsi Montyho vid�l naposled?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Sly�el jsem, �e tu zmizeli i jin� lid�.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //V�dy� to ��k�m. D�jou se tu moc zl� v�ci.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Ryb�� Farim mi vypr�v�l n�co podobn�ho. Po jeho k�mo�i Williamovi taky jako by se slehla zem.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Vsad�m se, �e v tom maj� prsty sk�eti.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"O zmizen� jeho p��tele Williama by n�co mohl v�d�t ryb�� Farim."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Kde toho Farima najdu?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Kde bych na�el toho Farima?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //Je ryb��. Mysl�m, �e m� ch��i n�kde u skladu paladin�, ale nev�m to �pln� jist�.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Farimova ch��e le�� kousek od skladu paladin�."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Kdy jsi Montyho vid�l naposled?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(na�tvan�) U� se neobt�oval p�ij�t do pr�ce aspo� dva dny.
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnMonty
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_ReturnMonty		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_ReturnMonty_Condition;
	information	 = 	DIA_Garvell_ReturnMonty_Info;
	description	 = 	"A jak se vede TE�?";
};
func int DIA_Garvell_ReturnMonty_Condition ()
{	
	if (Npc_GetDistToWP (Monty_NW, "NW_CITY_HABOUR_WERFT_IN_01") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_ReturnMonty_Info ()
{
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //A jak se vede TE�?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty se vr�til! Zrovna pe�liv� studuje pl�ny!
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Te� u� tu lo� snad p�ece jenom dostav�me.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_MISSION		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_MISSION_Condition;
	information	 = 	DIA_Garvell_MISSION_Info;
	permanent    =  FALSE;
	description	 = 	"M��u ti n�jak pomoci?";
};

func int DIA_Garvell_MISSION_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_eilig)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Garvell_MISSION_Info ()
{
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //M��u ti n�jak pomoct?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //To m��e�. Zjisti, co maj� paladinov� za lubem. Zaj�malo by m�, pro� jsou tady.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //A taky bych m�l v�d�t, jestli se sk�eti chystaj� za�to�it - a jak daleko od m�sta jsou.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Jednoho z t�ch bastard� vid�li hned za m�stem.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Prost� mi dones tolik informac�, kolik se ti poda�� z�skat.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Pot�ebuju v�d�t, kolik �asu m�m na dokon�en� lodi.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell by r�d z�skal n�jak� informace o sk�etech a tak� by ho zaj�malo, pro� se ve m�st� usadili paladinov�.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Dob�e. Jestli zjist� n�co dal��ho, dej mi v�d�t.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //D�ky za informace. Takhle to vypad�, �e na postaven� lodi m�me celou v��nost.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Orks		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	3;
	condition	 = 	DIA_Garvell_Orks_Condition;
	information	 = 	DIA_Garvell_Orks_Info;
	permanent    =  FALSE;
	description	 = 	"M�m n�jak� informace o sk�etech.";
};
func int DIA_Garvell_Orks_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Orks_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //M�m n�jak� informace o sk�etech.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Tak pov�dej.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Zasekli se v Hornick�m �dol� a vypad� to, �e tam cht�j� z�stat.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Aby n�s udr�eli v bezpe��, hl�daj� paladinov� pr�smyk do �dol�.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Paladine		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_Paladine_Condition;
	information	 = 	DIA_Garvell_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"V�m, pro� tu paladinov� jsou.";
};
func int DIA_Garvell_Paladine_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (KnowsPaladins_Ore == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //V�m, pro� tu paladinov� jsou.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //V�n�? �ekni mi to!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Paladinov� jsou tu, aby z�skali magickou rudu z Hornick�ho �dol�, ne proto, �e by o�ek�vali sk�et� �tok na m�sto.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Jakmile dostanou rudu, vr�t� se na pevninu.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Ork vor der Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_City		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	4;
	condition	 = 	DIA_Garvell_City_Condition;
	information	 = 	DIA_Garvell_City_Info;
	permanent    =  FALSE;
	description	 = 	"A co se t�k� toho sk�eta za m�stem...";
};
func int DIA_Garvell_City_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 2)
	{
		return TRUE;
	};
};
func void DIA_Garvell_City_Info ()
{
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //A ten sk�et za m�stem...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //Anooo...?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Ned�lej si s n�m starosti. M�stsk� str� to s n�m vy��d�.
	

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Perm		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	13;
	condition	 = 	DIA_Garvell_Perm_Condition;
	information	 = 	DIA_Garvell_Perm_Info;
	permanent    =  TRUE;
	description	 = 	"Jak to jde v p��stavu?";
};
func int DIA_Garvell_Perm_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_MISSION)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Perm_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Jak to jde v p��stavu?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Sk�eti n�m jdou po krku a ty se pt� na p��stav?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Jen jsem cht�l...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //N� nejv�t�� probl�m je v tom, �e nem�me dost lod�, abychom se odsud mohli dostat.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Vlastn� je tu jen jedna lo�, a ta pat�� paladin�m. Ur�it� ji tu nemaj� proto, aby n�s na n� odsud dostali.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Jen se pod�vej s�m, nic se tu ned�je.
	};
};























