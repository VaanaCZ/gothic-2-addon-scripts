// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bill_EXIT(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 999;
	condition	= DIA_Addon_Bill_EXIT_Condition;
	information	= DIA_Addon_Bill_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Bill_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bill_PICKPOCKET (C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 900;
	condition	= DIA_Addon_Bill_PICKPOCKET_Condition;
	information	= DIA_Addon_Bill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bill_PICKPOCKET_Condition()
{
	C_Beklauen (80, 205);
};
 
FUNC VOID DIA_Addon_Bill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
	
func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bill_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello
// ************************************************************
INSTANCE DIA_Addon_Bill_Hello(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 1;
	condition	= DIA_Addon_Bill_Hello_Condition;
	information	= DIA_Addon_Bill_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Bill_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Bill_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_Hello_15_00"); //Jak se ti vede?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co je? Poslal tę sem Henry?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Vyâië mu, že ty fošny dostane, hned jak tady skončím.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //A jestli nemůže tak dlouho čekat, tak aă si vezme pilu a naâeže si je sám.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  				 Planks
// ************************************************************
INSTANCE DIA_Addon_Bill_Planks(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 2;
	condition	= DIA_Addon_Bill_Planks_Condition;
	information	= DIA_Addon_Bill_Planks_Info;

	description = "Na co jsou vám všechny tyhle fošny?";
};                       
FUNC INT DIA_Addon_Bill_Planks_Condition()
{
	if (GregIsBAck == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Bill_Planks_Info()
{	
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Na co ta prkna potâebujete?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //No pâeci na palisádu, ty troubo.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg si myslí, že je dobrý takhle opevnit tábor.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale podle mę jsme si tu práci mohli ušetâit.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Pokud nás banditi vážnę chtęjí napadnout, pak je tahle smęšná palisádička stejnę nezastaví.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Nikdy jsme je tady v našem údolí nemęli trpęt.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Kdybych to byl vędęl, zůstal bych v Khorinidu.
};
	
// ************************************************************
// 							PERM
// ************************************************************
var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 4;
	condition	= DIA_Addon_Bill_Perm_Condition;
	information	= DIA_Addon_Bill_Perm_Info;
	permanent	= TRUE;
	description	= "Můžu ti pomoct s âezáním?";
};
func int DIA_Addon_Bill_Perm_Condition ()
{
	if (GregIsBack == FALSE)
	&& (Npc_WasInState (self, ZS_Saw))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Můžu ti pomoct s tím âezáním?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Ne, zvládnu to sám.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Pâidal jsem se sem pâed nedávnem, a kdybych teë za sebe nechal nękoho makat, nepomohlo by mi to, jestli mę chápeš.
		Bill_Perm_Once = TRUE;
	};
};

// ************************************************************
//							PERM 2
// ************************************************************
instance DIA_Addon_Bill_Perm2		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 5;
	condition	= DIA_Addon_Bill_Perm2_Condition;
	information	= DIA_Addon_Bill_Perm2_Info;
	permanent	= TRUE;
	description	= "Co teë dęláš?";
};
func int DIA_Addon_Bill_Perm2_Condition ()
{
	if (GregIsBack == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Perm2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co teë budeš dęlat?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Dám si pauzu.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(škodolibę) Mou práci dostal Francis.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Bude âezat tak dlouho, dokud mu neupadnou ruce.
	};
};



// ************************************************************
// ***														***
// 					Die Angus und Hank Show
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 					Ich suche Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_AngusnHank(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 11;
	condition	= DIA_Addon_Bill_AngusnHank_Condition;
	information	= DIA_Addon_Bill_AngusnHank_Info;
	permanent	= FALSE;
	description = "Hledám Anguse a Hanka.";
};                       
FUNC INT DIA_Addon_Bill_AngusnHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHank))
	&&  Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bill_AngusnHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_00"); //Hledám Anguse a Hanka.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(povzdychne si) Nemám ponętí, kde jsou – nejspíš je dostali banditi.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Vy jste byli pâátelé, že jo?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Vím akorát to, že se s banditama scházeli v jeskyni nedaleko odsud.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Musí to bejt kus od tábora, smęrem na východ. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Ale pâesnę to nevím, nikdy jsem tam nebyl.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Možná by ses na to mohl zeptat Krokodýla Jacka, ten kolem tábora obchází furt.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank męli východnę od tábora svou jeskyni. Víc by mi o ní mohl âíci Krokodýl Jack.");
};

// ------------------------------------------------------------
// 							Sie sind tot.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_FoundFriends(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 12;
	condition	= DIA_Addon_Bill_FoundFriends_Condition;
	information	= DIA_Addon_Bill_FoundFriends_Info;
	permanent	= FALSE;
	description = "Našel jsem tvé pâátele.";
};                       
FUNC INT DIA_Addon_Bill_FoundFriends_Condition()
{
	if (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_FoundFriends_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Našel jsem tvé pâátele.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //A co? Kde jsou?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Jsou mrtví.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(nenávistnę) To udęlali ti zatracení banditi!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Je to možné.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Ty prokletý svinę! Aă se smažej v pekle!
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(pro sebe, nenávistnę) Kdybych jen vędęl, která kurva to udęlala!
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Billa zdrtilo, když se dozvędęl o smrti Anguse a Hanka. Chce znát jména jejich vrahů.");
};	

// ------------------------------------------------------------
// 						Ich kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Bill_JuanMurder		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 13;
	condition	= DIA_Addon_Bill_JuanMurder_Condition;
	information	= DIA_Addon_Bill_JuanMurder_Info;

	description	= "Vím, kdo zabil Anguse a Hanka.";
};
func int DIA_Addon_Bill_JuanMurder_Condition ()
{
	if (MIS_Addon_Bill_SearchAngusMurder == LOG_RUNNING)
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_JuanMurder_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_00"); //Vím, kdo zabil Anguse a Hanka.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(vzrušenę) Kdo? Kdo to byl?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Jmenuje se Juan, patâí k banditům.
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_03"); //Musíš toho hajzla dostat, slyšíš?
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_04"); //Tohle mu nesmí projít.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Mám zabít Juana, abych pomstil Anguse a Hanka.");
};

// ------------------------------------------------------------
// 						Juan ist erledigt.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Bill_KilledEsteban(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr			= 14;
	condition	= DIA_Addon_Bill_KilledEsteban_Condition;
	information	= DIA_Addon_Bill_KilledEsteban_Info;

	description = "Juan už to má za sebou.";
};                       
FUNC INT DIA_Addon_Bill_KilledEsteban_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_JuanMurder))
	&& (Npc_IsDead (Juan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bill_KilledEsteban_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan už to má za sebou.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(nadšenę) Fakt? A bolelo to?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Nežvaŕ!
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(povzdychne si) No, aspoŕ žes tu svini zabil.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan je vyâízený, což Billa velice potęšilo.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Bill_KillAngusMurder);
	
};



// ************************************************************
// ***														***
//							Pick Pocket
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 							Khorinis?
// ------------------------------------------------------------
instance DIA_Addon_Bill_Khorinis		(C_INFO)
{
	npc			= PIR_1356_Addon_Bill;
	nr		 	= 21;
	condition	= DIA_Addon_Bill_Khorinis_Condition;
	information	= DIA_Addon_Bill_Khorinis_Info;

	description	= "Byls nękdy v Khorinidu?";
};
func int DIA_Addon_Bill_Khorinis_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_Khorinis_15_00"); //Byls v Khorinidu?
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Jo, trochu jsem kapsaâil a sem tam ŕákej švindl, abych se udržel nad vodou.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale jak začalo pâijíždęt čím dál tím míŕ lodí, kšefty šly taky čím dál hůâ.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //A v jedný chvíli už mę pâestalo bavit pro pár krajíců furt zdrhat pâed domobranou.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //A tak jsem se pâidal ke Gregovi a teë trčím tady.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(povzdychne si) Celý dny âežu dâevo na palisádu, která je stejnę k ničemu.
	};
};

// ------------------------------------------------------------
// 							Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Bill_TeachPlayer		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 22;
	condition	= DIA_Addon_Bill_TeachPlayer_Condition;
	information	= DIA_Addon_Bill_TeachPlayer_Info;
	
	description	= "Můžeš mę nęčemu naučit?";
};
func int DIA_Addon_Bill_TeachPlayer_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_TeachPlayer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Můžeš mę nęčemu naučit?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //No, mohl bych ti ukázat, jak nepozorovanę vybírat cizí kapsy.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale musíš bejt aspoŕ trochu obratnej, jinak máš smůlu.

	Bill_Addon_TeachPickPocket = TRUE;
};

// ------------------------------------------------------------
// 						Teach Pickpocket
// ------------------------------------------------------------
instance DIA_Addon_Bill_LearnTalent		(C_INFO)
{
	npc		 	= PIR_1356_Addon_Bill;
	nr		 	= 23;
	condition	= DIA_Addon_Bill_LearnTalent_Condition;
	information	= DIA_Addon_Bill_LearnTalent_Info;
	permanent 	= TRUE;
	description	= "Ukaž mi, jak vybírat cizí kapsy. (10 VB)";
};
func int DIA_Addon_Bill_LearnTalent_Condition ()
{
	if (Bill_Addon_TeachPickPocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Bill_LearnTalent_Info ()
{
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Ukaž mi, jak vybírat kapsy.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Napâed se musíš postarat, aby se tvá obęă cejtila úplnę v bezpečí.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Nejlepší je k nękomu pâijít a začít klábosit, to funguje jak kouzlo.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //A pak je čas na zlodęjskej hmat, ale pozor, aă si nikdo ničeho nevšimne.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Ještę nęco?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Jo, cvič se v obratnosti. Čím budeš obratnęjší, tím líp ti to půjde.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //A tím dâív ulehčíš svejm obętem o různý vęci, aniž by si tę všimly.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //To je všecko, aspoŕ teoreticky.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapomeŕ na to! Nejsi dost obratnej!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Buë se napâed pocvič v obratnosti, nebo si najdi lepšího učitele.
	};
};

