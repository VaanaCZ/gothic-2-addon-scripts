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
	description = "Jak jdou obchody?";
};
FUNC INT DIA_Addon_Scatty_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Scatty_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Scatty_Hi_15_00");//Jak jdou kšefty?
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_01");//Od tý doby, co se otevřela ta hrobka, se nikdo po zboží moc neshání.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_02");//Havran už nemá pro otroky využití, proto teď dolují zlato. Na Bloodwynův rozkaz.
	AI_Output (self, other, "DIA_Addon_Scatty_Hi_01_03");//A kopáči si z toho nic nedělaj. (mumlá) Bezstarostný kopáči nejsou dobrý pro obchod.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Scatty prodává různé zboží.");
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
	description = "Bloodwyn? On to tady vede?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_00");//Bloodwyn? On to tu vede?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_01");//Dohlíží na důl, ale sem dolů skoro nikdy nechodí. Většinou bývá v chrámu s Havranem.
	AI_Output (other, self, "DIA_Addon_Scatty_last_15_02");//Co přesně myslíš tím "skoro nikdy"?
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_03");//Naposledy jsem ho viděl, když vyšel z hrobky.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_04");//(rychle) ...ne, vlastně počkej! Naposledy tu byl, když poslal otroky dolovat zlato.
	AI_Output (self, other, "DIA_Addon_Scatty_last_01_05");//Na rozdíl od Havrana ho totiž zlato nesmírně zajímá.
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
	description = "Co je to za hrobku?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_00");//Z jaké hrobky?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_01");//Z prokletý hrobky! Její strážci zabili spoustu lidí!
	AI_Output (other, self, "DIA_Addon_Scatty_Gruft_15_02");//Strážci? To mluvíš o těch kamenných obludách? Celkem placatí, s kulatou hlavou?
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_03");//Jo, to je přesně ono! Vynořovali se z kamene po tuctech.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_04");//Už od začátku jsem věděl, že jsme tu hrobku měli nechat na pokoji.
	AI_Output (self, other, "DIA_Addon_Scatty_Gruft_01_05");//Jenže Havran byl tím kopáním přímo posedlej. A když jsme hrobku konečně odkryli, napochodoval tam i se svejma strážema.
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
	description = "A co chtěl Havran v hrobce?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_00");//Co Havran v té hrobce chtěl?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_01");//(zarazí se) Hmm, seš pěkně zvědavej. Připomínáš mi jednoho chlápka, kterýho jsem kdysi znával.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_02");//Ten byl taky tak zvědavej. Až ho to nakonec zničilo.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_03");//Mluv k věci, co se stalo v té hrobce?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_04");//No, ehm... mám děsně vyschlo v hubě...
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_05");//Hele, Scatty, TEĎ NE. Tohle je důležitý! Co tam Havran chtěl?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_06");//No dobře. (zhluboka se nadechne) On... něco... něco vyvolal. Pořád přitom hulákal ňákou cizí řečí.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_07");//Najednou hrobku osvítilo jasný světlo a pak jsem slyšel výkřik, kterej byl jak rána do hlavy - démonickej výkřik.
	AI_Output (other, self, "DIA_Addon_Scatty_GruftAgain_15_08");//A pak?
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_09");//Víc už nevím. Pak z tý hrobky vylez Bloodwyn a řek mi, abych vypadnul. A to jsem taky udělal.
	AI_Output (self, other, "DIA_Addon_Scatty_GruftAgain_01_10");//Netrvalo douho a Havran i jeho chlapi zmizeli zpátky v chrámu. Od tý doby už Havrana nikdo neviděl.
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
	description = "Nedal by sis něco k pití?";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Trinken_15_00");//Dal by sis něco k pití?
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_01");//Pivo by bodlo, ale tady v táboře asi těžko ňáký bude.
	AI_Output (self, other, "DIA_Addon_Scatty_Trinken_01_02");//Možná že Lucia ještě nějaký korblík má.
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
	description = "Na zdraví. (předat pivo)";
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
	AI_Output (other, self, "DIA_Addon_Scatty_Bier_15_00");//Tady máš.
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		AI_UseItem (self, ItFo_Beer);
	};
	AI_Output (self, other, "DIA_Addon_Scatty_Bier_01_01");//Mmm, to je dobrý. Díky, seš můj hrdina.
	
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
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_00");//Vzít krumpáč a rubat zlato, to umí každej.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_01");//Ale spousta nuggetů se tímhle způsobem rozbije. A proto by to měli dělat jenom ti, kteří dolování trochu rozuměj.
	AI_Output (self, other, "DIA_Addon_Scatty_Gold_01_02");//Až budeš trochu zkušenější, můžu tě naučit víc.

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
	description = "Naučit se dolovat zlato (Cena: 2 VB/10 procent)";
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
	AI_Output (other, self, "DIA_Addon_Scatty_teach_15_00");//Pověz mi něco víc o dolování zlata.
	
	if (other.lp >= 1)  
	{
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_01");//Především bys měl vědět, že zlato není ruda. Je měkký jako máslo. Když udeříš moc tvrdě, všecko se rozsype.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_02");//Každej kopáč má vlastní triky, jak z kamene dostat co největší zlatý valouny.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_03");//Tyhle triky koneckonců dělaj rozdíl mezi obyčejným kopáčem a dobrým kopáčem.
		AI_Output (self, other, "DIA_Addon_Scatty_teach_01_04");//A hlavně platí, že učení dělá mistra. Jedině když budeš nějakou chvíli kopat, půjde ti to líp.
		
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
	description = "Bloodwyn je mrtvý.";
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
	AI_Output (other, self, "DIA_Addon_Scatty_tot_15_00");//Bloodwyn je mrtvej.
	AI_Output (self, other, "DIA_Addon_Scatty_tot_01_01");//Hm, moc lidem bych to nepřál, ale Bloodwyn je lepší mrtvej..
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


