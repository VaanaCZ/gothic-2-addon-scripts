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
	description	 =  "Proszê o Próbê Ognia.";
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
	AI_Output (other, self, "DIA_Hyglas_Feuer_15_00"); //Proszê o Próbê Ognia.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_01"); //Próba Ognia nie by³a stosowana od zamierzch³ych czasów.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_02"); //To zbyt niebezpieczne. Nawet o tym nie myœl.
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
	AI_Output (self, other, "DIA_Hyglas_Hallo_14_00"); //Jestem Mistrz Hyglas, Stra¿nik Ognia i Wiedzy.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_01"); //A wiêc Mistrz Parlan wyda³ ci pozwolenie na dostêp do pism.
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_02"); //Zatem proszê, masz woln¹ rêkê. Czytaj, a znajdziesz w pismach oœwiecenie, którego szukasz.
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
	description	 = 	"Co studiujesz, Mistrzu?";
};
func int DIA_Hyglas_JOB_Condition ()
{	
	return TRUE;
};
func void DIA_Hyglas_JOB_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_JOB_15_00"); //Co studiujesz, Mistrzu?
	AI_Output (self, other, "DIA_Hyglas_JOB_14_01"); //Moje badania koncentruj¹ siê na ogniu - ¿ywiole Innosa.
	AI_Output (self, other, "DIA_Hyglas_JOB_14_02"); //To wielki dar, a zarazem potê¿na broñ. Zajmujê siê tworzeniem run zawieraj¹cych moc ognia Innosa.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (other, self, "DIA_Hyglas_JOB_15_03"); //To bardzo m¹dre. Nauczysz mnie?
		AI_Output (self, other, "DIA_Hyglas_JOB_14_04"); //Tylko Innos mo¿e zes³aæ dar magii. I jedynie jego s³udzy, Magowie Ognia, mog¹ z niego korzystaæ.
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
	description	 = 	"Za¿¹da³em Próby Ognia.";
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
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_00"); //Za¿¹da³em próby ognia. Ulthar kaza³ mi stworzyæ runê ognistej strza³y.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_01"); //A teraz pewnie chcesz, abym nauczy³ ciê odpowiedniej formu³y?
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_02"); //Nie za bardzo wiem, co jeszcze móg³bym zrobiæ.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_03"); //Hmmm...
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_04"); //Dobrze, nauczê ciê tej formu³y. Ale najpierw musisz znaleŸæ niezbêdne sk³adniki.
	
	B_LogEntry (TOPIC_Rune,"Hyglas ma mnie nauczyæ formu³y runy ognistej strza³y, kiedy tylko zdobêdê wszystkie sk³adniki.");
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
	description	 = 	"Jakie sk³adniki potrzebne s¹ do stworzenia runy ognistej strza³y?";
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
	AI_Output (other, self, "DIA_Hyglas_FIREBOLT_15_00"); //Jakie sk³adniki potrzebne s¹ do stworzenia runy ognistej strza³y?
	AI_Output (self, other, "DIA_Hyglas_FIREBOLT_14_01"); //Wszystkie odpowiedzi znajdziesz w ksiêgach.
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
	description	 = 	"Naucz mnie, jak stworzyæ runê OGNISTEJ STRZA³Y.";

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
	AI_Output (other, self, "DIA_Hyglas_TALENT_FIREBOLT_15_00"); //Naucz mnie, jak stworzyæ runê OGNISTEJ STRZA£Y.
	
	if (B_TeachPlayerTalentRunes (self, other, SPL_Firebolt))	
	{
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_01"); //Aby stworzyæ runê ognistej strza³y, musisz po³¹czyæ na stole runicznym siarkê z kamieniem runicznym.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_02"); //Moc zaklêcia ognistej strza³y wniknie w runê, a ty dostaniesz narzêdzie Innosa.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_03"); //Skoro ju¿ masz wszystkie materia³y, mo¿esz przyst¹piæ do tworzenia runy.
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
	description	 = 	"Gdzie znajdê kamieñ runiczny?";
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
	AI_Output (other, self, "DIA_Hyglas_BLANK_RUNE_15_00"); //Gdzie znajdê kamieñ runiczny?
	AI_Output (self, other, "DIA_Hyglas_BLANK_RUNE_14_01"); //Hej hej, to twoja próba, nie moja. Znalezienie kamienia jest czêœci¹ zadania.
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
	description	 = 	"Stworzy³em runê.";
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
	AI_Output (other, self, "DIA_Hyglas_GOTRUNE_15_00"); //Stworzy³em runê.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_01"); //No proszê. Zdaje siê, ¿e przeszed³eœ próbê. Nie by³o to chyba a¿ takie trudne.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_02"); //IdŸ do Ulthara i poka¿ mu swoje dzie³o.
	
	B_LogEntry (TOPIC_Rune,"Stworzy³em runê Ognistej Strza³y."); 
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
	description	 = 	"Naucz mnie.";
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
	AI_Output (other, self, "DIA_Hyglas_TEACH_15_00"); //Zostañ moim nauczycielem.
	
	
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
	description = "Jakieœ wieœci?";
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
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_00"); //Jakieœ wieœci?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_01"); //Hm, tak. No có¿, prawdopodobnie zauwa¿y³eœ te odziane na czarno postacie.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_02"); //Spotka³em je.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_03"); //I tu dochodzimy do sedna problemu. Aktualny uk³ad gwiazd jest bardzo nietypowy.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_04"); //Mówi¹c konkretniej, konstelacja Wo³a wesz³a w koniunkcjê z konstelacj¹ Wojownika. Nie muszê chyba t³umaczyæ, co to oznacza.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_05"); //Hmmm. No có¿, szczerze mówi¹c...
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_06"); //Jasne, rozumiem. Nie bêdê siê teraz wdawa³ w szczegó³owe rozwa¿ania na temat takiej konfiguracji. Powiem tylko tyle, ¿e oznacza ona wielkie zmiany. A ja nie lubiê zmian.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_07"); //Dlatego chcê, abyœ przyniós³ mi z miasta pewn¹ ksiêgê, zatytu³owan¹ 'Boska moc gwiazd'. Zdobycie jej mo¿e wymagaæ nieco wysi³ku, ale jestem pewien, ¿e sobie poradzisz.
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	Info_AddChoice (DIA_Hyglas_BringBook,"Sam sobie znajdŸ tê ksiêgê.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice (DIA_Hyglas_BringBook,"A co JA bêdê z tego mia³?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice (DIA_Hyglas_BringBook,"Zobaczê, czy uda mi siê j¹ znaleŸæ.",DIA_Hyglas_BringBook_Yes);
};

FUNC VOID DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetItYourself_15_00"); //Sam sobie znajdŸ tê ksiêgê.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_01"); //Jak œmiesz odzywaæ siê do mnie w ten sposób? Takim zachowaniem okazujesz brak nale¿nego mi szacunku.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_02"); //ZejdŸ mi z oczu i zastanów siê dobrze nad swoim postêpowaniem.
	
	MIS_HyglasBringBook = LOG_OBSOLETE;
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_00"); //A co z tego bêdê mia³?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_01"); //Nie ca³kiem rozumiem...
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_02"); //Chcia³bym wiedzieæ, co zyskam, jeœli przyniosê ci ksiêgê.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_03"); //Nic. A czego oczekiwa³eœ? Jeœli masz czas na wycieczkê do miasta, twoim obowi¹zkiem jest mi pomóc.
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_Yes()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_Yes_15_00"); //Zobaczê, czy uda mi siê j¹ znaleŸæ.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_01"); //Dobrze - dziêki temu bêdê mia³ wiêcej czasu na inne sprawy.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_02"); //Spróbuj za³atwiæ to jak najszybciej. Obawiam siê, ¿e czas jest w tej chwili doœæ cennym towarem.
	
	MIS_HyglasBringBook = LOG_RUNNING;
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	
	Log_CreateTopic (TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HyglasBringBook,LOG_RUNNING);
	B_LogEntry (TOPIC_HyglasBringBook,"Hyglas chce, abym przyniós³ mu ksiêgê zatytu³owan¹ 'Boska moc gwiazd'. Mo¿e ma j¹ któryœ z handlarzy w mieœcie.");
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
	description = "Przynios³em ci ksiêgê.";
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
	AI_Output (other,self ,"DIA_Hyglas_HaveBook_15_00"); //Przynios³em ci ksiêgê.
	
	IF Mis_HyglasBringBook == LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_01"); //Bardzo dobrze, daj mi j¹.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_02"); //A wiêc jednak zmieni³eœ zdanie. Bardzo dobrze. Gdzie jest ksiêga?
	};		
		
	B_GiveInvItems (other,self,ItWr_Astronomy_Mis,1);
	
	Mis_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP (XP_HyglasBringBook);
	
	
	AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_03"); //Mo¿esz odejœæ. A ja zajmê siê badaniami.
	
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
	description = "Dowiedzia³eœ siê czegoœ nowego?";
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
	AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_00"); //Dowiedzia³eœ siê czegoœ nowego?
	
	if (Mis_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_01"); //Nie jestem do koñca pewien, ale wygl¹da na to, ¿e aktualny uk³ad gwiazd zwiastuje k³opoty.
		AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_02"); //Jakie problemy?
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_03"); //Materia rozdzielaj¹ca dwa œwiaty sta³a siê bardzo cienka. Gdyby ktoœ chcia³ otworzyæ przejœcie, móg³by to zrobiæ, u¿ywaj¹c zaledwie cz¹stki mocy potrzebnej do tego w innych okolicznoœciach.
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_04"); //Demony mog¹ u¿ywaæ takich przejœæ, aby przenikaæ do naszego œwiata.
		
		Hyglas_SendsToKarras = TRUE;
	}
	else if (Mis_HyglasBringBook == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_05"); //Nie, wci¹¿ czekam na tê ksiêgê.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_06"); //Oczywiœcie wci¹¿ prowadzê swoje badania, jednak potrwaj¹ one znacznie d³u¿ej, jeœli nie bêdê mia³ niezbêdnych materia³ów.
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

























