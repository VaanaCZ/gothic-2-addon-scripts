///////////////////////////////////////////////////////////////////////
//	Info FIRST EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1013_BANDIT_FIRSTEXIT   (C_INFO)
{
	npc         = BDT_1013_Bandit_L;
	nr          = 999;
	condition   = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if (Bdt13_Friend == TRUE)
	&& (!Npc_IsDead (Ambusher_1014)) 
	&& (!Npc_IsDead (Ambusher_1015))
	{
		AI_Output	(self, other, "DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00"); //Bejt tebou, nahoru do jeskynę nechodím - mí kámoši tam z tebe stáhnou kůži. A vęâ tomu, že bojovat umí.
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1013_BANDIT_EXIT   (C_INFO)
{
	npc         = BDT_1013_Bandit_L;
	nr          = 999;
	condition   = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1013_BANDIT_EXIT_Condition()
{	
	if Npc_KnowsInfo (other,DIA_BDT_1013_BANDIT_FIRSTEXIT)
	{
		return TRUE;
	};
};
FUNC VOID DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1013_BANDIT_WHERE		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_BDT_1013_BANDIT_WHERE_Condition;
	information	 = 	DIA_BDT_1013_BANDIT_WHERE_Info;
	PERMANENT	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_BDT_1013_BANDIT_WHERE_Condition ()
{	
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info ()
{
	AI_Output			(self, other, "DIA_BDT_1013_BANDIT_WHERE_01_00"); //Hej, odkud to jdeš, hm?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Z hor.",DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN);	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Byl jsem u Xardase.",DIA_BDT_1013_BANDIT_WHERE_XARDAS);
};
//-------------------------------------------------------------------------------------------
FUNC VOID DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00"); //Z hor.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01"); //Pâesnę. Pâišel jsi z hor. A to je pro tebe zlé.
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02"); //Velmi zlé.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03"); //Hledají tę - celá banda zlejch chlapů.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04"); //Je tady nękdo, s kým by sis męl za každou cenu promluvit. Pojë za mnou!
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Možná pozdęji...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Kdo se po mnę shání?",DIA_BDT_1013_BANDIT_WHERE_WHO);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Fajn! Jdi první!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_XARDAS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00"); //Byl jsem u Xardase...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01"); //To je ten starý čarodęj? Âíkají mu Xardas... To bude Braga zajímat.
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
}; 

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_YES()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_YES_15_00"); //Fajn! Jdi první!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_YES_01_01"); //Tak pojë za mnou, jeskynę je hned tady nahoâe.
	
	Npc_ExchangeRoutine	(self,"AMBUSH"); 
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_WHO()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_WHO_15_00"); //Kdo se po mnę shání?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_01"); //Jde po tobę půlka Khorinidu a ty mi chceš tvrdit, že o tom nic nevíš?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_02"); //Á! Už vím! Ty o tom prostę se mnou nechceš mluvit, hm? Jak chceš - je to tvoje vęc.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_03"); //Tak jdeš, nebo ne?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Možná pozdęji.",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"S kým bych to męl mluvit?",DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Fajn! Jdi první!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00"); //S kým bych to męl mluvit?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01"); //S mým šéfem. Jmenuje se Brago. Vysvętlí ti to líp než já.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02"); //Tak jak - jdeme?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Možná pozdęji.",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Jak mám vędęt, že to není past?",DIA_BDT_1013_BANDIT_WHERE_NOTRAP);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Fajn! Jdi první!",DIA_BDT_1013_BANDIT_WHERE_YES);
};
	
func void DIA_BDT_1013_BANDIT_WHERE_NOTRAP()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00"); //Jak mám vędęt, že to není past?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01"); //Hele, už mę začínáš unavovat. Když o mou pomoc nestojíš, ta si jdi do męsta a nech se strčit do basy!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02"); //Buë se mnou půjdeš hned, nebo na to můžeme rovnou zapomenout, jasný?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Možná pozdęji.",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Pomalu, kámo! Podruhý se napálit nenechám.",DIA_BDT_1013_BANDIT_WHERE_DAMALS);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Fajn! Jdi první!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_DAMALS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00"); //Pomalu, kámo! Podruhý se napálit nenechám.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01"); //Hm?
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02"); //Jeden chlapík navrhnul, abysme společnę získali nęjakej amulet a pak se rozdęlili o to, co z toho kápne.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03"); //Jakmile se nám to podaâilo, společnę s pâáteli mę napadl.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04"); //Tak to tak vypadá, že ses zapletl se špatnými lidmi - kde se to stalo?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Na tom až tak nezáleží.",DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Byl jsem vęznęm v trestanecké kolonii.",DIA_BDT_1013_BANDIT_WHERE_PRISONER);
};

func void DIA_BDT_1013_BANDIT_WHERE_PRISONER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00"); //Byl jsem vęznęm v tęžaâské kolonii.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01"); //(ohromenę) Ty jsi pâišel zpoza bariéry? Chlape, tak to jsme tam byli společnę.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02"); //Nevím...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03"); //Byl jsem kopáčem ve Starém táboâe. Nemęl jsem s tím vším moc co do činęní.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04"); //(spiklenecky) Ale co je teë důležitęjší - jsi v pęknym maléru!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05"); //Nękdo nabídl za tvou hlavu slušnou odmęnu. A vyvęsil nękolik oznámení - s tvým ksichtem!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06"); //Bejt tebou, tak jsem velmi, velmi opatrnej. Je mezi náma pár lidí, co by pro prachy zabili i vlastní mámu.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07"); //Ale mám dojem, že my chlapi z kolonie bysme męli držet spolu!
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08"); //Tak to abych ti podękoval.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09"); //To nestojí za âeč. Prostę koukej zůstat naživu.
	
	Bdt13_Friend = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY);
	self.npctype = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
		
	Info_ClearChoices (DIA_BDT_1013_BANDIT_WHERE);
};

func void DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00"); //Na tom až tak nezáleží.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01"); //Jak je libo. Tak jdeme, nebo ne?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Fajn! Jdi první!",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Fajn! Jdi první!",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func VOID DIA_BDT_1013_BANDIT_WHERE_LATER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_LATER_15_00"); //Možná pozdęji.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_LATER_01_01"); //Žádné pozdęji neexistuje, kámo!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};


///////////////////////////////////////////////////////////////////////
//	Info AMBUSH
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_AMBUSH		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_AMBUSH_Condition;
	information	 = 	DIA_1013_BANDIT_AMBUSH_Info;
	PERMANENT	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_1013_BANDIT_AMBUSH_Condition ()
{	
	if (Npc_GetDistToWP (self, "NW_XARDAS_BANDITS_RIGHT") <= 300)
	&& (Bdt13_Friend == FALSE)
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_AMBUSH_Info ()
{
	if (Npc_IsDead(Ambusher_1014))
	&& (Npc_IsDead(Ambusher_1015))
	{
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_00"); //To od tebe byla pękná blbost, žes šel za mnou.
		B_Attack 			(self, other, AR_SuddenEnemyInferno, 1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_01"); //Hej lidi, koukejte, koho jsem vám pâivedl.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_NAME (C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_NAME_Condition;
	information	 = 	DIA_1013_BANDIT_NAME_Info;
	PERMANENT	 =  FALSE;	
	description	 = 	"Kdo je ten chlápek, co nabídl odmęnu?";
};
func int DIA_1013_BANDIT_NAME_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_NAME_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_00"); //Kdo je ten chlápek, co nabídl odmęnu?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_01"); //To nevím, u nás to ví jen jeden jediný.
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_02"); //A kdo to jako má být?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_03"); //Hele, chlape, tak tohle ti fakt âíct nemůžu. Víš, jak to chodí.
	
	Log_CreateTopic (Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus (Topic_Bandits,LOG_RUNNING);
	B_LogEntry (Topic_Bandits,"Jdou po mnę nęjací banditi, kteâí chtęjí získat odmęnu, vypsanou na mou hlavu. Zajímalo by mę, co za tím vším vęzí.");
	MIS_Steckbriefe = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER verpetzen
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_DEXTER		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	1;
	condition	 = 	DIA_1013_BANDIT_DEXTER_Condition;
	information	 = 	DIA_1013_BANDIT_DEXTER_Info;
	PERMANENT	 =  TRUE;	
	description	 = 	"10 zlatých za jméno toho, co vypsal tu odmęnu.";
};
func int DIA_1013_BANDIT_DEXTER_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& (Bdt13_Dexter_verraten == FALSE) 
	&& (Npc_KnowsInfo (other, DIA_1013_BANDIT_NAME))
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_DEXTER_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_00"); //10 zlatých za jméno toho, co vypsal tu odmęnu.
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_01"); //Ach jo, chlape, tohle fakt nemůžu udęlat.
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_02"); //Tak už to vyklop!
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_03"); //(s hlubokým povzdechem) Ale, chlape! No dobrá. Jmenuje se Dexter. Poblíž farmy velkostatkáâe narazíš na takovou strmou skálu.
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_04"); //Úplnę nahoâe je strážní vęž a nękolik dolů. Nękde poblíž má svůj úkryt.
	
	B_LogEntry (Topic_Bandits,"Bandity vede Dexter. Skrývá se v dolu poblíž velkostatkáâova sídla.");
	
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_05"); //Ani to nebolelo, co. Tady je zlato.
	}
	else
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_06"); //É - teë jsem si vzpomnęl, že vlastnę nemám 10 zlatých, co bych mohl postrádat.
		AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_07"); //Co?! Já... Hm - zapomeŕ na to - je to moje chyba. Nemęl jsem ti to jméno âíkat dâív, než jsi mi ukázal zlato.
	};
	
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_08"); //A hlavnę jim neâíkej, kdo ti vyklopil.
			
	Bdt13_Dexter_verraten = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PIC
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_PIC		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	2;
	condition	 = 	DIA_1013_BANDIT_PIC_Condition;
	information	 = 	DIA_1013_BANDIT_PIC_Info;
	PERMANENT	 =  FALSE;	
	description	 = 	"Můžu dostat ten obrázek?";
};
func int DIA_1013_BANDIT_PIC_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_PIC_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_PIC_15_00"); //Můžu dostat ten obrázek?
	AI_Output (self, other, "DIA_1013_BANDIT_PIC_01_01"); //Jasnę (smęje se) - konec konců, je tam TVŮJ ksicht.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
};

///////////////////////////////////////////////////////////////////////
//						MALETHs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromMaleth		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_1013_BANDIT_FromMaleth_Condition;
	information	 = 	DIA_1013_BANDIT_FromMaleth_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jeden z farmáâů z venkova mę poslal...";
};
func int DIA_1013_BANDIT_FromMaleth_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& ( (MIS_Maleth_Bandits == LOG_RUNNING) || (MIS_Maleth_Bandits == LOG_SUCCESS) )
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_FromMaleth_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_00"); //Jeden z farmáâů z venkova mę poslal.
	AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_01"); //Co? Farmáâi o tom úkrytu vędí?
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_02"); //Všimli si, že jim mizejí ovce.
	
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if (Npc_IsDead (b14))
	&& (Npc_IsDead (b15))
	{
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_03"); //Sakra! Tak to bych sebou męl hodit. Když našli ten úkryt prázdný, možná po mnę ještę pátrají.
	}
	else //mindestens einer lebt noch
	{
		AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_04"); //Chtęjí tę vidęt mrtvého.
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_05"); //Počkej - nehodláš mę oddęlat, že ne - po tom, co jsem ti pomohl?
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_06"); //Jen do toho, pozabíjej všechny ostatní, když tak bažíš po krvi - já s tím nechci nic mít!
	};
	
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP (XP_BanditWeg);
	
	Npc_ExchangeRoutine	(self,"AWAY");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//						CAVALORNs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromCavalorn (C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	3;
	condition	 = 	DIA_1013_BANDIT_FromCavalorn_Condition;
	information	 = 	DIA_1013_BANDIT_FromCavalorn_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tady za chvíli bude pękná mela!";
};
func int DIA_1013_BANDIT_FromCavalorn_Condition ()
{	
	if (Bdt13_Friend == TRUE) 
	&& (MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_FromCavalorn_Info ()
{
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_00"); //Nedávno tu bylo pęknę horko.
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_01"); //Co se dęje?
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_02"); //Šel tu po tobę nęjaký Cavalorn.
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_03"); //Sakra! On ještę žije? Tak to teda mizím.

	Bdt_1013_Away = TRUE;
	B_GivePlayerXP (XP_BanditWeg);
	
	Npc_ExchangeRoutine	(self,"AWAY2");
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//							PERM
///////////////////////////////////////////////////////////////////////

// ------------------------------
	var int bdt13_Gossip_Wildnis;
// ------------------------------

instance DIA_1013_BANDIT_PERM		(C_INFO)
{
	npc			 = 	BDT_1013_Bandit_L;
	nr			 = 	4;
	condition	 = 	DIA_1013_BANDIT_PERM_Condition;
	information	 = 	DIA_1013_BANDIT_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je tu ještę nęco dalšího, co by mę męlo zajímat?";
};
func int DIA_1013_BANDIT_PERM_Condition ()
{	
	if (Bdt13_Friend == TRUE)
	
	{
		return TRUE;
	};
};
func void DIA_1013_BANDIT_PERM_Info ()
{
	AI_Output (other, self, "DIA_1013_BANDIT_PERM_15_00"); //Je tu ještę nęco dalšího, co by mę męlo zajímat?

	if (bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_01"); //Myslíš tady v okolí? Jestli chceš zůstat naživu, nescházej z cesty.
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_02"); //Čím dál zajdeš do divočiny, tím vętší na tebe bude číhat nebezpečí.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_03"); //Už jsem ti âekl všechno, co jsem vędęl.
	};
};











