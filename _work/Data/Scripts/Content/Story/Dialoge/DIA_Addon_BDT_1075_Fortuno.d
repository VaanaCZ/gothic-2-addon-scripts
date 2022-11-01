///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fortuno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1075_Addon_Fortuno;
	nr			= 900;
	condition	= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information	= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen (10, 25);
};
 
FUNC VOID DIA_Addon_Fortuno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
	
func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Hi   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_Hi_Condition;
	information = DIA_Addon_Fortuno_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fortuno_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_00");//(nervóznę) Temný mrak kolem domu... už se blíží...
		AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_01");//Krev... jen ta ho vyvolá... ON mę vidí... on mę vidí... ach ne, bęž pryč, ztraă se...
		AI_Output (other, self, "DIA_Addon_Fortuno_Hi_15_02");//Jsi v poâádku?
		Fortuno_Einmal = TRUE;
		
		Log_CreateTopic (Topic_Addon_Fortuno,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_RUNNING);
		
		B_LogEntry (Topic_Addon_Fortuno,"Fortuno se úplnę pomátl. Hledá nęjakého 'zeleného novice'.");
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_13_03");//Zelený... zelený novic... nemůžu ho najít.
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Ještę se vrátím. (KONEC)",DIA_Addon_Fortuno_Hi_BACK);	
	
	Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Můžu ti nęjak pomoci?",DIA_Addon_Fortuno_Hi_HILFE);
	
	if Npc_HasItems (other, ItMi_Joint ) >= 1
	{
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Tumáš trochu trávy z bažin.",DIA_Addon_Fortuno_Hi_JOINT);
	};
	if Npc_HasItems (other, ItMi_Addon_Joint_01 ) >= 1
	{ 
		Info_AddChoice 	  (DIA_Addon_Fortuno_Hi,"Tumáš, vezmi si tohohle 'zeleného novice'.",DIA_Addon_Fortuno_Hi_GREEN);
	};
};
FUNC VOID DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00");//Můžu ti nęjak pomoci?
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01");//Zelený... zelený novic pomůže novici...
};
FUNC VOID DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00");//Tumáš, dej si tuhle trávu z bažin.
	
	if B_GiveInvItems (other, self,ItMi_Joint,1)
	{
		AI_UseItem (self, ItMI_Joint);
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01");//Není zelená, není silná, není zelená, není silná...
};
FUNC VOID DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00");//Tumáš, dej si tady tohohle 'zeleného novice'.
	
	if B_GiveInvItems (other, self,ItMi_Addon_Joint_01,1)
	{
		AI_UseItem (self, ItMI_Addon_Joint_01);
		
	};
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01");//(probírá se) Aáááááá!
	AI_Output (self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02");//Moje hlava... kdo... jsem... jsem Fortuno... co... co je?
	
	Info_ClearChoices (DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;
	
	B_GivePlayerXP (XP_Addon_Fortuno_01);
	
	B_LogEntry (Topic_Addon_Fortuno,"'Zelený novic' pomohl Fortunovi vyčistit hlavu.");
};


///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_wer   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_wer_Condition;
	information = DIA_Addon_Fortuno_wer_Info;
	permanent   = FALSE;
	description	= "Tak mi âekni, co ti je.";
};
FUNC INT DIA_Addon_Fortuno_wer_Condition()
{	
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_wer_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_00");//No tak mi povęz, co je s tebou.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_01");//Kdysi jsem patâil k bratrstvu Spáče. Všecko bylo tehdá fajn.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_02");//Ano, byli jsme bývalí zločinci, ale jako novici jsme nemęli žádný starosti.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_03");//Hele, já byl v Hornickým údolí zavâenej taky, takže mi radši povęz nęco novýho.
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_04");//Já... já si nic nepamatuju. Temnota mi zastâela mysl...
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_05");//No tak, soustâeë se, co se stalo? Kdy ses probral?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_06");//Havran... pamatuju si jenom Havrana a... a nęjaké temné místnosti.
	AI_Output (other, self, "DIA_Addon_Fortuno_wer_15_07");//Co je s Havranem? Co ti udęlal?
	AI_Output (self, other, "DIA_Addon_Fortuno_wer_13_08");//(povzdech) Je mi líto. Moje mysl jako by poâád byla ještę ve vęzení... sám to nechápu...
};
///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_FREE   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 5;
	condition   = DIA_Addon_Fortuno_FREE_Condition;
	information = DIA_Addon_Fortuno_FREE_Info;
	permanent   = FALSE;
	description	= "Nęjak si tu pamęă pâece musíš osvęžit.";
};
FUNC INT DIA_Addon_Fortuno_FREE_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_wer)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_00");//Musí být pâece nęjaký způsob, jak ti osvęžit pamęă.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_01");//Jo... jo, možná to nęjak půjde.
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_02");//Guru znali různé způsoby, jak pozmęnit ducha a vůli.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_03");//A PAMATUJEŠ si z toho nęco?
	AI_Output (self, other, "DIA_Addon_Fortuno_FREE_13_04");//Ne, obávám se, že tyhle vędomosti zmizely spolu s guru.
	AI_Output (other, self, "DIA_Addon_Fortuno_FREE_15_05");//A sakra. No, jestli existuje nęjaký způsob, jak osvobodit ducha, tak ho najdu.

	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc (Bloodfly,"ADW_PATH_TO_LOCH_01");
	
	B_LogEntry (Topic_Addon_Fortuno,"Fortuno už je sice pâi smyslech, ale zase si nic nepamatuje.");
};
///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Herb   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 99;
	condition   = DIA_Addon_Fortuno_Herb_Condition;
	information = DIA_Addon_Fortuno_Herb_Info;
	permanent   = FALSE;
	description	= "Potâebuješ ještę další trávu z bažin?";
};
FUNC INT DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Herb_15_00");//Nepotâebuješ ještę nęjakou trávu z bažin?
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_01");//Joooo, určitę. Koupím všecku trávu, která se ti dostane do rukou.
	AI_Output (self, other, "DIA_Addon_Fortuno_Herb_13_02");//A zaplatím ti za ni víc než Fisk.
};
FUNC VOID B_Fortuno_InfoManager()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
	Info_AddChoice (DIA_Addon_Fortuno_Trade,DIALOG_BACK,DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(dát mu všecku trávu z bažin)",DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice (DIA_Addon_Fortuno_Trade,"(dát mu 1 ubalenou trávu z bažin)",DIA_Addon_Fortuno_Trade_1);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trade   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 100;
	condition   = DIA_Addon_Fortuno_Trade_Condition;
	information = DIA_Addon_Fortuno_Trade_Info;
	permanent   = TRUE;
	description	= "Mám tu pro tebe trávu z bažin.";
};
FUNC INT DIA_Addon_Fortuno_Trade_Condition()
{	
	if (Npc_HasItems (other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo (other, DIA_Addon_Fortuno_Herb)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trade_15_00");//Mám pro tebe nęjakou trávu z bažin.
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices (DIA_Addon_Fortuno_Trade);
};
FUNC VOID DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems (other, Itpl_Swampherb);
	
	if B_GiveInvItems (other, self, ITPL_Swampherb, amount)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, amount * Value_SwampHerb);
	
	B_GivePlayerXP (amount * 10);
	B_Fortuno_InfoManager();
};
FUNC VOID DIA_Addon_Fortuno_Trade_1()
{
	if B_GiveInvItems (other, self, ITPL_Swampherb, 1)
	{
		Npc_RemoveInvItems (self, ITPL_Swampherb, Npc_HasItems (self, ITPL_Swampherb));
	};
	
	B_GiveInvItems (self, other, ItMi_Gold, Value_SwampHerb);
	
	B_GivePlayerXP (10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_Trank   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 3;
	condition   = DIA_Addon_Fortuno_Trank_Condition;
	information = DIA_Addon_Fortuno_Trank_Info;
	permanent   = FALSE;
	description	= "Mám tu pro tebe lektvar.";
};
FUNC INT DIA_Addon_Fortuno_Trank_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	&&   Npc_KnowsInfo(other,DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems (other, ItPo_Addon_Geist_01) >= 1)
	||  (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_Trank_15_00");//Mám pro tebe jistý lektvar. Pomůže ti oživit vzpomínky.
	AI_Output (self, other, "DIA_Addon_Fortuno_Trank_13_01");//Vęâím ti.
	
	if (Npc_HasItems (other, ItPo_Addon_Geist_02) >= 1)//der richtige
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_02,1)
		{
			AI_UseItem (self, ItPo_Addon_Geist_02);
		};
		B_GivePlayerXP (XP_Addon_Fortuno_02);
		
	}
	else
	{
		if B_GiveInvItems (other, self, ItPo_Addon_Geist_01,1)//der...äh...tödliche
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
			AI_StopProcessInfos (self);
			AI_UseItem (self, ItPo_Addon_Geist_01);
		};
	};
};
///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_more   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 2;
	condition   = DIA_Addon_Fortuno_more_Condition;
	information = DIA_Addon_Fortuno_more_Info;
	permanent   = FALSE;
	description	= "A dál?";
};
FUNC INT DIA_Addon_Fortuno_more_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_more_Info()
{
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_00");//No a?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_01");//Aáá! Už si vzpomínám! Teë už to vidím – Adane, stůj pâi mnę – co jsem to udęlal?!
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_02");//Tak co jsi udęlal? A hlavnę co udęlal Havran?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_03");//Pomoh jsem mu. Pomoh jsem mu navázat kontakt. S NÍM. Chtęl nęjaké elixíry a já je pro nęj namíchal.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_04");//Pokusil se otevâít portál a dostat se do chrámu.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_05");//Proč? Co v tom chrámu chtęl?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_06");//Mocný artefakt. Je pohâbený i s tím, kdo ho kdysi nosil. S mocným válečníkem, co se pâidal k NĘMU.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_07");//A pak?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_08");//Nemohli jsme otevâít portál.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_09");//Jenže Havran vędęl JISTĘ, že to půjde, když vykope knęzovu hrobku.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_10");//A proto sem taky pâivedl všechny ty otroky. Obęti, který mohl pâimęt, aby kopaly tam, kde i sám čas odpočívá v pokoji.
	AI_Output (other, self, "DIA_Addon_Fortuno_more_15_11");//Knęzovu hrobku?
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_12");//Místo posledního odpočinku Adanova knęze. Leží v dole.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_13");//Taky si vzpomínám na kamenný tabulky. Vęâil, že mu ukážou cestu.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_14");//A když je konečnę rozluštil, už mę nepotâeboval.
	AI_Output (self, other, "DIA_Addon_Fortuno_more_13_15");//Seslal na mę kouzlo zapomnęní a... a pak jsi mę vysvobodil až ty.
	
	SC_KnowsFortunoInfos = TRUE;
	
	B_LogEntry (TOPIC_Addon_RavenKDW,"Havran chce z Adanova chrámu získat nęjaký mocný artefakt."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Havran v dole z jakéhosi důvodu vykopal hrob nęjakého dávného knęze."); 
	Log_AddEntry (TOPIC_Addon_RavenKDW,"Havran vęâí, že mu v jeho snažení pomohou nęjaké kamenné tabulky."); 
	
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Addon_Fortuno_03);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fortuno_Attentat   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 9;
	condition   = DIA_Addon_Fortuno_Attentat_Condition;
	information = DIA_Addon_Fortuno_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fortuno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&&  Npc_KnowsInfo (other,DIA_Addon_Fortuno_Trank)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fortuno_Attentat_13_00");//Útok? Promiŕ, byl jsem na chvíli... tak nęjak mimo. Nevím o tom vůbec nic.
};

