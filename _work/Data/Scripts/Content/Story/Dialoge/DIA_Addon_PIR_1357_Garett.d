// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Garett_EXIT(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 999;
	condition	= DIA_Addon_Garett_EXIT_Condition;
	information	= DIA_Addon_Garett_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Garett_PICKPOCKET (C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 900;
	condition	= DIA_Addon_Garett_PICKPOCKET_Condition;
	information	= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen (36, 55);
};
 
FUNC VOID DIA_Addon_Garett_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
	
func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Garett_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
INSTANCE DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Anheuern_Condition;
	information	= DIA_Addon_Garett_Anheuern_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Anheuern_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Anheuern_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Ať tě ani nenapadne, že by ses chtěl přidat k našemu oddílu.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Co si myslíš, že budou ostatní dělat, až budu pryč, co?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Až se vrátím, nezbude v mý chajdě ani jediná bedna!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Takže tu radši zůstanu a budu hlídat naše zásoby.
};

// ************************************************************
// 	 				   Hello 
// ************************************************************
INSTANCE DIA_Addon_Garett_Hello(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 1;
	condition	= DIA_Addon_Garett_Hello_Condition;
	information	= DIA_Addon_Garett_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Garett_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Hello_Info()
{	
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //A hele, kohopak to tu máme? Někdo novej, a doufám, že nepatří k těm zatrolenejm banditům.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Jsem Garett. Když budeš něco potřebovat, jsem ten pravej.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Mám na skladě skoro všecko – víno, zbraně a spoustu dalších věcí, který by se ti mohly hodit.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Kromě kořalky – pro pití musíš zajít za Samuelem.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
	
};

// ************************************************************
// 	 				  		Samuel 
// ************************************************************
INSTANCE DIA_Addon_Garett_Samuel(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 2;
	condition	= DIA_Addon_Garett_Samuel_Condition;
	information	= DIA_Addon_Garett_Samuel_Info;
	permanent	= FALSE;
	description = "Kdo je Samuel?";
};                       
FUNC INT DIA_Addon_Garett_Samuel_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Garett_Samuel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Kdo je Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //Náš palič. Žije v jeskyni na pláži, kousek dál od tábora.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Nemůžeš to minout – stačí jít na sever.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Hlavně by ses měl zásobit kořalkou.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Jsou tu lidi, co si moc nepotrpí na zelenáče, abych tak řek.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //Pořádnej doušek kořalky dokáže zázraky!

	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
INSTANCE DIA_Addon_Garett_Warez(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Warez_Condition;
	information	= DIA_Addon_Garett_Warez_Info;

	description = "Odkud bereš zásoby?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Kde jsi své zásoby získal?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Když Skip jede do Khorinidu, vždycky přiveze hromadu zásob.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Donedávna část prodával přímo banditům.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Ale od tý doby, co s nima válčíme, chodí všecko zboží mně.
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
INSTANCE DIA_Addon_Garett_Bandits(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 3;
	condition	= DIA_Addon_Garett_Bandits_Condition;
	information	= DIA_Addon_Garett_Bandits_Info;

	description = "Co víš o banditech?";
};                       
FUNC INT DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Garett_Bandits_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Co víš o banditech?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Na to se radši zeptej Skipa.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Ten s tou bandou strávil spoustu času, to ti povím.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg nám nakázal, abysme oddělali každýho banditu, kterej se ukáže poblíž tábora.
};



// ************************************************************
// ***														***
// 						Greg + Kompass
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg 
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Greg(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 4;
	condition	= DIA_Addon_Garett_Greg_Condition;
	information	= DIA_Addon_Garett_Greg_Info;
	permanent	= FALSE;
	description = "Jaký je ten tvůj kapitán Greg?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //Jaký je ten váš kapitán Greg?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Je to ošlehanej mořskej vlk, vo tom není pochyb.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //A taky hrabivost sama.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Nutí svýho pokladníka Francise vybírat tolik, že ještě pár grošů navíc a měl by na krku vzpouru.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //A když někdo z nás narazí na něco FAKT cennýho, nekompromisně si to zabaví pro sebe.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Jednou jsem na jedný královský fregatě čmajznul kompas.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //A ten šmejd Greg mě pochopitelně donutil, abych mu ho dal.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Pche! Nejspíš ho někde zakopal, i se svejma ostatníma pokladama.
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_Tips(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 5;
	condition	= DIA_Addon_Garett_Tips_Condition;
	information	= DIA_Addon_Garett_Tips_Info;

	description = "Kde mohl Greg zakopat ten kompas?";
};                       
FUNC INT DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Tips_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Kam Greg mohl ten kompas zakopat?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Jednou mi vyprávěl, že můj kompas hlídá samotná smrt. A pak sa smál.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Ještě něco?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Na jižním pobřeží je pláž, kam se dá dostat jedině z moře.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Greg tam prý často pobývá. Možná tam něco najdeš.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Jednou jsem se tam šel mrknout, jako že bych třeba něco našel sám. Jenže se to tem hemží všelijakejma potvorama.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Jestli to chceš vážně zkusit, nezapomeň si vzít krumpáč.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg ukradl Garretovi vzácný kompas a zakopal ho kdesi na jižní pláži.");
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
INSTANCE DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 6;
	condition	= DIA_Addon_Garett_GiveKompass_Condition;
	information	= DIA_Addon_Garett_GiveKompass_Info;
	permanent	= FALSE;
	description = "Tady máš ten kompas.";
};                       
FUNC INT DIA_Addon_Garett_GiveKompass_Condition()
{
	if (Npc_HasItems (other,ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Addon_Garett_GiveKompass_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Tady máš ten svůj kompas.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //(šťastně) Jo, to je on! Už jsem nedoufal, že ho znova uvidím.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Díky, chlape!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Tentokrát už ho Greg nedostane!
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Tumáš, vem si na oplátku tenhle opasek. Je to nejcennější, co mám.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Tenhle pásek si ode mě koupil, pamatuješ?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //A zaplatils za něj spoustu peněz – (rychle) víc, než za kolik stál. Tak si vem aspoň zpátky svý zlato.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret měl velkou radost, že jsem mu vrátil kompas.");
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP (XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis 
// ************************************************************
INSTANCE DIA_Addon_Garett_Francis(C_INFO)
{
	npc			= PIR_1357_Addon_Garett;
	nr			= 7;
	condition	= DIA_Addon_Garett_Francis_Condition;
	information	= DIA_Addon_Garett_Francis_Info;
	permanent	= FALSE;
	description = "Co bys mi řekl o Francisovi?";
};                       
FUNC INT DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Addon_Garett_Francis_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Co bys mi řekl o Francisovi?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg mu předal velení, dokud bude pryč.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Ale Francis je jako velitel totálně neschopnej!
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Nedonutí ani Morgana, aby zvednul ten svůj línej zadek z postele.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Henry a jeho chlapi jsou jediní, kteří tu něco dělaj.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Ostatní se místo makání jen válej.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Můžu jen doufat, že se Greg brzo vrátí.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //A všecky je pořádně nakope do prdele.
	};
};

// ************************************************************
// 								PERM
// ************************************************************
INSTANCE DIA_Addon_Garett_PERM   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 99;
	condition   = DIA_Addon_Garett_PERM_Condition;
	information = DIA_Addon_Garett_PERM_Info;
	permanent   = TRUE;
	description = "Něco nového?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Copak je nového?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Od Gregova odchodu se tu nic moc nedělo.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Když se teď Greg vrátil, všecko už zase začíná jít tak, jak má.
	};
};

// ************************************************************
// 								Trade
// ************************************************************
INSTANCE DIA_Addon_Garett_Trade   (C_INFO)
{
	npc         = PIR_1357_Addon_Garett;
	nr          = 888;
	condition   = DIA_Addon_Garett_Trade_Condition;
	information = DIA_Addon_Garett_Trade_Info;
	permanent   = TRUE;
	description = DIALOG_TRADE;
	trade		= TRUE;
};
FUNC INT DIA_Addon_Garett_Trade_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; 	Garett_Random = Hlp_Random (3); 
	if Garett_Random == 0
	{
		B_Say (other,self,"$TRADE_1");
	}
	else if Garett_Random == 1
	{
		B_Say (other,self,"$TRADE_2");
	}
	else
	{
		B_Say (other,self,"$TRADE_3");
	};	
		
	B_GiveTradeInv (self);
	
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
};


