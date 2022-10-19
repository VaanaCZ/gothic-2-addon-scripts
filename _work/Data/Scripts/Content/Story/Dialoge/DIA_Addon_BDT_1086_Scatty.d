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
	description = "Jak ci id¹ interesy?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Jak ci id¹ interesy?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Od otwarcia krypty coraz gorzej....
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Kruk nie potrzebuje ju¿ niewolników. Teraz kopi¹ z³oto, bo tak kaza³ im Bloodwyn.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//A kopacze maj¹ wolne. Odpoczywaj¹cy kopacze nie wró¿¹ dobrze moim interesom.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty handluje ró¿nymi towarami.");
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
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Kontroluje kopalniê, ale rzadko do niej zagl¹da. Wiêkszoœæ czasu spêdza z Krukiem w œwi¹tyni.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Co dok³adnie oznacza "rzadko"?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//Ostatnio widzia³em go, gdy wychodzi³ z krypty...
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//Nie, czekaj! To chyba by³o wtedy, gdy wys³a³ niewolników, aby wydobywali z³oto.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//Bardzo je lubi... inaczej ni¿ Kruk.
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
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//To przeklêta krypta! Jej stra¿nicy zabili wielu ludzi!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Stra¿nicy? Mówisz o tych kamiennych stworach? O p³askich twarzach i okr¹g³ych g³owach?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//Tak! Ze ska³ wysz³y ich ca³e tuziny!
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Od pocz¹tku wiedzia³em, ¿e otwieranie krypty to nie jest dobry pomys³.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Kruk mia³ obsesjê na punkcie tych wykopalisk. Gdy tylko krypta zosta³a ods³oniêta, on i jego stra¿nicy weszli do œrodka.
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
	description = "Dlaczego Kruk tak chcia³ wejœæ do tej krypty?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Dlaczego Kruk tak chcia³ wejœæ do tej krypty?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//Hmm. Jesteœ doœæ wœcibski. Przypominasz mi goœcia, którego kiedyœ zna³em.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//By³ równie wœcibski. A pewnego dnia sprowadzi³o to na niego zgubê.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Przestañ be³kotaæ. Co siê sta³o w krypcie?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//No có¿... Ee, zasch³o mi w ustach. Napi³bym siê czegoœ.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Hej, Scatt, NIE TERAZ. To wa¿ne. Co Kruk robi³ na dole?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//Dobrze... On... przywo³a³ coœ, u¿ywaj¹c s³ów jakiegoœ dziwnego jêzyka.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Ze œrodka krypty przesi¹ka³o lœni¹ce œwiat³o, potem us³ysza³em krzyk. Wstrz¹saj¹cy, demoniczny wrzask.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//Co sta³o siê potem?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//To wszystko, co widzia³em. Z krypty wyszed³ Bloodwyn i kaza³ mi siê wynosiæ. Tak zreszt¹ zrobi³em.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Krótko potem Kruk i jego ludzie opuœcili œwi¹tyniê. Od tamtej pory nie by³o go tu na dole.
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
	description = "Napijesz siê czegoœ?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Napijesz siê czegoœ?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Napi³bym siê piwa. Trudno je dostaæ w tym obozie.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Mo¿e Lucia ma jeszcze gdzieœ butelkê.
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
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Och, ale dobre. Dziêki, jesteœ moim bohaterem.
	
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
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Bierzesz kilof i walisz w kawa³ z³ota... Ka¿dy to potrafi.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Jeœli jednak bêdziesz tak robiæ, z³oto rozpadnie siê na drobne bry³ki. Dlatego w³aœnie kopaæ powinni ludzie z doœwiadczeniem.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Je¿eli masz trochê doœwiadczenia, to mogê ci powiedzieæ jeszcze parê rzeczy.

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
	description = "Naucz siê wydobywania z³ota. (Koszt: 2 PN/10 procent)";
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
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Powiedz mi coœ o kopaniu z³ota.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Musisz pamiêtaæ, ¿e z³oto nie przypomina rudy. Jest miêkkie jak mas³o. Jak uderzysz zbyt mocno, rozpadnie siê na drobne kawa³eczki.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Ka¿dy z kopaczy zna sztuczki, dziêki którym wydobywa ze ska³y ³adne bry³ki.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//To w³aœnie pomaga rozró¿niæ dobrego kopacza od z³ego.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//No i praktyka te¿ robi swoje. Jak trochê popracujesz, bêdzie ci sz³o lepiej.
		
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
	description = "Bloodwyn nie ¿yje.";
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
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn nie ¿yje.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hmm, taka wiadomoœæ nie powinna mnie ucieszyæ. Ale Bloodwyn jest kolesiem, którego wolê widzieæ martwym.
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


