//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "Co tady děláš?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Co tu chceš?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Hledáš něco?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Byliny - hledám byliny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Obvykle hledám byliny.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Tady většinou rostou samý užitečný věci.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Většina zdejších rostlin je léčivá a dá se kouřit jako cigára z trávy z bažin.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Tehdá za bariérou jsem pracoval jako alchymista.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "Proč tě hodili za bariéru?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//Proč tě vlastně shodili za bariéru?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Moc jsem si zahrával s lektvary, který pozměňovaly mysl.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Jednou večer si můj mistr Ignaz omylem spletl můj 'experiment' s vínem.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//Byl potom načas tak nějak, ehm, nevypočitatelný. A i pak byl z toho všeho tak nějak popletený.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(hořce) Mágové mě za to hodili za bariéru. Říkali tomu 'bádání v zakázané oblasti'.
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "Co mi můžeš říci o táboře?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Co bys mi řekl o táboře?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Nic moc. Nikdy jsem tam sám nebyl.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Od začátku tam byli jenom Havranovi lidi. Všichni ostatní přišli později, včetně mě, a museli čekat, až budou potřebovat nový lidi.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "Odkud jsi přišel?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Odkud jsi přišel?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //No, nejspíš tam odtud co ty. S piráty po moři.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Tohle údolí je komplet odříznutý, není tu žádný spojení na pevninu.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(zamyšleně) Pravda.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "Kdy budou potřebovat nové lidi?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //A kdy budou potřebovat nové lidi?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //No, až jim bude někdo scházet.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Když někoho z kopáčů sežere důlní červ, jdou za náma, aby ho někdo nahradil.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //Občas se taky zabíjejí mezi sebou, ale poslední dobou už je to lepší.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Havran nějak ovládá přístup do dolu, takže se tam hned tak někdo nedostane.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Ale nevím přesně, jak to funguje, nikdy jsem tam nebyl.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "Co se týče Fortuna...";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno je pěkně zmatený a hodil by se mu nějaký lektvar na osvěžení paměti.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? Ten snad slouží Havranovi, ne?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Sloužíval, ale teď je z něj troska. A může za to Havran.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Havran? Doteďka jsem o něm měl vysoký mínění. No dobře, ale tady v bažinách nenamíchám nic.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Můžu si ten lektvar namíchat sám, v táboře je alchymistická kolona. Stačí mi jenom recept.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//S tím receptem opatrně, příprava tohohle lektvaru je nebezpečná.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Pokud něco zkazíš nebo tam nedáš správné ingredience, může ti z toho vyjít zabijácký dryák.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Dám si pozor.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel mi dal recept na nějaký lektvar, který by měl oživit Fortunovu paměť. Ale mohu jej namíchat, pouze až budu znát všechny přísady, jinak by to mohlo mít smrtonosné následky.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "Můžeš mě něčemu naučit?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//Můžeš mě něco naučit?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//Není čas. Jsem tu, abych získal zlato, a dokud se nedostanu do tábora, musím si na živobytí vydělávat prodejem bylin.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Ale kdybys potřeboval lektvary, nějaký tady mám.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"U Miguela mohu nakupovat lektvary a byliny.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



