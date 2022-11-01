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
	AI_Output	(self ,other,"DIA_Lester_Hello_13_00");	//Jsi to TY? - Opravdu! Chlape, ani netušíš, jak rád tě vidím!

	Info_ClearChoices	(DIA_Lester_Hello);

	Info_AddChoice		(DIA_Lester_Hello, "Měl bych tě znát?" 					,DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice		(DIA_Lester_Hello, "Lestere! Jak ses sem dostal?"		,DIA_Lester_Hello_Lester);
};
FUNC VOID DIA_Lester_Hello_Lester()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_Lester_15_00");	//Lestere! Jak ses sem dostal?
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_01");	//Byl to šílený útěk. Když bariéra vybuchla, chvíli jsem se naprosto zmateně toulal po okolí.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_02");	//Pak jsem se celé dny snažil probojovat skrz tyhle lesy, až jsem konečně našel tohle údolí.
	AI_Output	(self ,other,"DIA_Lester_Hello_Lester_13_03");	//Diego, Milten a Gorn jsou pořád v Hornickém údolí. Aspoň si to myslím.
};
FUNC VOID DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_YouKnowMe_15_00");	//Měl bych tě znát?
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Haló? Je někdo doma? Riskoval jsem vlastní kůži, abys mohl dostat ten divný kámen.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//Něco mi dlužíš. TENTOKRÁT by sis to měl pamatovat.
	AI_Output	(self ,other,"DIA_Lester_Hello_YouKnowMe_13_03"); 	//Pamatuješ ještě na Diega, Miltena a Gorna?

	Info_AddChoice		(DIA_Lester_Hello, "Diego, Milten a KDO?" 	,DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice		(DIA_Lester_Hello, "Jasně. Co je s nimi?"	,DIA_Lester_Hello_KnowFourFriends);

};
FUNC VOID DIA_Lester_Hello_KnowFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Jasně. Co je s nimi?
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Pokud vím, tak zničení bariéry měli přežít.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Nemám ponětí, kde jdou teď - všichni tři ještě nejspíš dřepí někde v Hornickém údolí.
	AI_Output	(self ,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Kdybys na ně náhodou narazil, dej mi vědět.
};
FUNC VOID DIA_Lester_Hello_WhoFourFriends()
{
    Info_ClearChoices	(DIA_Lester_Hello);
	AI_Output	(other,self ,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Diego, Milten a KDO?
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Nesnaž se mi namluvit, že si na to nepamatuješ. Ty ohniskové kameny - ten trol - ta ohromná kupa rudy vodních mágů?
	AI_Output	(other, self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Nejsem si jistý...
	AI_Output	(self ,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//To přijde. I mně chvíli trvalo, než jsem si to všechno v hlavě srovnal.
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
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_01");	//Co byl Spáč poražen, celé bratrstvo ztratilo hlavu.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_02");	//Bez vůdce byli jako prázdné skořápky.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_03");	//A ty? Co bylo s tebou?
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_04");	//Já na tom byl úplně stejně. Měl jsem noční můry a dokonce halucinace. Ale jakmile jsem začal více méně přemýšlet zase normálně, utekl jsem.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_05");	//Jednou se mi zdálo, že vidím obrovský černý stín, jak vyrazil na skupinu uprchlíků a spálil je na prach.
	AI_Output	(self, other,"DIA_Lester_WhatHappened_13_06");	//V tu chvíli jsem si vážně myslel, že mě přišel zabít drak.
	AI_Output	(other, self,"DIA_Lester_WhatHappened_15_07");	//Viděl jsi ještě něco?
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
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_01");	//Přesně to nevím. Možná týden. Ale napadá mě ještě jedna věc:
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_02");	//Když jsem sem jednoho večera přišel, podíval jsem se na vrcholek hory - bylo tam jenom pár stromů.
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_03");	//A když jsem se tam podíval druhý den ráno, stála tam věž. Přísahal bych, že tam předtím nebyla. Od té doby jsem z údolí nevytáhl paty.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_04");	//Myslíš Xardasovu věž? Věděl jsem, že je mocný, ale vytvořit věž jenom tak...
	AI_Output	(self, other,"DIA_Lester_ReturnToColony_13_05");	//Nekromant Xardas? To on žije v té věži? Nevím, jestli se mi to dvakrát zamlouvá.
	AI_Output	(other, self,"DIA_Lester_ReturnToColony_15_06");	//Uklidni se, byl to právě on, kdo mě zachránil ze Spáčova chrámu. Je na naší straně.
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
	description	 = 	"O tom stínu musíš povědět Xardasovi...";
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
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_00"); //Musíš říct Xardasovi o tom stínu, mohlo by to být důležité.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_01"); //Ty si nemyslíš, že to byl jen výplod mojí představivosti? To jako že to doopravdy byl...
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_02"); //...drak. Ano.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_03"); //Zase se do toho pouštíš po hlavě, že?
	AI_Output (other, self, "DIA_Lester_SEND_XARDAS_15_04"); //Neřekl bych, že po hlavě... ještě ne.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_05"); //(povzdychne si) No dobrá, když je to tak důležité, tak za ním půjdu - ale ne hned teď.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_06"); //Teď si chci odpočinout. Ještě pořád jsem úplně vyčerpaný z toho útěku z trestanecké kolonie.
	AI_Output (self, other, "DIA_Lester_SEND_XARDAS_13_07"); //Řekl bych, že máš velké plány. Uvidíme se později u Xardase.
	
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

	description	 = 	"Mám namířeno do KHORINIDU! Co bys mi o tom městě řekl?";
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
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_00"); //Mám namířeno do Khorinidu, víš o tom městě něco zajímavého?
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_01"); //Khorinis? No, to je jen obyčejný přístav, nic zvláštního.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_02"); //Proč se ptáš?
	AI_Output	(other, self, "DIA_Addon_Lester_STADT_15_03"); //Musím zajít za paladiny, kteří se prý ve městě usadili.
	AI_Output	(self, other, "DIA_Addon_Lester_STADT_13_04"); //(směje se) Vážně? Haha! Vždyť tě nepustí ani do města, natož do paladinského sídla!
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

	description	 = 	"Napadá tě, jak bych se do města nejlépe dostal?";
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
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //A nenapadá tě, jak bych se mohl do města dostat?
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //Určitě jo. Před časem jsem tam pracoval pro starého alchymistu Constantina.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //Má ve městě docela vliv a stráže mají nakázáno, že mají bránou vpustit každého, kdo mu bude moci prodat nějaké vzácné byliny.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //Takže je to jednoduchý. Nasbíráš hromadu bylin, které tu všude rostou, budeš předstírat, že pracuješ pro Constantina, a tak se dostaneš dovnitř.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //Ale ne abys sbíral všechno možné. Stráže nejsou moc bystré a o alchymii nemají ani páru.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //Pustí tě dovnitř, když uvidí pořádnou hromádku nějaké rostliny.
	AI_Output	(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //Myslím, že stačí nasbírat 10 kousků od jednoho druhu.
	AI_Output	(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //Díky za tip.
	
	Log_CreateTopic (TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_PickForConstantino,"Lester tvrdí, že přes městské stráže se dostanu, ponesu-li aspoň 10 kousků nějaké byliny a řeknu jim, že jsou určeny pro starého alchymistu Constantina."); 
	
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

	description	 = 	"Ta věc s bylinami pro Constantina fungovala přímo zázračně.";
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
	AI_Output	(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //Ta věc s bylinami pro Constantina fungovala jako kouzlo. Dostal jsem se tak kolem stráží.
	AI_Output	(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //Jak jsem řekl. Občas bys mě mohl trochu poslouchat, příteli.
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
	description = "Co víš o tomhle místě?";
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
	AI_Output	(other, self,"DIA_Lester_Perm_15_00");	//Co víš o tomhle místě?
	AI_Output	(self, other,"DIA_Lester_Perm_13_01");	//Když půjdeš tudy dolů, dojdeš na farmu. O kousek dál už začíná město.
	AI_Output	(self, other,"DIA_Lester_Perm_13_02");	//Ale buď opatrný. Nepotulují se tam jen vlci a krysy, ale také goblini a banditi!
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
	description = "Ještě pořád jsi unavený?";
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
	AI_Output	(other, self,"DIA_Lester_Sleep_15_00");	//Ještě pořád jsi unavený?
	AI_Output	(self, other,"DIA_Lester_Sleep_13_01");	//A jak. (zívne si) Řekl jsem Xardasovi všechno. Teď se na chvilku prospím. Tak den...
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
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_00"); //Hej, konečně ses vrátil! Musíš jít okamžitě za Xardasem, máme problém.
	AI_Output			(other, self, "DIA_Lester_BACKINTOWN_15_01"); //Tak tomu naprosto věřím.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_02"); //Co jsi odešel, propuklo naprosté peklo.
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_03"); //Promluv si s Xardasem, čeká na tebe!
	AI_Output			(self, other, "DIA_Lester_BACKINTOWN_13_04"); //Xardas mi pro tebe dal tuhle runu. S její pomocí se k němu dostaneš rychleji. Setkáme se tam.
	
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

	description	 = 	"Nevypadáš zrovna nadšeně.";
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
	AI_Output			(other, self, "DIA_Lester_PERM3_15_00"); //Nevypadáš zrovna nadšeně.
	
	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_01"); //Taky moc nadšený nejsem, chlape. Jsem úplně vyřízený a pořád mě bolí hlava.
			AI_Output			(self, other, "DIA_Lester_PERM3_13_02"); //Pokaždé, když se objeví ty černé kápě, tak se to zhorší.
			
			if (SC_KnowsMadPsi == TRUE)
				{
					AI_Output			(other, self, "DIA_Lester_PERM3_15_03"); //A já ti můžu přesně říct, proč to tak je.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_04"); //Jo? Myslím, že to ani nechci vědět.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_05"); //Ty černé kápě - neboli Pátrači, jak jim říkáme my mágové - bývali přívrženci mocného arcidémona. Neříká ti to nic?
					AI_Output			(self, other, "DIA_Lester_PERM3_13_06"); //Hmm. Ne. Leda že by ses mi snažil naznačit, že...
					AI_Output			(other, self, "DIA_Lester_PERM3_15_07"); //Ano, přesně. Ti Pátrači byli přívrženci Spáče. Odpadlická sekta pomatenců z tábora v bažinách.
					AI_Output			(other, self, "DIA_Lester_PERM3_15_08"); //Je to tvůj bývalý lid, Lestere. Bývalé bratrstvo Spáče. Teď z nich jsou pouzí bezduší přisluhovači zla.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_09"); //Tušil jsem to, ale doufal jsem, že to není pravda. Chceš říct, že se vrátil? Spáč je zpátky mezi námi?
					AI_Output			(other, self, "DIA_Lester_PERM3_15_10"); //Dobrá otázka. Jsem si jistý jenom tím, že musím Pátrače zastavit dřív, než budou příliš mocní.
					AI_Output			(self, other, "DIA_Lester_PERM3_13_11"); //Nelíbí se mi to, ale asi máš pravdu. Je mi líto, ale tohle všechno mi začíná lézt na mozek.
					B_LogEntry (TOPIC_DEMENTOREN,"Má podezření se potvrdila. Dokonce ani Lester už nepochybuje, že pátrači patří ke Spáčovým přisluhovačům ze starého tábora v bažinách."); 
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
			AI_Output			(self, other, "DIA_Lester_PERM3_13_13"); //Ať tak nebo tak.
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_14"); //Ta bolest hlavy začíná být nesnesitelná. A teď na mě ještě pořád útočí ti ještěři. Musím se sám sebe ptát, odkud se berou.
		}
		else
		{
			AI_Output			(self, other, "DIA_Lester_PERM3_13_15"); //Ta bolest hlavy nechce přejít. Něco se chystá.
		};
	};
	AI_Output			(self, other, "DIA_Lester_PERM3_13_16"); //(povzdechne si) Myslím, že si budu muset odpočinout.
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
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_01"); //Je pryč a ve své věži nechal ta démonická stvoření.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_02"); //Myslím, že nechce, aby po jeho věži v jeho nepřítomnosti někdo slídil.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_03"); //Kam šel?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_04"); //To neříkal. Jenom mě požádal, abych ti předal tenhle dopis.
	
	CreateInvItems 		(self, ItWr_XardasLetterToOpenBook_MIS, 1);					
	B_GiveInvItems 		(self, other, ItWr_XardasLetterToOpenBook_MIS,1);
	
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_05"); //Přečetl jsem si ho. Omlouvám se. Byl jsem zvědavý.
	AI_Output			(other, self, "DIA_Lester_XARDASWEG_15_06"); //A?
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_07"); //Nemám ponětí, nerozuměl jsem ani slovu, chlape. Ale jedno mi je jasné: jen tak ho neuvidíme.
	AI_Output			(self, other, "DIA_Lester_XARDASWEG_13_08"); //Asi mu začala hořet země za patama, a tak se vydal do kopců.
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Xardas zmizel. Lester mi pouze předal dopis, který mi mág zanechal."); 
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
	description	 = 	"Zjistil jsem, kde se ukrývá nepřítel.";
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
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //Zjistil jsem, kde se ukrývá nepřítel.
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //Neptej se mě proč, ale mám pocit, že bych měl jít s tebou.
	AI_Output			(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //Co tím myslíš?
	AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //Nedokážu to vysvětlit, ale je mi jasné, že odpověď se dozvím, jen když půjdu s tebou.
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lester_KnowWhereEnemy_15_04"); //Je mi líto, ale loď už je plná.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //Možná je, možná je můj osud bezvýznamný v porovnání s věcmi, které jsou před námi.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //Sám musíš vědět, co bys měl udělat. Postav se zlu - se mnou si hlavu nelámej.
		AI_Output			(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //Nejsem nijak důležitý.
	}
	else 
	{
		Info_ClearChoices (DIA_Lester_KnowWhereEnemy);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Nemohu tě vzít s sebou.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lester_KnowWhereEnemy,"Tak pojď se mnou a najdi své odpovědi!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lester_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_00"); //Tak pojď se mnou a najdi své odpovědi!
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_Yes_15_01"); //Setkáme se v přístavu. Přijdu tam, jakmile budu připraven.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02"); //Pospěš si, začíná nás tlačit čas.
	
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
	AI_Output (other,self ,"DIA_Lester_KnowWhereEnemy_No_15_00"); //Nemohu tě vzít s sebou.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_01"); //Rozumím. Stejně bych ti asi nebyl žádnou výraznou oporou.
	AI_Output (self ,other,"DIA_Lester_KnowWhereEnemy_No_13_02"); //Ať už si vezmeš s sebou kohokoliv, ujisti se, že mu můžeš věřit.
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
	description	 = 	"Nakonec pro tebe přece jenom nemám místo.";
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
	AI_Output			(other, self, "DIA_Lester_LeaveMyShip_15_00"); //Nakonec pro tebe přece jenom nemám místo.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_01"); //Rozumím ti. Být ve tvé situaci, asi bych udělal to samé.
	AI_Output			(self, other, "DIA_Lester_LeaveMyShip_13_02"); //Kdybys mě potřeboval, pomohu ti. Víš, kde mě hledat.
	
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
	description	 = 	"Potřebuji přítele, který by mi pomohl.";
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
	AI_Output			(other, self, "DIA_Lester_StillNeedYou_15_00"); //Potřebuji přítele, který by mi pomohl.
	
	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_01"); //Věděl jsem to! Projdeme tím bok po boku, stejně jako předtím.
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_02"); //Zlo by se mělo mít na pozoru. Začínáme mu šlapat na paty.
		
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
		AI_Output	(self, other, "DIA_Lester_StillNeedYou_13_03"); //Nakonec bude přece jenom asi lepší, když tady zůstanu. Hodně štěstí.
	
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




































