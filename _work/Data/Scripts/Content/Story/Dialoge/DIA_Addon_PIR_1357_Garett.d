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
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Jeśli chcesz zapytać, czy do ciebie dołączę, to możesz sobie darować.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Jak sądzisz, co chłopaki zrobią, kiedy sobie pójdę?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Po powrocie nie znalazłbym ani jednej pełnej skrzynki w swojej chacie!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Nie ma mowy. Zostanę tutaj i będę pilnował zapasów.
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
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //Kogo my tu mamy? Ha, mam nadzieję, że to nie kolejny bandzior na przeszpiegach.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Nazywam się Garett. Jeśli masz na coś ochotę, najlepiej zwróć się do mnie.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Mam tu wszystko, czego mógłbyś potrzebować - wino, broń i sporo innych rzeczy.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Jeśli jednak szukasz dobrego trunku, lepiej zgłoś się do Samuela.

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
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //To nasz gorzelnik. Rezyduje w jaskini przy plaży.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Nietrudno do niego trafić. Po prostu podążaj cały czas na północ.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Radzę zrobić mały zapas grogu.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Niektórzy chłopcy nie są zbyt przyjaźni w stosunku do nowych, że się tak wyrażę.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //A w takim wypadku grog może zdziałać cuda.

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

	description = "Skąd bierzesz swoje towary?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Skąd bierzesz swoje towary?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip przynosi je z Khorinis, gdzie czasami bywa.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Do niedawna sprzedawał je bandytom.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Ale od czasu, gdy toczymy z nimi wojnę, wszystko trafia do mnie.
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
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Często się z nimi kontaktował, więc powinien sporo wiedzieć o tych draniach.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg rozkazał ostro reagować na pojawienie się choćby jednego bandyty w tym rejonie.
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
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Twarda z niego sztuka, bez dwóch zdań.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //I skąpy jak diabli.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Pozwala naszemu skarbnikowi, Francisowi, płacić nam tylko tyle, byśmy się nie zbuntowali.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //A kiedy któryś z nas zdobędzie coś naprawdę cennego, Greg przywłaszcza to sobie.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Kiedyś zabrałem kompas z królewskiej fregaty.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //A Greg, rzecz jasna, odebrał mi go.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Ech... Pewnie go gdzieś zakopał jak resztę swoich skarbów.
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

	description = "Gdzie Greg mógł zakopać kompas?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Gdzie Greg mógł zakopać kompas?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg powiedział mi, że w ten kompas zaglądała sama śmierć. A potem mnie wyśmiał.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Coś jeszcze?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Wzdłuż południowego wybrzeża ciągnie się plaża, do której można się dostać wyłącznie drogą morską.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Podobno często widywano na niej Grega. Może tam uda ci się coś znaleźć.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Kiedyś sam się wybrałem w te rejony, ale za dużo tam potworów.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Jeśli chcesz mimo wszystko zaryzykować, nie zapomnij wziąć kilofa.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg zabrał Garretowi cenny kompas. Garett podejrzewa, że zakopał go gdzieś na południowej plaży.");
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
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //Ha, to rzeczywiście on! Nie spodziewałem się, że ujrzę go ponownie.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Wielkie dzięki!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Tym razem Greg już go nie dostanie.
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //Weź w nagrodę ten pas. Jest sporo wart.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Pamiętasz ten pas, który ode mnie kupiłeś?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //Zapłaciłeś za niego sporo, choć, zważywszy na jego wartość, na pewno nie przepłaciłeś. Proszę, weź swoje pieniądze z powrotem i potraktuj go jako prezent.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret był bardzo zadowolony, gdy oddałem mu kompas.");
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
	description = "Co możesz mi powiedzieć o Francisie?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Co możesz mi powiedzieć o Francisie?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg mianował go zastępcą na czas swojej nieobecności.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Niestety, Francis w ogóle nie sprawdza się w roli kapitana.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Nie potrafi nawet ściągnąć Morgana z łóżka.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Tylko Henry i jego chłopaki w ogóle coś robią.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Reszta obija się, zamiast pracować.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Mam nadzieję, że Greg szybko wróci.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //I porozstawia towarzystwo po kątach.
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
	description = "Jakieś wieści?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Jakieś wieści?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Od kiedy Greg zniknął, nic tu się nie dzieje.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Od czasu powrotu kapitana wszystko wróciło do normy.
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


