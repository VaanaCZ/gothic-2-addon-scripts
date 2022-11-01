///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Feuer
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Feuer		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Feuer_Condition;
	information	 = 	DIA_Hyglas_Feuer_Info;
	permanent	 = 	FALSE;
	description	 =  "Požaduji zkoušku ohnę.";
};
func int DIA_Hyglas_Feuer_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Pyrokar_FIRE) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Feuer_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_Feuer_15_00"); //Chci vykonat zkoušku ohnę.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_01"); //Zkouška ohnę pochází ze starých časů a už velice dlouho jí nikdo nepodstoupil.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_02"); //Co požaduješ, je velice nebezpečné. Radęji si to ještę rozmysli.
};    
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Hallo		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Hallo_Condition;
	information	 = 	DIA_Hyglas_Hallo_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Hyglas_Hallo_Condition ()
{	
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Hyglas_Hallo_14_00"); //Jsem mistr Hyglas, Strážce ohnę a Opatrovník vędomostí.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_01"); //Takže mistr Parlan ti dal svolení ke studiu svitků.
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_02"); //Takže pâesnę to bys teë męl dęlat. Studovat, abys ve svatých knihách našel osvícení.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_JOB		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_JOB_Condition;
	information	 = 	DIA_Hyglas_JOB_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co studuješ ty, Mistâe?";
};
func int DIA_Hyglas_JOB_Condition ()
{	
	return TRUE;
};
func void DIA_Hyglas_JOB_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_JOB_15_00"); //Co studuješ ty, mistâe?
	AI_Output (self, other, "DIA_Hyglas_JOB_14_01"); //Můj výzkum se zamęâuje na oheŕ - Innosovu sílu.
	AI_Output (self, other, "DIA_Hyglas_JOB_14_02"); //Je to jeho dar a zároveŕ mocná zbraŕ - a já vytváâím runy, které obsahují jeho moc.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (other, self, "DIA_Hyglas_JOB_15_03"); //Velmi poučné. Mohl bys mę to naučit?
		AI_Output (self, other, "DIA_Hyglas_JOB_14_04"); //Je to Innos, kdo dává dar magie. Jen jeho služebníkům, ohnivým mágům, je pâáno vládnout jeho mocí.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info CONTEST
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_CONTEST		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_CONTEST_Condition;
	information	 = 	DIA_Hyglas_CONTEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Požádal jsem o zkoušk u ohnę.";
};
func int DIA_Hyglas_CONTEST_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_CONTEST_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_00"); //Požádal jsem o zkoušku ohnę. Ulthar mi dal za úkol vytvoâit runu ohnivého šípu.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_01"); //A teë po mnę chceš, abych tę naučil pâíslušnou formuli?
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_02"); //Neznám nikoho jiného, kdo by to dokázal.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_03"); //Hmm...
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_04"); //Dobrá, naučím tę tu formuli. Ale nejdâív budeš muset najít všechny potâebné ingredience.
	
	B_LogEntry (TOPIC_Rune,"Pokud si obstarám pâíslušné ingredience, naučí mę Hyglas zaklínadlo pro runu ohnivého šípu.");
};	
///////////////////////////////////////////////////////////////////////
//	Info FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_FIREBOLT		(C_INFO)
{
	npc		 	 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_FIREBOLT_Info;
	permanent	 =  FALSE;
	description	 = 	"Jaké ingredience potâebuji na vytvoâení runy ohnivého šípu?";
};
func int DIA_Hyglas_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_FIREBOLT_15_00"); //Jaké ingredience potâebuji na vytvoâení runy ohnivého šípu?
	AI_Output (self, other, "DIA_Hyglas_FIREBOLT_14_01"); //Pâečti si to - je to tam v tęch knihách.
};
///////////////////////////////////////////////////////////////////////
//	Info TALENT_FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TALENT_FIREBOLT		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	990;
	condition	 = 	DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Nauč mę vytvoâit runu OHNIVÉHO ŠÍPU.";

};
func int DIA_Hyglas_TALENT_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	&& (Npc_HasItems (other,ItMi_RuneBlank) >= 1)
	&& (Npc_HasItems (other,ItSc_Firebolt) >= 1)
	&& (Npc_HasItems (other,ItMi_Sulfur) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TALENT_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_TALENT_FIREBOLT_15_00"); //Nauč mę vytvoâit runu OHNIVÉHO ŠÍPU.
	
	if (B_TeachPlayerTalentRunes (self, other, SPL_Firebolt))	
	{
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_01"); //Pokud chceš sestavit runu ohnivého šípu, musíš na runovém stole spojit síru s runovým kamenem.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_02"); //Síla ze svitku s kouzlem ohnivého šípu vplyne do runy a ty získáš Innosův nástroj.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_03"); //Takže jakmile budeš mít všechny potâebné vęci, pâistup k runovému stolu a vytvoâ svou runu.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info BLANK_RUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_BLANK_RUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	9;	
	condition	 = 	DIA_Hyglas_BLANK_RUNE_Condition;
	information	 = 	DIA_Hyglas_BLANK_RUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"Kde bych mohl najít runový kámen?";
};
func int DIA_Hyglas_BLANK_RUNE_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_FIREBOLT)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (npc_hasItems (other, ItMI_RuneBlank) < 1) 
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_BLANK_RUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_BLANK_RUNE_15_00"); //Kde bych mohl najít runový kámen?
	AI_Output (self, other, "DIA_Hyglas_BLANK_RUNE_14_01"); //Hele, jsi to ty, kdo požádal o zkoušku ohnę, ne já. Najít jej je součástí zkoušky.
};
///////////////////////////////////////////////////////////////////////
//	Info GOTRUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_GOTRUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =  2;
	condition	 = 	DIA_Hyglas_GOTRUNE_Condition;
	information	 = 	DIA_Hyglas_GOTRUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"Vytvoâil jsem tu runu.";
};
func int DIA_Hyglas_GOTRUNE_Condition ()
{
	if (Npc_KnowsInfo (hero,DIA_Ulthar_SUCCESS)== FALSE ) 
	&& (Npc_HasItems (hero, ItRu_Firebolt) >= 1)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_GOTRUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_GOTRUNE_15_00"); //Vytvoâil jsem tu runu.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_01"); //Inu dobrá. Zdá se, že v této části zkoušky jsi obstál. Konec konců to nebylo až tak tęžké.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_02"); //Jdi tedy za Utharem a ukaž mu své dílo.
	
	B_LogEntry (TOPIC_Rune,"Vytvoâil jsem runu ohnivého šípu."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TEACH		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	15;
	condition	 = 	DIA_Hyglas_TEACH_Condition;
	information	 = 	DIA_Hyglas_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Uč mę.";
};
func int DIA_Hyglas_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TEACH_Info ()
{

	var int abletolearn;
	
	abletolearn = 0;
	AI_Output (other, self, "DIA_Hyglas_TEACH_15_00"); //Uč mę.
	
	
	Info_ClearChoices (DIA_Hyglas_TEACH);
	Info_AddChoice 	  (DIA_Hyglas_TEACH, DIALOG_BACK,DIA_Hyglas_TEACH_BACK);	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2) 
	&& (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) 
	&& (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firestorm)) ,DIA_Hyglas_TEACH_Firestorm);
		abletolearn = (abletolearn +1);
	};
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4) 
	&& (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = (abletolearn +1);
	};
	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5) 
	&& (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6) 
	&& (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Hyglas_TEACH_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		B_Say (self, other, "$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices (DIA_Hyglas_TEACH);
	};
};
FUNC VOID DIA_Hyglas_TEACH_BACK ()
{
	Info_ClearChoices (DIA_Hyglas_TEACH);
};
FUNC VOID DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_Pyrokinesis()
{	
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);	
};
FUNC VOID DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);	
};
FUNC VOID DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};

//#######################################
//##
//##	Kapitel 2
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#######################################
//##
//##	Kapitel 3
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringBook
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_BringBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent   = FALSE;
	description = "Co je nového?";
};
FUNC INT DIA_Hyglas_BringBook_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_BringBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_00"); //Je nęco nového?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_01"); //Hm, ano. Asi sis už všiml tęch postav v černých róbách.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_02"); //Setkal jsem se s nimi.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_03"); //To nás pâivádí k jádru vęci. V tuhle chvíli jsme svędky velice vzácné hvęzdné konstelace.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_04"); //Abych byl pâesnęjší, znamení Vola je v pâesné korelaci se znamením Válečníka. Pâedpokládám, že víš, co to znamená.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_05"); //Hmm. No, abych byl upâímný...
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_06"); //Ano, dobrá, chápu. No, nemůžu ti teë vysvętlovat všechno, ale každopádnę to pâedznamenává velké zmęny. A já nemám zmęny rád.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_07"); //Proto chci, abys mi z męsta pâinesl jednu knihu. Jmenuje se "Posvátná moc hvęzd". Možná ji budeš muset chvilku hledat, ale jsem si jist, že ji nakonec objevíš.
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	Info_AddChoice (DIA_Hyglas_BringBook,"Najdi si tu knihu sám.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice (DIA_Hyglas_BringBook,"Co z toho budu mít?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice (DIA_Hyglas_BringBook,"Uvidím, jestli se mi ji podaâí najít.",DIA_Hyglas_BringBook_Yes);
};

FUNC VOID DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetItYourself_15_00"); //Najdi si tu knihu sám.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_01"); //Jak se opovažuješ se mnou mluvit tímto tónem? Tvoje chování postrádá úctu, kterou mi jsi povinován.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_02"); //Bęž mi z očí a pâemýšlej o svém chování.
	
	MIS_HyglasBringBook = LOG_OBSOLETE;
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_00"); //Co z toho budu mít?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_01"); //Co tím myslíš?
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_02"); //Rád bych vędęl, co dostanu za to, když ti tu knihu pâinesu.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_03"); //Nic. Co bys myslel, že dostaneš? Pokud máš čas dęlat mi ve męstę poslíčka, je pâímo tvou povinností mi pomoci.
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_Yes()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_Yes_15_00"); //Uvidím, jestli se mi ji podaâí najít.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_01"); //To je správné - získám tak trochu času navíc, abych se mohl poohlédnout také po nęčem jiném.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_02"); //Ale aă ti to netrvá moc dlouho. Obávám se, že nemáme času nazbyt.
	
	MIS_HyglasBringBook = LOG_RUNNING;
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	
	Log_CreateTopic (TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HyglasBringBook,LOG_RUNNING);
	B_LogEntry (TOPIC_HyglasBringBook,"Hyglas mę požádal, zda bych mu nenašel knihu 'Božská moc hvęzd'. Zkusím se po ní podívat u męstských obchodníků.");
};

//*********************************************************************
//	Ich hab dein Buch
//*********************************************************************

INSTANCE DIA_Hyglas_HaveBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent   = FALSE;
	description = "Mám pro tebe tu knihu.";
};
FUNC INT DIA_Hyglas_HaveBook_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	&& (Npc_HasItems (other,ItWr_Astronomy_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_HaveBook_15_00"); //Mám pro tebe tu knihu.
	
	IF Mis_HyglasBringBook == LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_01"); //Výbornę, dej mi ji.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_02"); //Takže sis to nakonec pâece jen rozmyslel. Velmi dobâe. Tak kde ji máš?
	};		
		
	B_GiveInvItems (other,self,ItWr_Astronomy_Mis,1);
	
	Mis_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP (XP_HyglasBringBook);
	
	
	AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_03"); //Můžeš jít. Já půjdu studovat.
	
};

//#######################################
//##
//##	Kapitel 4
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm4
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_PERM   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 49;
	condition   = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent   = TRUE;
	description = "Už jsi na nęco pâišel?";
};
FUNC INT DIA_Hyglas_Kap4_PERM_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_00"); //Už jsi na nęco pâišel?
	
	if (Mis_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_01"); //No, nemohu si být úplnę jistý, ale zdá se, že současná konstelace hvęzd poukazuje na mnohá nebezpečí.
		AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_02"); //Jaká nebezpečí?
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_03"); //Inu, vypadá to, že struktura mezi svęty je velice slabá. K vytvoâení díry do této struktury je teë zapotâebí jen zlomek síly co obvykle.
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_04"); //Takovéto portály pak mohou používat démoni ke vstupu do našeho svęta, aniž by museli čelit nęjakému odporu.
		
		Hyglas_SendsToKarras = TRUE;
	}
	else if (Mis_HyglasBringBook == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_05"); //Ne, stále čekám na tu knihu.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_06"); //Âekl jsem ti, že stále provádím výzkum, ale samozâejmę by mi to trvalo mnohem déle, kdybych nemęl potâebný materiál.
	};
	
};

//#######################################
//##
//##	Kapitel 5
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hyglas_PICKPOCKET (C_INFO)
{
	npc			= KDF_510_Hyglas;
	nr			= 900;
	condition	= DIA_Hyglas_PICKPOCKET_Condition;
	information	= DIA_Hyglas_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Hyglas_PICKPOCKET_Condition()
{
	C_Beklauen (73, 200);
};
 
FUNC VOID DIA_Hyglas_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_BACK 		,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};
	
func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};

























