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
		AI_Output	(self, other, "DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00"); //Na twoim miejscu trzyma³bym siê z dala od jaskini tam, na górze. Moi kumple mog¹ ci nieŸle osmaliæ ty³ek. A wierz mi, na bitce to oni siê znaj¹.
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
	AI_Output			(self, other, "DIA_BDT_1013_BANDIT_WHERE_01_00"); //Hej - sk¹d siê tu wzi¹³eœ, co?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Przybywam z gór.",DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN);	
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Przysy³a mnie Xardas...",DIA_BDT_1013_BANDIT_WHERE_XARDAS);
};
//-------------------------------------------------------------------------------------------
FUNC VOID DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00"); //Przybywam z gór.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01"); //No w³aœnie, przybywasz z gór. To Ÿle.
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02"); //Bardzo Ÿle.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03"); //Szukaj¹ ciê - ca³a zgraja naprawdê z³ych ludzi.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04"); //Jest tu ktoœ, z kim musisz natychmiast porozmawiaæ. ChodŸ za mn¹!
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Mo¿e póŸniej...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Komu tak bardzo na mnie zale¿y?",DIA_BDT_1013_BANDIT_WHERE_WHO);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"W porz¹dku, prowadŸ.",DIA_BDT_1013_BANDIT_WHERE_YES);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_XARDAS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00"); //Przysy³a mnie Xardas...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01"); //Stary czarodziej? Nazywa siê Xardas... Braga z pewnoœci¹ to zainteresuje.
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
}; 

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_YES()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_YES_15_00"); //W porz¹dku, prowadŸ.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_YES_01_01"); //No dobra, chodŸ za mn¹. Jaskinia jest niedaleko.
	
	Npc_ExchangeRoutine	(self,"AMBUSH"); 
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_BDT_1013_BANDIT_WHERE_WHO()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_WHO_15_00"); //Komu tak bardzo na mnie zale¿y?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_01"); //Po³owa Khorinis siê za tob¹ ugania, nie powiesz mi chyba, ¿e nie masz o tym zielonego pojêcia?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_02"); //Ach! Rozumiem! Nie chcesz o tym gadaæ, co? W porz¹dku - twoja sprawa.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_03"); //To jak, idziesz czy nie?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Mo¿e póŸniej...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Z kim powinienem porozmawiaæ?",DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"W porz¹dku, prowadŸ.",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00"); //Z kim powinienem porozmawiaæ?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01"); //Z moim szefem. Nazywa siê Brago. On wyjaœni ci wszystko o wiele lepiej ni¿ ja.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02"); //No wiêc jak - idziemy?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Mo¿e póŸniej...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Sk¹d mam wiedzieæ, ¿e to nie jest pu³apka?",DIA_BDT_1013_BANDIT_WHERE_NOTRAP);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"W porz¹dku, prowadŸ.",DIA_BDT_1013_BANDIT_WHERE_YES);
};
	
func void DIA_BDT_1013_BANDIT_WHERE_NOTRAP()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00"); //Sk¹d mam wiedzieæ, ¿e to nie jest pu³apka?
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01"); //Wiesz, zaczynasz mnie ju¿ mêczyæ. Jeœli nie chcesz pomocy, to idŸ do miasta, niech ciê zapuszkuj¹!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02"); //Albo NATYCHMIAST ze mn¹ pójdziesz, albo zejdŸ mi z oczu, ³apiesz?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Mo¿e póŸniej...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Ktoœ ju¿ próbowa³ mnie wyko³owaæ...",DIA_BDT_1013_BANDIT_WHERE_DAMALS);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"W porz¹dku, prowadŸ.",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_DAMALS()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00"); //Spokojnie, przyjacielu! Ktoœ ju¿ próbowa³ mnie wyko³owaæ...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01"); //Czy¿by?
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02"); //Pewien cz³owiek chcia³, ¿ebyœmy odzyskali razem amulet, a zyskami podzielili siê po po³owie.
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03"); //Kiedy ju¿ wykonaliœmy zadanie, on i banda jego kole¿ków zaatakowali mnie.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04"); //Wygl¹da na to, ¿eœ trafi³ na nieuczciwych ludzi - gdzie to siê wydarzy³o?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"To nie ma znaczenia.",DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"By³em skazañcem w kolonii górniczej.",DIA_BDT_1013_BANDIT_WHERE_PRISONER);
};

func void DIA_BDT_1013_BANDIT_WHERE_PRISONER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00"); //By³em skazañcem w kolonii górniczej.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01"); //Ej... Przychodzisz spoza Bariery? Cz³owieku! Byliœmy tam razem!
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02"); //Nie pamiêtam ciê...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03"); //By³em kopaczem w Starym Obozie. Trzyma³em siê z dala od k³opotów.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04"); //Ale teraz najwa¿niejsze jest to, ¿e wpakowa³eœ siê w porz¹dne tarapaty!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05"); //Ktoœ wyznaczy³ za twoj¹ g³owê ca³kiem spor¹ nagrodê. Pojawi³y siê te¿ listy goñcze z twoj¹ facjat¹!
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06"); //Na twoim miejscu bardzo bym na siebie uwa¿a³. S¹ wœród nas ludzie, którzy dla z³ota pozabijaliby w³asne matki.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07"); //Ale my, ch³opcy z kolonii karnej, powinniœmy siê trzymaæ razem!
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08"); //Powinienem ci chyba podziêkowaæ...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09"); //Nie ma za co. Próbujê po prostu utrzymaæ siê przy ¿yciu.
	
	Bdt13_Friend = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY);
	self.npctype = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
		
	Info_ClearChoices (DIA_BDT_1013_BANDIT_WHERE);
};

func void DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00"); //To nie ma znaczenia.
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01"); //Jak tam sobie chcesz. To co? Idziemy?
	
	Info_ClearChoices 	(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"Mo¿e póŸniej...",DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice 		(DIA_BDT_1013_BANDIT_WHERE,"W porz¹dku, prowadŸ.",DIA_BDT_1013_BANDIT_WHERE_YES);
};

func VOID DIA_BDT_1013_BANDIT_WHERE_LATER()
{
	AI_Output (other, self, "DIA_BDT_1013_BANDIT_WHERE_LATER_15_00"); //Mo¿e póŸniej...
	AI_Output (self, other, "DIA_BDT_1013_BANDIT_WHERE_LATER_01_01"); //Nie bêdzie ¿adnego póŸniej, kole¿ko!
	
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
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_00"); //G³upio zrobi³eœ, œledz¹c mnie...
		B_Attack 			(self, other, AR_SuddenEnemyInferno, 1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_1013_BANDIT_AMBUSH_01_01"); //Hej, ludzie, patrzcie, kogo tu mamy...
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
	description	 = 	"Kto wyznaczy³ tê nagrodê?";
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
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_00"); //Kto wyznaczy³ tê nagrodê?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_01"); //Tego nie wiem. Tylko jeden z nas go zna.
	AI_Output (other, self, "DIA_1013_BANDIT_NAME_15_02"); //A kto to taki?
	AI_Output (self, other, "DIA_1013_BANDIT_NAME_01_03"); //Hej, stary, no naprawdê nie mogê ci tego powiedzieæ. Wiesz, jak jest...
	
	Log_CreateTopic (Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus (Topic_Bandits,LOG_RUNNING);
	B_LogEntry (Topic_Bandits,"Œcigaj¹ mnie bandyci. Maj¹ list goñczy z moj¹ podobizn¹. Zastanawiam siê, kto lub co siê za tym kryje.");
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
	description	 = 	"10 sztuk z³ota za imiê tego goœcia!";
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
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_00"); //10 sztuk z³ota za imiê tego goœcia!
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_01"); //Och, stary, naprawdê nie mogê tego zrobiæ...
	AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_02"); //No, wykrztuœ to w koñcu!
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_03"); //Och, stary! No dobra. Nazywa siê Dexter. Ko³o du¿ego gospodarstwa jest stroma ska³a.
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_04"); //Na niej jest wie¿a stra¿nicza, a obok kilka kopalni. Gdzieœ w pobli¿u jest jego kryjówka.
	
	B_LogEntry (Topic_Bandits,"Przywódc¹ bandytów jest Dexter. Ukrywa siê w kopalni w pobli¿u farmy w³aœciciela ziemskiego.");
	
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_05"); //Widzisz, to nie by³o takie trudne. Tu jest twoje z³oto.
	}
	else
	{
		AI_Output (other, self, "DIA_1013_BANDIT_DEXTER_15_06"); //Eee... W³aœnie przypomnia³em sobie, ¿e nie mam dziesiêciu sztuk z³ota.
		AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_07"); //Co?! Ja... Och, niewa¿ne. To moja wina. Mog³em nic ci nie mówiæ, zanim nie zobaczy³em z³ota...
	};
	
	AI_Output (self, other, "DIA_1013_BANDIT_DEXTER_01_08"); //Tylko nie mów im, kto ci to powiedzia³.
			
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
	description	 = 	"Dasz mi ten portret?";
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
	AI_Output (other, self, "DIA_1013_BANDIT_PIC_15_00"); //Dasz mi ten portret?
	AI_Output (self, other, "DIA_1013_BANDIT_PIC_01_01"); //Jasne. Przecie¿ to TWOJA gêba.
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
	description	 = 	"Przys³a³ mnie jeden z ch³opów spoza miasta...";
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
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_00"); //Przys³a³ mnie jeden z ch³opów spoza miasta...
	AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_01"); //Co? Wieœniacy wiedz¹ o kryjówce?
	AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_02"); //Zauwa¿yli brak owiec.
	
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if (Npc_IsDead (b14))
	&& (Npc_IsDead (b15))
	{
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_03"); //O cholera! Có¿, wiêc muszê siê st¹d wynieœæ. Jeœli znajd¹ pust¹ kryjówkê, to mo¿e przestan¹ mnie szukaæ.
	}
	else //mindestens einer lebt noch
	{
		AI_Output (other, self, "DIA_1013_BANDIT_FromMaleth_15_04"); //On chce, ¿ebyœcie wszyscy zginêli...
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_05"); //Zaraz - chyba mnie nie wkopiesz? Nie po tym, jak ci pomog³em?
		AI_Output (self, other, "DIA_1013_BANDIT_FromMaleth_01_06"); //No to idŸ i porozbijaj ³by pozosta³ym, skoro tak pragniesz rozlewu krwi - ja w to nie wchodzê!
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
	description	 = 	"Wkrótce rozpêta siê tu prawdziwe piek³o!";
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
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_00"); //Wkrótce rozpêta siê tu prawdziwe piek³o!
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_01"); //Co?!
	AI_Output (other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_02"); //Idzie tu po ciebie niejaki Cavalorn!
	AI_Output (self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_03"); //Cholera! Muszê siê st¹d wynieœæ.

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
	description	 = 	"Wiesz coœ jeszcze, co mog³oby mnie zainteresowaæ?";
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
	AI_Output (other, self, "DIA_1013_BANDIT_PERM_15_00"); //Wiesz coœ jeszcze, co mog³oby mnie zainteresowaæ?

	if (bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_01"); //Chodzi ci o tutejsz¹ okolicê? Jeœli chcesz prze¿yæ, trzymaj siê œcie¿ek.
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_02"); //Im dalej zapuœcisz siê w dzicz, tym wiêksze grozi ci niebezpieczeñstwo.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_1013_BANDIT_PERM_01_03"); //Powiedzia³em ci wszystko, co wiem.
	};
};











