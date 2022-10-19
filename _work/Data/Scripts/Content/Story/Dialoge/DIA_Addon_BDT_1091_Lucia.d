//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_EXIT   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 999;
	condition   = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lucia_PICKPOCKET (C_INFO)
{
	npc			= BDT_1091_Addon_Lucia;
	nr			= 900;
	condition	= DIA_Addon_Lucia_PICKPOCKET_Condition;
	information	= DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80_Female;
};                       
FUNC INT DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	C_Beklauen (80, 100);
};
 
FUNC VOID DIA_Addon_Lucia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
	
func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Hi   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent   = FALSE;
	description = "Co s�ycha�?";
};
FUNC INT DIA_Addon_Lucia_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Hi_15_00");//Co s�ycha�?
	AI_Output (self, other, "DIA_Addon_Lucia_Hi_16_01");//S�uchaj, jak b�dziesz g�odny, id� do Snafa. A jak chcesz si� napi�, to rozmawiasz z odpowiedni� osob�.
};
//---------------------------------------------------------------------
//	Info was
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_was   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent   = FALSE;
	description = "Co mo�esz mi zaproponowa�?";
};
FUNC INT DIA_Addon_Lucia_was_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_was_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_was_15_00");//Co mo�esz mi zaproponowa�?
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_01");//Niestety, nie mamy piwa. Mamy tylko to, co przywie�li paladyni.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_02");//No c�, przynajmniej do czego� si� przydali...
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_03");//A poza tym mamy mocniejsze trunki p�dzone na miejscu: grog i bia�y rum.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_04");//Hmm... Powiniene� spr�bowa� TEGO. Dosta�am przepis od Samuela. Ten stary pijak wie, jak miesza� trunki.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Lucia handluje alkoholem.");
};
//---------------------------------------------------------------------
//	Info Khorinis
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Khorinis   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent   = FALSE;
	description = "Hej, czy ty przypadkiem nie jeste� z Khorinis?";
};
FUNC INT DIA_Addon_Lucia_Khorinis_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Bromor_Lucia)
	|| (Nadja_GaveLuciaInfo == TRUE)
	|| Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Khorinis_15_00");//Hej, czy ty przypadkiem nie jeste� z Khorinis?
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_01");//Nie przypominaj mi o tym miejscu! Mia�am tam straszne �ycie.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_02");//Gdy przyp�ywa�y nowe statki ze skazanymi, miasto t�tni�o �yciem.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_03");//Ale pozostali... Nie, dzi�kuj�. Mo�e to dlatego, �e jeste�my na wyspie. No c�, tamte czasy to ju� przesz�o��.

	if (MIS_LuciasLetter != 0)
	|| (SC_KnowsLuciaCaughtByBandits != 0)
	|| (Nadja_GaveLuciaInfo != 0)
	{
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_06"); //Zerwa�am ju� z Elvrichem!
		AI_Output (other,self , "DIA_Addon_Lucia_Khorinis_15_04"); //Dlaczego?
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_05"); //Bo to tch�rz. Gdy bandyci mnie porwali, nic nie zrobi�.
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP (XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};
//---------------------------------------------------------------------
//	Info Jetzt
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Jetzt   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent   = FALSE;
	description = "I co zamierzasz teraz robi�?";
};
FUNC INT DIA_Addon_Lucia_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Khorinis)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Jetzt_15_00");//I co zamierzasz teraz robi�?
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_01");//Zobaczymy. Na razie dobrze mi tu, razem ze Snafem, Fiskiem i innymi.
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_02");//Rozmawia�e� ju� z Thorusem? O Innosie, ale kawa� ch�opa!
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_03");//Przepraszam... A wracaj�c do twojego pytania... Nie mam okre�lonego celu, bior�, co daje mi los.
};
//---------------------------------------------------------------------
//	Info Paladine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Paladine   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent   = FALSE;
	description = "Nie lubisz paladyn�w, prawda?";
};
FUNC INT DIA_Addon_Lucia_Paladine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_15_00");//Nie lubisz paladyn�w, prawda?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_01");//Tych fanatyk�w morduj�cych dla zakonu Mag�w Ognia? Nie.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_02");//Lord Hagen i jego oprychy zaj�li miasto i wszyscy ich teraz s�uchaj�.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_03");//A to mi si� nie spodoba�o. Nie chcia�am czeka�, a� przyjd� do Czerwonej Latarni mnie aresztowa�.
	
	if (Npc_GetTrueGuild (other) != GIL_SLD)
	&& (Npc_GetTrueGuild (other) != GIL_DJG)
	{
		Info_ClearChoices (DIA_Addon_Lucia_Paladine);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Zako�cz rozmow�.",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Paladyni nie walcz� w imieniu Innosa. On sam wybiera sobie wojownik�w.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Paladyni s� wojownikami Innosa. Nie s� mordercami.",DIA_Addon_Lucia_Paladine_MURDER);
		
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WAHL_15_00");//Paladyni nie walcz� w imieniu Innosa. On sam wybiera sobie wojownik�w.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_01");//Naprawd�? Uwa�am, �e ludzie sami decyduj� o swoim przeznaczeniu.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_02");//Ale twoje s�owa mnie zastanawiaj�. M�wisz niemal jak jeden z nich.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Zabi�a� ju� kiedy� kogo�?",DIA_Addon_Lucia_Paladine_KILL);
};
FUNC VOID DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_KILL_15_00");//Zabi�a� ju� kiedy� kogo�?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_01");//Nie, i bardzo mnie to cieszy.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_02");//Prosz�, nie rozmawiajmy ju� o powa�nych sprawach.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_03");//Pijmy i cieszmy si� ka�d� chwil� podarowan� nam przez bog�w.
	
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WEIB_15_00");//Chcesz splugawi� imi� Innosa, kobieto?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_01");//Jak mog�abym to zrobi�? To m�czy�ni czyni� z�o w jego imi�.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_02");//Ja nie w�tpi� w boskie pochodzenie Innosa.
};
FUNC VOID DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_MURDER_15_00");//Paladyni s� wojownikami Innosa. Nie s� mordercami.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_01");//Naprawd�? Ich bro� jest r�wnie skrwawiona, jak bro� bandyt�w i pirat�w.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_02");//Jedyna r�nica polega na tym, �e oni post�puj� w imi� Innosa, a nie dlatego �e chc� przetrwa�.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"Chcesz splugawi� imi� Innosa, kobieto?",DIA_Addon_Lucia_Paladine_WEIB);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Attentat   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 9;
	condition   = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Lucia_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Lucia_Attentat_16_00");//Nic.
};
//---------------------------------------------------------------------
//	Info Trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Trade   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 99;
	condition   = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = "Chc� si� czego� napi�.";
};
FUNC INT DIA_Addon_Lucia_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Trade_15_00");//Chc� si� czego� napi�.
	B_GiveTradeInv(self);
};
//---------------------------------------------------------------------
//	Info lernen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_lernen   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 19;
	condition   = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent   = FALSE;
	description = "Mo�esz mnie czego� nauczy�?";
};
FUNC INT DIA_Addon_Lucia_lernen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_lernen_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_lernen_15_00");//Mo�esz mnie czego� nauczy�?
	AI_Output (self, other, "DIA_Addon_Lucia_lernen_16_01");//Oczywi�cie. Mog� ci pom�c w rozwini�ciu ZR�CZNO�CI!
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Lucia mo�e mi pom�c poprawi� moj� zr�czno��.");	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lucia_TEACH		(C_INFO)
{
	npc		  	 = 	BDT_1091_Addon_Lucia;
	nr			 = 	101;
	condition	 = 	DIA_Addon_Lucia_TEACH_Condition;
	information	 = 	DIA_Addon_Lucia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chc� si� sta� bardziej zr�czny.";
};
func int DIA_Addon_Lucia_TEACH_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_lernen)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lucia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lucia_TEACH_15_00"); //Chc� si� sta� bardziej zr�czny.
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
};
func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_TEACH);
};
func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};
func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};



