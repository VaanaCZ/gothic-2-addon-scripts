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
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_01"); //Co je? Poslal tì sem Henry?
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_02"); //Vyøiï mu, e ty fošny dostane, hned jak tady skonèím.
	AI_Output (self ,other,"DIA_Addon_Bill_Hello_03_03"); //A jestli nemùe tak dlouho èekat, tak a si vezme pilu a naøee si je sám.
	
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
	AI_Output (other, self, "DIA_Addon_Bill_Planks_15_00"); //Na co ta prkna potøebujete?
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_01"); //No pøeci na palisádu, ty troubo.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_02"); //Greg si myslí, e je dobrı takhle opevnit tábor.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_03"); //Ale podle mì jsme si tu práci mohli ušetøit.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_04"); //Pokud nás banditi vánì chtìjí napadnout, pak je tahle smìšná palisádièka stejnì nezastaví.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_05"); //Nikdy jsme je tady v našem údolí nemìli trpìt.
	AI_Output (self, other, "DIA_Addon_Bill_Planks_03_06"); //Kdybych to byl vìdìl, zùstal bych v Khorinidu.
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
	description	= "Mùu ti pomoct s øezáním?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm_15_00"); //Mùu ti pomoct s tím øezáním?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm_03_01"); //Ne, zvládnu to sám.
	if (Bill_Perm_Once == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Perm_03_02"); //Pøidal jsem se sem pøed nedávnem, a kdybych teï za sebe nechal nìkoho makat, nepomohlo by mi to, jestli mì chápeš.
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
	description	= "Co teï dìláš?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_Perm2_15_00"); //Co teï budeš dìlat?
	AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_01"); //Dám si pauzu.
	if (!Npc_IsDead(Francis))
	{
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_02"); //(škodolibì) Mou práci dostal Francis.
		AI_Output	(self, other, "DIA_Addon_Bill_Perm2_03_03"); //Bude øezat tak dlouho, dokud mu neupadnou ruce.
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
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_01"); //(povzdychne si) Nemám ponìtí, kde jsou – nejspíš je dostali banditi.
	AI_Output (other,self ,"DIA_Addon_Bill_AngusnHank_15_02"); //Vy jste byli pøátelé, e jo?
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_03"); //Vím akorát to, e se s banditama scházeli v jeskyni nedaleko odsud.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_04"); //Musí to bejt kus od tábora, smìrem na vıchod. 
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_05"); //Ale pøesnì to nevím, nikdy jsem tam nebyl.
	AI_Output (self ,other,"DIA_Addon_Bill_AngusnHank_03_06"); //Moná by ses na to mohl zeptat Krokodıla Jacka, ten kolem tábora obchází furt.

	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Angus a Hank mìli vıchodnì od tábora svou jeskyni. Víc by mi o ní mohl øíci Krokodıl Jack.");
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
	description = "Našel jsem tvé pøátele.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_00"); //Našel jsem tvé pøátele.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_01"); //A co? Kde jsou?
	AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_02"); //Jsou mrtví.
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_03"); //(nenávistnì) To udìlali ti zatracení banditi!
	if (SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Bill_FoundFriends_15_06"); //Je to moné.
	};
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_04"); //Ty prokletı svinì! A se smaej v pekle!
	AI_Output (self ,other,"DIA_Addon_Bill_FoundFriends_03_05"); //(pro sebe, nenávistnì) Kdybych jen vìdìl, která kurva to udìlala!
	
	MIS_Addon_Bill_SearchAngusMurder = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_KillJuan,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Billa zdrtilo, kdy se dozvìdìl o smrti Anguse a Hanka. Chce znát jména jejich vrahù.");
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
	AI_Output (self, other, "DIA_Addon_Bill_JuanMurder_03_01"); //(vzrušenì) Kdo? Kdo to byl?
	AI_Output (other, self, "DIA_Addon_Bill_JuanMurder_15_02"); //Jmenuje se Juan, patøí k banditùm.
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

	description = "Juan u to má za sebou.";
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
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_00"); //Juan u to má za sebou.
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_01"); //(nadšenì) Fakt? A bolelo to?
	AI_Output (other,self ,"DIA_Addon_Bill_KilledEsteban_15_02"); //Nevaò!
	AI_Output (self ,other,"DIA_Addon_Bill_KilledEsteban_03_03"); //(povzdychne si) No, aspoò es tu svini zabil.
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Juan je vyøízenı, co Billa velice potìšilo.");
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

	description	= "Byls nìkdy v Khorinidu?";
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
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_01"); //Jo, trochu jsem kapsaøil a sem tam òákej švindl, abych se udrel nad vodou.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_02"); //Ale jak zaèalo pøijídìt èím dál tím míò lodí, kšefty šly taky èím dál hùø.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_03"); //A v jednı chvíli u mì pøestalo bavit pro pár krajícù furt zdrhat pøed domobranou.
	AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_04"); //A tak jsem se pøidal ke Gregovi a teï trèím tady.

	if (GregIsBAck == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Bill_Khorinis_03_05"); //(povzdychne si) Celı dny øeu døevo na palisádu, která je stejnì k nièemu.
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
	
	description	= "Mùeš mì nìèemu nauèit?";
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
	AI_Output	(other, self, "DIA_Addon_Bill_TeachPlayer_15_00"); //Mùeš mì nìèemu nauèit?
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_01"); //No, mohl bych ti ukázat, jak nepozorovanì vybírat cizí kapsy.
	AI_Output	(self, other, "DIA_Addon_Bill_TeachPlayer_03_02"); //Ale musíš bejt aspoò trochu obratnej, jinak máš smùlu.

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
	description	= "Uka mi, jak vybírat cizí kapsy. (10 VB)";
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
	AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_00"); //Uka mi, jak vybírat kapsy.
	
	if (other.attribute[ATR_DEXTERITY] >= 40) //braucht man für Francis
	{
		if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET))
		{
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_01"); //Napøed se musíš postarat, aby se tvá obì cejtila úplnì v bezpeèí.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_02"); //Nejlepší je k nìkomu pøijít a zaèít klábosit, to funguje jak kouzlo.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_03"); //A pak je èas na zlodìjskej hmat, ale pozor, a si nikdo nièeho nevšimne.

			AI_Output (other, self, "DIA_Addon_Bill_LearnTalent_15_05"); //Ještì nìco?
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_06"); //Jo, cviè se v obratnosti. Èím budeš obratnìjší, tím líp ti to pùjde.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_07"); //A tím døív ulehèíš svejm obìtem o rùznı vìci, ani by si tì všimly.
			AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_08"); //To je všecko, aspoò teoreticky.
		};
	}
	else 
	{
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_09"); //Zapomeò na to! Nejsi dost obratnej!
		AI_Output (self ,other ,"DIA_Addon_Bill_LearnTalent_03_10"); //Buï se napøed pocviè v obratnosti, nebo si najdi lepšího uèitele.
	};
};

