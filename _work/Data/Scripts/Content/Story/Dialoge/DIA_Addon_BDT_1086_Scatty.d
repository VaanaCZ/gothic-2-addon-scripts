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
	description = "Jak ci id� interesy?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Jak ci id� interesy?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Od otwarcia krypty coraz gorzej....
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Kruk nie potrzebuje ju� niewolnik�w. Teraz kopi� z�oto, bo tak kaza� im Bloodwyn.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//A kopacze maj� wolne. Odpoczywaj�cy kopacze nie wr� dobrze moim interesom.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty handluje r�nymi towarami.");
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
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Kontroluje kopalni�, ale rzadko do niej zagl�da. Wi�kszo�� czasu sp�dza z Krukiem w �wi�tyni.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Co dok�adnie oznacza "rzadko"?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//Ostatnio widzia�em go, gdy wychodzi� z krypty...
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//Nie, czekaj! To chyba by�o wtedy, gdy wys�a� niewolnik�w, aby wydobywali z�oto.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//Bardzo je lubi... inaczej ni� Kruk.
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
	description = "O jakiej krypcie m�wisz?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//O jakiej krypcie m�wisz?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//To przekl�ta krypta! Jej stra�nicy zabili wielu ludzi!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Stra�nicy? M�wisz o tych kamiennych stworach? O p�askich twarzach i okr�g�ych g�owach?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//Tak! Ze ska� wysz�y ich ca�e tuziny!
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Od pocz�tku wiedzia�em, �e otwieranie krypty to nie jest dobry pomys�.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Kruk mia� obsesj� na punkcie tych wykopalisk. Gdy tylko krypta zosta�a ods�oni�ta, on i jego stra�nicy weszli do �rodka.
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
	description = "Dlaczego Kruk tak chcia� wej�� do tej krypty?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Dlaczego Kruk tak chcia� wej�� do tej krypty?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//Hmm. Jeste� do�� w�cibski. Przypominasz mi go�cia, kt�rego kiedy� zna�em.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//By� r�wnie w�cibski. A pewnego dnia sprowadzi�o to na niego zgub�.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Przesta� be�kota�. Co si� sta�o w krypcie?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//No c�... Ee, zasch�o mi w ustach. Napi�bym si� czego�.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Hej, Scatt, NIE TERAZ. To wa�ne. Co Kruk robi� na dole?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//Dobrze... On... przywo�a� co�, u�ywaj�c s��w jakiego� dziwnego j�zyka.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Ze �rodka krypty przesi�ka�o l�ni�ce �wiat�o, potem us�ysza�em krzyk. Wstrz�saj�cy, demoniczny wrzask.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//Co sta�o si� potem?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//To wszystko, co widzia�em. Z krypty wyszed� Bloodwyn i kaza� mi si� wynosi�. Tak zreszt� zrobi�em.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Kr�tko potem Kruk i jego ludzie opu�cili �wi�tyni�. Od tamtej pory nie by�o go tu na dole.
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
	description = "Napijesz si� czego�?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Napijesz si� czego�?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Napi�bym si� piwa. Trudno je dosta� w tym obozie.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Mo�e Lucia ma jeszcze gdzie� butelk�.
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
	description = "Zdr�wko! (Daj piwo)";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Zdr�wko!
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Och, ale dobre. Dzi�ki, jeste� moim bohaterem.
	
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
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Bierzesz kilof i walisz w kawa� z�ota... Ka�dy to potrafi.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Je�li jednak b�dziesz tak robi�, z�oto rozpadnie si� na drobne bry�ki. Dlatego w�a�nie kopa� powinni ludzie z do�wiadczeniem.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Je�eli masz troch� do�wiadczenia, to mog� ci powiedzie� jeszcze par� rzeczy.

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
	description = "Naucz si� wydobywania z�ota. (Koszt: 2 PN/10 procent)";
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
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Powiedz mi co� o kopaniu z�ota.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Musisz pami�ta�, �e z�oto nie przypomina rudy. Jest mi�kkie jak mas�o. Jak uderzysz zbyt mocno, rozpadnie si� na drobne kawa�eczki.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Ka�dy z kopaczy zna sztuczki, dzi�ki kt�rym wydobywa ze ska�y �adne bry�ki.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//To w�a�nie pomaga rozr�ni� dobrego kopacza od z�ego.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//No i praktyka te� robi swoje. Jak troch� popracujesz, b�dzie ci sz�o lepiej.
		
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
	description = "Bloodwyn nie �yje.";
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
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn nie �yje.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hmm, taka wiadomo�� nie powinna mnie ucieszy�. Ale Bloodwyn jest kolesiem, kt�rego wol� widzie� martwym.
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


