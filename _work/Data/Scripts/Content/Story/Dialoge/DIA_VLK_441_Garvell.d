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
	description = "(Ukrást mu penêženku by mêlo být lehké jak hraèka.)";
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
	description	 = 	"Co tady dêláš?";
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
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //Co tady dêláš?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Stavím loë, protože se chci odsud dostat - co nejrychleji to pùjde.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Ale jak to tak vypadá, tu loë nikdy nedokonèím.
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
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Co nevidêt dorazí skâeti a srovnají mêsto se zemí.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //Proè si to myslíš?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Hochu, copak jsi nevidêl ty paladiny, co pobíhaj všude kolem? Proè si myslíš, ze jsou tady?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Âíkám ti, jsou tady, protože skâeti brzy zaútoèí. A nebude to nic hezkého.
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
	description	 = 	"Proè nemùžeš dokonèit loë?";
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
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //Proè nemùžeš dokonèit loë?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(pohrdavê) Máme milión problémù. Trup ještê není dostateènê pevný a poâád nám ještê chybí spousta fošen.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Ale na nový materiál už nemám moc zlata, a poslední dodávka byla prolezlá èervotoèem.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Moji chlapi nepracujou poâádnê. Jeden chce jen rychlou loë a druhý se zase zajímá jen o její výzdobu!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //Jako kdybychom nemêli dùležitêjší vêci na práci!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //A jeden z mých lidí najednou úplnê pâestal chodit do práce. Zaèínám mít obavy, že s takovou se naše práce ještê víc opozdí.
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

	description	 = 	"Tobê chybí nêjaký dêlník?";
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
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //Ty jsi pâišel o dêlníka?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Jo. Jmenuje se Monty a zmizel jako pára nad hrncem.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Ten línej šmejd nejspíš odtáhnul nêkam na statek a tam si žije jako prase v žitê. Nikdy jsem mu nemêl platit dopâedu.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell si stêžuje, že jeho dêlník Monty se už celý den neukázal v práci. Domnívá se, že si teë žije na vysoké noze nêkde s nêjakými sedláky."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Slyšel jsem, že se pohâešují i nêjací další lidé.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "Kdy jsi Montyho vidêl naposled?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //Slyšel jsem, že tu zmizeli i jiní lidé.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Vždyã to âíkám. Dêjou se tu moc zlý vêci.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Rybáâ Farim mi vyprávêl nêco podobnýho. Po jeho kámoši Williamovi taky jako by se slehla zem.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Vsadím se, že v tom mají prsty skâeti.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"O zmizení jeho pâítele Williama by nêco mohl vêdêt rybáâ Farim."); 
	
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
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //Je rybáâ. Myslím, že má chýši nêkde u skladu paladinù, ale nevím to úplnê jistê.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Farimova chýše leží kousek od skladu paladinù."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //Kdy jsi Montyho vidêl naposled?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(naštvanê) Už se neobtêžoval pâijít do práce aspoà dva dny.
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
	description	 = 	"A jak se vede TEË?";
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
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //A jak se vede TEË?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //Monty se vrátil! Zrovna peèlivê studuje plány!
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Teë už tu loë snad pâece jenom dostavíme.
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
	description	 = 	"Mùžu ti nêjak pomoci?";
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
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //Mùžu ti nêjak pomoct?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //To mùžeš. Zjisti, co mají paladinové za lubem. Zajímalo by mê, proè jsou tady.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //A taky bych mêl vêdêt, jestli se skâeti chystají zaútoèit - a jak daleko od mêsta jsou.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Jednoho z têch bastardù vidêli hned za mêstem.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Prostê mi dones tolik informací, kolik se ti podaâí získat.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Potâebuju vêdêt, kolik èasu mám na dokonèení lodi.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell by rád získal nêjaké informace o skâetech a také by ho zajímalo, proè se ve mêstê usadili paladinové.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Dobâe. Jestli zjistíš nêco dalšího, dej mi vêdêt.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Díky za informace. Takhle to vypadá, že na postavení lodi máme celou vêènost.
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
	description	 = 	"Mám nêjaké informace o skâetech.";
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
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Mám nêjaké informace o skâetech.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Tak povídej.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Zasekli se v Hornickém údolí a vypadá to, že tam chtêjí zùstat.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Aby nás udrželi v bezpeèí, hlídají paladinové prùsmyk do údolí.

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
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //Vážnê? Âekni mi to!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Paladinové jsou tu, aby získali magickou rudu z Hornického údolí, ne proto, že by oèekávali skâetí útok na mêsto.
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
	description	 = 	"A co se týká toho skâeta za mêstem...";
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
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //A ten skâet za mêstem...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //Anooo...?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //Nedêlej si s ním starosti. Mêstská stráž to s ním vyâídí.
	

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
	description	 = 	"Jak to jde v pâístavu?";
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
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //Jak to jde v pâístavu?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Skâeti nám jdou po krku a ty se ptáš na pâístav?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Jen jsem chtêl...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //Náš nejvêtší problém je v tom, že nemáme dost lodí, abychom se odsud mohli dostat.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Vlastnê je tu jen jedna loë, a ta patâí paladinùm. Urèitê ji tu nemají proto, aby nás na ní odsud dostali.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Jen se podívej sám, nic se tu nedêje.
	};
};























