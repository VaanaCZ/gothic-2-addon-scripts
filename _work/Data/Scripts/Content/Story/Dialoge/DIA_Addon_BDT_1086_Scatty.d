//---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_EXIT   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 999;
	condition   = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Scatty_EXIT_Condition()	
	{
		return TRUE;
	};
FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine (self, "START");
		Scatty_Start = TRUE;
	};
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Scatty_PICKPOCKET (C_INFO)
{
	npc			= BDT_1086_Addon_Scatty;
	nr			= 900;
	condition	= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information	= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen (60, 90);
};
 
FUNC VOID DIA_Addon_Scatty_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
	
func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Scatty_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Hi   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent   = FALSE;
	description = "Jak ci idą interesy?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Jak ci idą interesy?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Od otwarcia krypty coraz gorzej....
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Kruk nie potrzebuje już niewolników. Teraz kopią złoto, bo tak kazał im Bloodwyn.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//A kopacze mają wolne. Odpoczywający kopacze nie wróżą dobrze moim interesom.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty handluje różnymi towarami.");
};
/*
	Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln. 
	(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf-  oder ein Abstieg? 
*/
//---------------------------------------------------------------------
//	Info last
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_last   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent   = FALSE;
	description = "Bloodwyn? To on tu jest szefem?";
};
FUNC INT DIA_Addon_Scatty_last_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_last_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//Bloodwyn? To on tu jest szefem?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Kontroluje kopalnię, ale rzadko do niej zagląda. Większość czasu spędza z Krukiem w świątyni.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Co dokładnie oznacza "rzadko"?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//Ostatnio widziałem go, gdy wychodził z krypty...
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//Nie, czekaj! To chyba było wtedy, gdy wysłał niewolników, aby wydobywali złoto.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//Bardzo je lubi... inaczej niż Kruk.
};
//---------------------------------------------------------------------
//	Info Gruft
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gruft   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent   = FALSE;
	description = "O jakiej krypcie mówisz?";
};
FUNC INT DIA_Addon_Scatty_Gruft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//O jakiej krypcie mówisz?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//To przeklęta krypta! Jej strażnicy zabili wielu ludzi!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Strażnicy? Mówisz o tych kamiennych stworach? O płaskich twarzach i okrągłych głowach?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//Tak! Ze skał wyszły ich całe tuziny!
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Od początku wiedziałem, że otwieranie krypty to nie jest dobry pomysł.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Kruk miał obsesję na punkcie tych wykopalisk. Gdy tylko krypta została odsłonięta, on i jego strażnicy weszli do środka.
};
//---------------------------------------------------------------------
//	Info GruftAgain
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_GruftAgain   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent   = FALSE;
	description = "Dlaczego Kruk tak chciał wejść do tej krypty?";
};
FUNC INT DIA_Addon_Scatty_GruftAgain_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gruft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Dlaczego Kruk tak chciał wejść do tej krypty?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//Hmm. Jesteś dość wścibski. Przypominasz mi gościa, którego kiedyś znałem.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Był równie wścibski. A pewnego dnia sprowadziło to na niego zgubę.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Przestań bełkotać. Co się stało w krypcie?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//No cóż... Ee, zaschło mi w ustach. Napiłbym się czegoś.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Hej, Scatt, NIE TERAZ. To ważne. Co Kruk robił na dole?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//Dobrze... On... przywołał coś, używając słów jakiegoś dziwnego języka.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Ze środka krypty przesiąkało lśniące światło, potem usłyszałem krzyk. Wstrząsający, demoniczny wrzask.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//Co stało się potem?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//To wszystko, co widziałem. Z krypty wyszedł Bloodwyn i kazał mi się wynosić. Tak zresztą zrobiłem.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Krótko potem Kruk i jego ludzie opuścili świątynię. Od tamtej pory nie było go tu na dole.
};
//---------------------------------------------------------------------
//	Info Trinken
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Trinken   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent   = FALSE;
	description = "Napijesz się czegoś?";
};
FUNC INT DIA_Addon_Scatty_Trinken_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Scatty_GruftAgain)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Napijesz się czegoś?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Napiłbym się piwa. Trudno je dostać w tym obozie.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Może Lucia ma jeszcze gdzieś butelkę.
};
//---------------------------------------------------------------------
//	Info Bier geben
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Bier   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent   = FALSE;
	description = "Zdrówko! (Daj piwo)";
};
FUNC INT DIA_Addon_Scatty_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems (other, ItFo_beer) 
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_Bier_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Zdrówko!
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Och, ale dobre. Dzięki, jesteś moim bohaterem.
	
	B_GivePlayerXP (XP_Ambient* 5);
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_Gold   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};
FUNC INT DIA_Addon_Scatty_Gold_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Gold_Info()
{
	B_Say 	  (other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Bierzesz kilof i walisz w kawał złota... Każdy to potrafi.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Jeśli jednak będziesz tak robić, złoto rozpadnie się na drobne bryłki. Dlatego właśnie kopać powinni ludzie z doświadczeniem.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Jeżeli masz trochę doświadczenia, to mogę ci powiedzieć jeszcze parę rzeczy.

	B_Upgrade_Hero_HackChance(5);
};
//---------------------------------------------------------------------
//	Info teach
//---------------------------------------------------------------------
var int Scatty_teach_perm;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_teach   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent   = TRUE;
	description = "Naucz się wydobywania złota. (Koszt: 2 PN/10 procent)";
};
FUNC INT DIA_Addon_Scatty_teach_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_teach_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Powiedz mi coś o kopaniu złota.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Musisz pamiętać, że złoto nie przypomina rudy. Jest miękkie jak masło. Jak uderzysz zbyt mocno, rozpadnie się na drobne kawałeczki.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Każdy z kopaczy zna sztuczki, dzięki którym wydobywa ze skały ładne bryłki.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//To właśnie pomaga rozróżnić dobrego kopacza od złego.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//No i praktyka też robi swoje. Jak trochę popracujesz, będzie ci szło lepiej.
		
		other.lp = (other.lp -1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};

//---------------------------------------------------------------------
//	Info tot
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_tot   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 2;
	condition   = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent   = FALSE;
	description = "Bloodwyn nie żyje.";
};
FUNC INT DIA_Addon_Scatty_tot_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_tot_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn nie żyje.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hmm, taka wiadomość nie powinna mnie ucieszyć. Ale Bloodwyn jest kolesiem, którego wolę widzieć martwym.
};
//---------------------------------------------------------------------
//	Info trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Scatty_trade   (C_INFO)
{
	npc         = BDT_1086_Addon_Scatty;
	nr          = 99;
	condition   = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Scatty_trade_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Scatty_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (other,self,"$TRADE_1");
};


