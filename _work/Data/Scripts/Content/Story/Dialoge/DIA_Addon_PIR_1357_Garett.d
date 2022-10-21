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
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Jeœli chcesz zapytaæ, czy do ciebie do³¹czê, to mo¿esz sobie darowaæ.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Jak s¹dzisz, co ch³opaki zrobi¹, kiedy sobie pójdê?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Po powrocie nie znalaz³bym ani jednej pe³nej skrzynki w swojej chacie!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Nie ma mowy. Zostanê tutaj i bêdê pilnowa³ zapasów.
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
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //Kogo my tu mamy? Ha, mam nadziejê, ¿e to nie kolejny bandzior na przeszpiegach.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Nazywam siê Garett. Jeœli masz na coœ ochotê, najlepiej zwróæ siê do mnie.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Mam tu wszystko, czego móg³byœ potrzebowaæ - wino, broñ i sporo innych rzeczy.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Jeœli jednak szukasz dobrego trunku, lepiej zg³oœ siê do Samuela.

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
	description = "Kim jest Samuel?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Samuel_15_00"); //Kim jest Samuel?
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //To nasz gorzelnik. Rezyduje w jaskini przy pla¿y.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Nietrudno do niego trafiæ. Po prostu pod¹¿aj ca³y czas na pó³noc.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Radzê zrobiæ ma³y zapas grogu.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Niektórzy ch³opcy nie s¹ zbyt przyjaŸni w stosunku do nowych, ¿e siê tak wyra¿ê.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //A w takim wypadku grog mo¿e zdzia³aæ cuda.

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

	description = "Sk¹d bierzesz swoje towary?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Sk¹d bierzesz swoje towary?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip przynosi je z Khorinis, gdzie czasami bywa.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Do niedawna sprzedawa³ je bandytom.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Ale od czasu, gdy toczymy z nimi wojnê, wszystko trafia do mnie.
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

	description = "Co wiesz na temat bandytów?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Co wiesz na temat bandytów?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Najlepiej zapytaj o to Skipa.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Czêsto siê z nimi kontaktowa³, wiêc powinien sporo wiedzieæ o tych draniach.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg rozkaza³ ostro reagowaæ na pojawienie siê choæby jednego bandyty w tym rejonie.
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
	description = "A ten wasz kapitan... Jaki on jest?";
};                       
FUNC INT DIA_Addon_Garett_Greg_Condition ()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Garett_Greg_Info()
{	
	AI_Output (other, self, "DIA_Addon_Garett_Greg_15_00"); //A ten wasz kapitan... Jaki on jest?
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Twarda z niego sztuka, bez dwóch zdañ.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //I sk¹py jak diabli.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Pozwala naszemu skarbnikowi, Francisowi, p³aciæ nam tylko tyle, byœmy siê nie zbuntowali.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //A kiedy któryœ z nas zdobêdzie coœ naprawdê cennego, Greg przyw³aszcza to sobie.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Kiedyœ zabra³em kompas z królewskiej fregaty.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //A Greg, rzecz jasna, odebra³ mi go.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Ech... Pewnie go gdzieœ zakopa³ jak resztê swoich skarbów.
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

	description = "Gdzie Greg móg³ zakopaæ kompas?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Gdzie Greg móg³ zakopaæ kompas?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg powiedzia³ mi, ¿e w ten kompas zagl¹da³a sama œmieræ. A potem mnie wyœmia³.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Coœ jeszcze?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Wzd³u¿ po³udniowego wybrze¿a ci¹gnie siê pla¿a, do której mo¿na siê dostaæ wy³¹cznie drog¹ morsk¹.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Podobno czêsto widywano na niej Grega. Mo¿e tam uda ci siê coœ znaleŸæ.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Kiedyœ sam siê wybra³em w te rejony, ale za du¿o tam potworów.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Jeœli chcesz mimo wszystko zaryzykowaæ, nie zapomnij wzi¹æ kilofa.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg zabra³ Garretowi cenny kompas. Garett podejrzewa, ¿e zakopa³ go gdzieœ na po³udniowej pla¿y.");
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
	description = "Oto twój kompas.";
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
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Oto twój kompas.
	
	//Patch m.f. - weil Händler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //Ha, to rzeczywiœcie on! Nie spodziewa³em siê, ¿e ujrzê go ponownie.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Wielkie dziêki!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Tym razem Greg ju¿ go nie dostanie.
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //WeŸ w nagrodê ten pas. Jest sporo wart.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Pamiêtasz ten pas, który ode mnie kupi³eœ?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //Zap³aci³eœ za niego sporo, choæ, zwa¿ywszy na jego wartoœæ, na pewno nie przep³aci³eœ. Proszê, weŸ swoje pieni¹dze z powrotem i potraktuj go jako prezent.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret by³ bardzo zadowolony, gdy odda³em mu kompas.");
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
	description = "Co mo¿esz mi powiedzieæ o Francisie?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Co mo¿esz mi powiedzieæ o Francisie?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg mianowa³ go zastêpc¹ na czas swojej nieobecnoœci.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Niestety, Francis w ogóle nie sprawdza siê w roli kapitana.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Nie potrafi nawet œci¹gn¹æ Morgana z ³ó¿ka.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Tylko Henry i jego ch³opaki w ogóle coœ robi¹.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Reszta obija siê, zamiast pracowaæ.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Mam nadziejê, ¿e Greg szybko wróci.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //I porozstawia towarzystwo po k¹tach.
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
	description = "Jakieœ wieœci?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Jakieœ wieœci?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Od kiedy Greg znikn¹³, nic tu siê nie dzieje.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Od czasu powrotu kapitana wszystko wróci³o do normy.
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


