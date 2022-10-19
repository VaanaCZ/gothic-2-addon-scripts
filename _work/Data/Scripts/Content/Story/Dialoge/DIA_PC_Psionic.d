// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_EXIT_Condition;
	information	= DIA_Lester_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_Hello (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Hello_Condition;
	information	= DIA_Lester_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       
FUNC INT DIA_Lester_Hello_Condition()
{	
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Hello_Info()
{	
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//Jsi to TY? - Opravdu! Chlape, ani netušíš, jak rád tê vidím!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Mêl bych tê znát?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lestere! Jak ses sem dostal?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lestere! Jak ses sem dostal?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//Byl to šílený útêk. Když bariéra vybuchla, chvíli jsem se naprosto zmatenê toulal po okolí.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Pak jsem se celé dny snažil probojovat skrz tyhle lesy, až jsem koneènê našel tohle údolí.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten a Gorn jsou poâád v Hornickém údolí. Aspoà si to myslím.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Mêl bych tê znát?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Haló? Je nêkdo doma? Riskoval jsem vlastní kùži, abys mohl dostat ten divný kámen.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Nêco mi dlužíš. TENTOKRÁT by sis to mêl pamatovat.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Pamatuješ ještê na Diega, Miltena a Gorna?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten a KDO?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Jasnê. Co je s nimi?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasnê. Co je s nimi?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Pokud vím, tak znièení bariéry mêli pâežít.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nemám ponêtí, kde jdou teë - všichni tâi ještê nejspíš dâepí nêkde v Hornickém údolí.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Kdybys na nê náhodou narazil, dej mi vêdêt.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten a KDO?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nesnaž se mi namluvit, že si na to nepamatuješ. Ty ohniskové kameny - ten trol - ta ohromná kupa rudy vodních mágù?
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Nejsem si jistý...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//To pâijde. I mnê chvíli trvalo, než jsem si to všechno v hlavê srovnal.
};
// ************************************************************
// 		  				  Was ist passiert?		//E1
// ************************************************************
INSTANCE DIA_Lester_WhatHappened (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_WhatHappened_Condition;
	information	= DIA_Lester_WhatHappened_Info;
	permanent	= FALSE;
	description = "Co se stalo?";
};                       
FUNC INT DIA_Lester_WhatHappened_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_WhatHappened_Info()
{	
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_00");	//Co se stalo?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Co byl Spáè poražen, celé bratrstvo ztratilo hlavu.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Bez vùdce byli jako prázdné skoâápky.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co bylo s tebou?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//Já na tom byl úplnê stejnê. Mêl jsem noèní mùry a dokonce halucinace. Ale jakmile jsem zaèal více ménê pâemýšlet zase normálnê, utekl jsem.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Jednou se mi zdálo, že vidím obrovský èerný stín, jak vyrazil na skupinu uprchlíkù a spálil je na prach.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//V tu chvíli jsem si vážnê myslel, že mê pâišel zabít drak.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Vidêl jsi ještê nêco?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_08");	//Ne - vzal jsem nohy na ramena a utekl!
};
// ************************************************************
// 		  				   Minental		 		//E1 
// ************************************************************
INSTANCE DIA_Lester_MineColony (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_MineColony_Condition;
	information	= DIA_Lester_MineColony_Info;
	permanent	= FALSE;
	description = "Jak dlouho se už ukrýváš v tomhle údolí?";
};                       
FUNC INT DIA_Lester_MineColony_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
		&& (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_MineColony_Info()
{	
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_00");	//Jak dlouho se už ukrýváš v tomhle údolí?
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//Pâesnê to nevím. Možná týden. Ale napadá mê ještê jedna vêc:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Když jsem sem jednoho veèera pâišel, podíval jsem se na vrcholek hory - bylo tam jenom pár stromù.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//A když jsem se tam podíval druhý den ráno, stála tam vêž. Pâísahal bych, že tam pâedtím nebyla. Od té doby jsem z údolí nevytáhl paty.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Myslíš Xardasovu vêž? Vêdêl jsem, že je mocný, ale vytvoâit vêž jenom tak...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Nekromant Xardas? To on žije v té vêži? Nevím, jestli se mi to dvakrát zamlouvá.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Uklidni se, byl to právê on, kdo mê zachránil ze Spáèova chrámu. Je na naší stranê.
};
///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_SEND_XARDAS_Condition;
	information	 = 	DIA_Lester_SEND_XARDAS_Info;
	permanent	 = 	FALSE;
	description	 = 	"O tom stínu musíš povêdêt Xardasovi...";
};
func int DIA_Lester_SEND_XARDAS_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo (other,DIA_Lester_MineColony)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_SEND_XARDAS_Info ()
{
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Musíš âíct Xardasovi o tom stínu, mohlo by to být dùležité.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Ty si nemyslíš, že to byl jen výplod mojí pâedstavivosti? To jako že to doopravdy byl...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //...drak. Ano.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Zase se do toho pouštíš po hlavê, že?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Neâekl bych, že po hlavê... ještê ne.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(povzdychne si) No dobrá, když je to tak dùležité, tak za ním pùjdu - ale ne hned teë.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Teë si chci odpoèinout. Ještê poâád jsem úplnê vyèerpaný z toho útêku z trestanecké kolonie.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Âekl bych, že máš velké plány. Uvidíme se pozdêji u Xardase.
	
	AI_StopProcessInfos (self);
	
	//wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_STADT_Condition;
	information	 = 	DIA_Addon_Lester_STADT_Info;

	description	 = 	"Mám namíâeno do KHORINIDU! Co bys mi o tom mêstê âekl?";
};

func int DIA_Addon_Lester_STADT_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_STADT_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Mám namíâeno do Khorinidu, víš o tom mêstê nêco zajímavého?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? No, to je jen obyèejný pâístav, nic zvláštního.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Proè se ptáš?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Musím zajít za paladiny, kteâí se prý ve mêstê usadili.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(smêje se) Vážnê? Haha! Vždyã tê nepustí ani do mêsta, natož do paladinského sídla!
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Lester_Vorschlag_Condition;
	information	 = 	DIA_Addon_Lester_Vorschlag_Info;

	description	 = 	"Napadá tê, jak bych se do mêsta nejlépe dostal?";
};

func int DIA_Addon_Lester_Vorschlag_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //A nenapadá tê, jak bych se mohl do mêsta dostat?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Urèitê jo. Pâed èasem jsem tam pracoval pro starého alchymistu Constantina.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //Má ve mêstê docela vliv a stráže mají nakázáno, že mají bránou vpustit každého, kdo mu bude moci prodat nêjaké vzácné byliny.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //Takže je to jednoduchý. Nasbíráš hromadu bylin, které tu všude rostou, budeš pâedstírat, že pracuješ pro Constantina, a tak se dostaneš dovnitâ.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Ale ne abys sbíral všechno možné. Stráže nejsou moc bystré a o alchymii nemají ani páru.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Pustí tê dovnitâ, když uvidí poâádnou hromádku nêjaké rostliny.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Myslím, že staèí nasbírat 10 kouskù od jednoho druhu.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Díky za tip.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester tvrdí, že pâes mêstské stráže se dostanu, ponesu-li aspoà 10 kouskù nêjaké byliny a âeknu jim, že jsou urèeny pro starého alchymistu Constantina."); 
	
	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information	 = 	DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;

	description	 = 	"Ta vêc s bylinami pro Constantina fungovala pâímo zázraènê.";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition ()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Ta vêc s bylinami pro Constantina fungovala jako kouzlo. Dostal jsem se tak kolem stráží.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Jak jsem âekl. Obèas bys mê mohl trochu poslouchat, pâíteli.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 		  		Perm	
// ************************************************************
INSTANCE DIA_Lester_Perm (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Perm_Condition;
	information	= DIA_Lester_Perm_Info;
	permanent	= TRUE;
	description = "Co víš o tomhle místê?";
};                       
FUNC INT DIA_Lester_Perm_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_LESTER") <= 2000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Perm_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Co víš o tomhle místê?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Když pùjdeš tudy dolù, dojdeš na farmu. O kousek dál už zaèíná mêsto.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Ale buë opatrný. Nepotulují se tam jen vlci a krysy, ale také goblini a banditi!
};
// ************************************************************
// 		  		Sleep
// ************************************************************
INSTANCE DIA_Lester_Sleep (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 99;
	condition	= DIA_Lester_Sleep_Condition;
	information	= DIA_Lester_Sleep_Info;
	permanent	= TRUE;
	description = "Ještê poâád jsi unavený?";
};                       
FUNC INT DIA_Lester_Sleep_Condition()
{
	if  (Kapitel < 3)
	&& (Npc_GetDistToWP (self, "NW_XARDAS_TOWER_IN1_31") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_Sleep_Info()
{	
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Ještê poâád jsi unavený?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//A jak. (zívne si) Âekl jsem Xardasovi všechno. Teë se na chvilku prospím. Tak den...
	AI_Output	(self, other,"DIA_Lester_Sleep_13_02");	//dva... možná déle.
	
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

INSTANCE DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP3_EXIT_Condition;
	information	= DIA_Lester_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN		(C_INFO) 
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_BACKINTOWN_Condition;
	information	 = 	DIA_Lester_BACKINTOWN_Info;
	important	 = 	TRUE;
};
func int DIA_Lester_BACKINTOWN_Condition ()
{	
	if (Npc_GetDistToWP (self, "LEVELCHANGE") <= 500) 
		&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lester_BACKINTOWN_Info ()
{
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Hej, koneènê ses vrátil! Musíš jít okamžitê za Xardasem, máme problém.
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //Tak tomu naprosto vêâím.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Co jsi odešel, propuklo naprosté peklo.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Promluv si s Xardasem, èeká na tebe!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas mi pro tebe dal tuhle runu. S její pomocí se k nêmu dostaneš rychleji. Setkáme se tam.
	
	CreateInvItems 		(self,ItRu_TeleportXardas,1);
	B_GiveInvItems 		(self,other,ItRu_TeleportXardas,1);
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");	//Joly: Lester geht wieder zurück in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3		(C_INFO)
{
	npc		 = 	PC_Psionic;
	nr		 = 	900;
	condition	 = 	DIA_Lester_PERM3_Condition;
	information	 = 	DIA_Lester_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nevypadáš zrovna nadšenê.";
};

func int DIA_Lester_PERM3_Condition ()
{
	if (Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Nevypadáš zrovna nadšenê.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //Taky moc nadšený nejsem, chlape. Jsem úplnê vyâízený a poâád mê bolí hlava.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Pokaždé, když se objeví ty èerné kápê, tak se to zhorší.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //A já ti mùžu pâesnê âíct, proè to tak je.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Jo? Myslím, že to ani nechci vêdêt.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Ty èerné kápê - neboli Pátraèi, jak jim âíkáme my mágové - bývali pâívrženci mocného arcidémona. Neâíká ti to nic?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Hmm. Ne. Leda že by ses mi snažil naznaèit, že...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Ano, pâesnê. Ti Pátraèi byli pâívrženci Spáèe. Odpadlická sekta pomatencù z tábora v bažinách.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //Je to tvùj bývalý lid, Lestere. Bývalé bratrstvo Spáèe. Teë z nich jsou pouzí bezduší pâisluhovaèi zla.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Tušil jsem to, ale doufal jsem, že to není pravda. Chceš âíct, že se vrátil? Spáè je zpátky mezi námi?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Dobrá otázka. Jsem si jistý jenom tím, že musím Pátraèe zastavit dâív, než budou pâíliš mocní.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Nelíbí se mi to, ale asi máš pravdu. Je mi líto, ale tohle všechno mi zaèíná lézt na mozek.
					B_LogEntry (TOPIC_DEMENTOREN,"Má podezâení se potvrdila. Dokonce ani Lester už nepochybuje, že pátraèi patâí ke Spáèovým pâisluhovaèùm ze starého tábora v bažinách."); 
					B_GivePlayerXP (XP_Lester_KnowsMadPsi);
					DIA_Lester_PERM3_OneTime = TRUE;
				};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_12"); //Bolest hlavy jen tak neustoupí, ale doufejme, že si jinak s tím problémem dokážeme brzy poradit.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //Aã tak nebo tak.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Ta bolest hlavy zaèíná být nesnesitelná. A teë na mê ještê poâád útoèí ti ještêâi. Musím se sám sebe ptát, odkud se berou.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Ta bolest hlavy nechce pâejít. Nêco se chystá.
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(povzdechne si) Myslím, že si budu muset odpoèinout.
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

INSTANCE DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc		= PC_Psionic;
	nr		= 999;
	condition	= DIA_Lester_KAP4_EXIT_Condition;
	information	= DIA_Lester_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP4_EXIT_Info()
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

INSTANCE DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP5_EXIT_Condition;
	information	= DIA_Lester_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_XARDASWEG_Condition;
	information	 = 	DIA_Lester_XARDASWEG_Info;

	description	 = 	"Kde je Xardas?";
};

func int DIA_Lester_XARDASWEG_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_00"); //Kde je Xardas?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Je pryè a ve své vêži nechal ta démonická stvoâení.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Myslím, že nechce, aby po jeho vêži v jeho nepâítomnosti nêkdo slídil.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Kam šel?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //To neâíkal. Jenom mê požádal, abych ti pâedal tenhle dopis.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //Pâeèetl jsem si ho. Omlouvám se. Byl jsem zvêdavý.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //A?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //Nemám ponêtí, nerozumêl jsem ani slovu, chlape. Ale jedno mi je jasné: jen tak ho neuvidíme.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Asi mu zaèala hoâet zemê za patama, a tak se vydal do kopcù.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas zmizel. Lester mi pouze pâedal dopis, který mi mág zanechal."); 
};


///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	2;
	condition	 = 	DIA_Lester_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lester_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Zjistil jsem, kde se ukrývá nepâítel.";
};
func int DIA_Lester_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Lester_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Zjistil jsem, kde se ukrývá nepâítel.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Neptej se mê proè, ale mám pocit, že bych mêl jít s tebou.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Co tím myslíš?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Nedokážu to vysvêtlit, ale je mi jasné, že odpovêë se dozvím, jen když pùjdu s tebou.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Je mi líto, ale loë už je plná.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Možná je, možná je mùj osud bezvýznamný v porovnání s vêcmi, které jsou pâed námi.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Sám musíš vêdêt, co bys mêl udêlat. Postav se zlu - se mnou si hlavu nelámej.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Nejsem nijak dùležitý.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Nemohu tê vzít s sebou.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Tak pojë se mnou a najdi své odpovêdi!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Tak pojë se mnou a najdi své odpovêdi!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Setkáme se v pâístavu. Pâijdu tam, jakmile budu pâipraven.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Pospêš si, zaèíná nás tlaèit èas.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};

FUNC VOID DIA_Lester_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Nemohu tê vzít s sebou.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Rozumím. Stejnê bych ti asi nebyl žádnou výraznou oporou.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Aã už si vezmeš s sebou kohokoliv, ujisti se, že mu mùžeš vêâit.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_03"); //A dávej na sebe pozor.

	Lester_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
};


///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_LeaveMyShip_Condition;
	information	 = 	DIA_Lester_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Nakonec pro tebe pâece jenom nemám místo.";
};
func int DIA_Lester_LeaveMyShip_Condition ()
{	
	if (Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lester_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Nakonec pro tebe pâece jenom nemám místo.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Rozumím ti. Být ve tvé situaci, asi bych udêlal to samé.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Kdybys mê potâeboval, pomohu ti. Víš, kde mê hledat.
	
	Lester_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Psionic;
	nr			 = 	4;
	condition	 = 	DIA_Lester_StillNeedYou_Condition;
	information	 = 	DIA_Lester_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Potâebuji pâítele, který by mi pomohl.";
};
func int DIA_Lester_StillNeedYou_Condition ()
{	
	if ((Lester_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lester_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Potâebuji pâítele, který by mi pomohl.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Vêdêl jsem to! Projdeme tím bok po boku, stejnê jako pâedtím.
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Zlo by se mêlo mít na pozoru. Zaèínáme mu šlapat na paty.
		
		self.flags 		 = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Nakonec bude pâece jenom asi lepší, když tady zùstanu. Hodnê štêstí.
	
		AI_StopProcessInfos (self);
	};	
};

//#####################################################################
//##
//##
//##							KAPITEL 6 //auf der Dracheninsel ->Neue Instanz!!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc			= PC_Psionic;
	nr			= 999;
	condition	= DIA_Lester_KAP6_EXIT_Condition;
	information	= DIA_Lester_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lester_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_PC_Psionic_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 900;
	condition	= DIA_PC_Psionic_PICKPOCKET_Condition;
	information	= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen (76, 20);
};
 
FUNC VOID DIA_PC_Psionic_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK 		,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};
	
func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_PC_Psionic_PICKPOCKET);
};




































