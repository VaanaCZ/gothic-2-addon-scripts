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
	description = "Co tady dÏl·ö?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//Co tu chceö?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//Hled·ö nÏco?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Byliny - hled·m byliny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Obvykle hled·m byliny.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Tady vÏtöinou rostou sam˝ uûiteËn˝ vÏci.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//VÏtöina zdejöÌch rostlin je lÈËiv· a d· se kou¯it jako cig·ra z tr·vy z baûin.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Tehd· za bariÈrou jsem pracoval jako alchymista.
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
	description = "ProË tÏ hodili za bariÈru?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//ProË tÏ vlastnÏ shodili za bariÈru?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Moc jsem si zahr·val s lektvary, kter˝ pozmÏÚovaly mysl.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Jednou veËer si m˘j mistr Ignaz omylem spletl m˘j 'experiment' s vÌnem.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//Byl potom naËas tak nÏjak, ehm, nevypoËitateln˝. A i pak byl z toho vöeho tak nÏjak popleten˝.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(ho¯ce) M·govÈ mÏ za to hodili za bariÈru. ÿÌkali tomu 'b·d·nÌ v zak·zanÈ oblasti'.
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
	description = "Co mi m˘ûeö ¯Ìci o t·bo¯e?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //Co bys mi ¯ekl o t·bo¯e?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //Nic moc. Nikdy jsem tam s·m nebyl.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Od zaË·tku tam byli jenom Havranovi lidi. Vöichni ostatnÌ p¯iöli pozdÏji, vËetnÏ mÏ, a museli Ëekat, aû budou pot¯ebovat nov˝ lidi.
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
	description = "Odkud jsi p¯iöel?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //Odkud jsi p¯iöel?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //No, nejspÌö tam odtud co ty. S pir·ty po mo¯i.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Tohle ˙dolÌ je komplet od¯Ìznut˝, nenÌ tu û·dn˝ spojenÌ na pevninu.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(zamyölenÏ) Pravda.
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
	description = "Kdy budou pot¯ebovat novÈ lidi?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //A kdy budou pot¯ebovat novÈ lidi?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //No, aû jim bude nÏkdo sch·zet.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Kdyû nÏkoho z kop·Ë˘ seûere d˘lnÌ Ëerv, jdou za n·ma, aby ho nÏkdo nahradil.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //ObËas se taky zabÌjejÌ mezi sebou, ale poslednÌ dobou uû je to lepöÌ.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Havran nÏjak ovl·d· p¯Ìstup do dolu, takûe se tam hned tak nÏkdo nedostane.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Ale nevÌm p¯esnÏ, jak to funguje, nikdy jsem tam nebyl.
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
	description = "Co se t˝Ëe Fortuna...";
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
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno je pÏknÏ zmaten˝ a hodil by se mu nÏjak˝ lektvar na osvÏûenÌ pamÏti.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//Fortuno? Ten snad slouûÌ Havranovi, ne?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//SlouûÌval, ale teÔ je z nÏj troska. A m˘ûe za to Havran.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//Havran? DoteÔka jsem o nÏm mÏl vysok˝ mÌnÏnÌ. No dob¯e, ale tady v baûin·ch nenamÌch·m nic.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//M˘ûu si ten lektvar namÌchat s·m, v t·bo¯e je alchymistick· kolona. StaËÌ mi jenom recept.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//S tÌm receptem opatrnÏ, p¯Ìprava tohohle lektvaru je nebezpeËn·.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Pokud nÏco zkazÌö nebo tam ned·ö spr·vnÈ ingredience, m˘ûe ti z toho vyjÌt zabij·ck˝ dry·k.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//D·m si pozor.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel mi dal recept na nÏjak˝ lektvar, kter˝ by mÏl oûivit Fortunovu pamÏù. Ale mohu jej namÌchat, pouze aû budu zn·t vöechny p¯Ìsady, jinak by to mohlo mÌt smrtonosnÈ n·sledky.");
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
	description = "M˘ûeö mÏ nÏËemu nauËit?";
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
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//M˘ûeö mÏ nÏco nauËit?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//NenÌ Ëas. Jsem tu, abych zÌskal zlato, a dokud se nedostanu do t·bora, musÌm si na ûivobytÌ vydÏl·vat prodejem bylin.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Ale kdybys pot¯eboval lektvary, nÏjak˝ tady m·m.
	
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



