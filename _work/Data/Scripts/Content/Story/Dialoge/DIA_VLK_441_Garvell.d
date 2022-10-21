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
	description = "(Ukrást mu penìenku by mìlo bıt lehké jak hraèka.)";
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
	description	 = 	"Co tady dìláš?";
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
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //Co tady dìláš?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Stavím loï, protoe se chci odsud dostat - co nejrychleji to pùjde.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Ale jak to tak vypadá, tu loï nikdy nedokonèím.
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
	description	 = 	"Proè tolik pospícháš?";
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
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //Proè tolik pospícháš?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Co nevidìt dorazí skøeti a srovnají mìsto se zemí.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Proè si to myslíš?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Hochu, copak jsi nevidìl ty paladiny, co pobíhaj všude kolem? Proè si myslíš, ze jsou tady?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Øíkám ti, jsou tady, protoe skøeti brzy zaútoèí. A nebude to nic hezkého.
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
	description	 = 	"Proè nemùeš dokonèit loï?";
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
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Proè nemùeš dokonèit loï?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(pohrdavì) Máme milión problémù. Trup ještì není dostateènì pevnı a poøád nám ještì chybí spousta fošen.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Ale na novı materiál u nemám moc zlata, a poslední dodávka byla prolezlá èervotoèem.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Moji chlapi nepracujou poøádnì. Jeden chce jen rychlou loï a druhı se zase zajímá jen o její vızdobu!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Jako kdybychom nemìli dùleitìjší vìci na práci!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //A jeden z mıch lidí najednou úplnì pøestal chodit do práce. Zaèínám mít obavy, e s takovou se naše práce ještì víc opozdí.
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

	description	 = 	"Tobì chybí nìjakı dìlník?";
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
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Ty jsi pøišel o dìlníka?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Jo. Jmenuje se Monty a zmizel jako pára nad hrncem.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Ten línej šmejd nejspíš odtáhnul nìkam na statek a tam si ije jako prase v itì. Nikdy jsem mu nemìl platit dopøedu.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell si stìuje, e jeho dìlník Monty se u celı den neukázal v práci. Domnívá se, e si teï ije na vysoké noze nìkde s nìjakımi sedláky."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Slyšel jsem, e se pohøešují i nìjací další lidé.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Kdy jsi Montyho vidìl naposled?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Slyšel jsem, e tu zmizeli i jiní lidé.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Vdy to øíkám. Dìjou se tu moc zlı vìci.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Rybáø Farim mi vyprávìl nìco podobnıho. Po jeho kámoši Williamovi taky jako by se slehla zem.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Vsadím se, e v tom mají prsty skøeti.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"O zmizení jeho pøítele Williama by nìco mohl vìdìt rybáø Farim."); 
	
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
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //Kde bych našel toho Farima?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //Je rybáø. Myslím, e má chıši nìkde u skladu paladinù, ale nevím to úplnì jistì.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Farimova chıše leí kousek od skladu paladinù."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Kdy jsi Montyho vidìl naposled?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(naštvanì) U se neobtìoval pøijít do práce aspoò dva dny.
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
	description	 = 	"A jak se vede TEÏ?";
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
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //A jak se vede TEÏ?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty se vrátil! Zrovna peèlivì studuje plány!
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Teï u tu loï snad pøece jenom dostavíme.
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
	description	 = 	"Mùu ti nìjak pomoci?";
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
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Mùu ti nìjak pomoct?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //To mùeš. Zjisti, co mají paladinové za lubem. Zajímalo by mì, proè jsou tady.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //A taky bych mìl vìdìt, jestli se skøeti chystají zaútoèit - a jak daleko od mìsta jsou.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Jednoho z tìch bastardù vidìli hned za mìstem.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Prostì mi dones tolik informací, kolik se ti podaøí získat.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Potøebuju vìdìt, kolik èasu mám na dokonèení lodi.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell by rád získal nìjaké informace o skøetech a také by ho zajímalo, proè se ve mìstì usadili paladinové.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Dobøe. Jestli zjistíš nìco dalšího, dej mi vìdìt.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Díky za informace. Takhle to vypadá, e na postavení lodi máme celou vìènost.
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
	description	 = 	"Mám nìjaké informace o skøetech.";
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
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Mám nìjaké informace o skøetech.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Tak povídej.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Zasekli se v Hornickém údolí a vypadá to, e tam chtìjí zùstat.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Aby nás udreli v bezpeèí, hlídají paladinové prùsmyk do údolí.

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
	description	 = 	"Vím, proè tu paladinové jsou.";
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
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //Vím, proè tu paladinové jsou.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //Vánì? Øekni mi to!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Paladinové jsou tu, aby získali magickou rudu z Hornického údolí, ne proto, e by oèekávali skøetí útok na mìsto.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //Jakmile dostanou rudu, vrátí se na pevninu.

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
	description	 = 	"A co se tıká toho skøeta za mìstem...";
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
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //A ten skøet za mìstem...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //Anooo...?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Nedìlej si s ním starosti. Mìstská strá to s ním vyøídí.
	

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
	description	 = 	"Jak to jde v pøístavu?";
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
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Jak to jde v pøístavu?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Skøeti nám jdou po krku a ty se ptáš na pøístav?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Jen jsem chtìl...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Náš nejvìtší problém je v tom, e nemáme dost lodí, abychom se odsud mohli dostat.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Vlastnì je tu jen jedna loï, a ta patøí paladinùm. Urèitì ji tu nemají proto, aby nás na ní odsud dostali.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Jen se podívej sám, nic se tu nedìje.
	};
};























