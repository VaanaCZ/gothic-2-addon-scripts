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
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_00"); //Je�li chcesz zapyta�, czy do ciebie do��cz�, to mo�esz sobie darowa�.
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_01"); //Jak s�dzisz, co ch�opaki zrobi�, kiedy sobie p�jd�?
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_02"); //Po powrocie nie znalaz�bym ani jednej pe�nej skrzynki w swojej chacie!
	AI_Output (self,other,"DIA_Addon_Garett_Anheuern_09_03"); //Nie ma mowy. Zostan� tutaj i b�d� pilnowa� zapas�w.
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
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_00"); //Kogo my tu mamy? Ha, mam nadziej�, �e to nie kolejny bandzior na przeszpiegach.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_01"); //Nazywam si� Garett. Je�li masz na co� ochot�, najlepiej zwr�� si� do mnie.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_02"); //Mam tu wszystko, czego m�g�by� potrzebowa� - wino, bro� i sporo innych rzeczy.
	AI_Output (self,other,"DIA_Addon_Garett_Hello_09_03"); //Je�li jednak szukasz dobrego trunku, lepiej zg�o� si� do Samuela.

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
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_01"); //To nasz gorzelnik. Rezyduje w jaskini przy pla�y.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_02"); //Nietrudno do niego trafi�. Po prostu pod��aj ca�y czas na p�noc.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_03"); //Radz� zrobi� ma�y zapas grogu.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_04"); //Niekt�rzy ch�opcy nie s� zbyt przyja�ni w stosunku do nowych, �e si� tak wyra��.
	AI_Output (self,other,"DIA_Addon_Garett_Samuel_09_05"); //A w takim wypadku grog mo�e zdzia�a� cuda.

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

	description = "Sk�d bierzesz swoje towary?";
};                       
FUNC INT DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Garett_Warez_Info()
{	
	AI_Output (other,self,"DIA_Addon_Garett_Warez_15_00"); //Sk�d bierzesz swoje towary?
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_01"); //Skip przynosi je z Khorinis, gdzie czasami bywa.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_02"); //Do niedawna sprzedawa� je bandytom.
	AI_Output (self,other,"DIA_Addon_Garett_Warez_09_03"); //Ale od czasu, gdy toczymy z nimi wojn�, wszystko trafia do mnie.
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

	description = "Co wiesz na temat bandyt�w?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Bandits_15_00"); //Co wiesz na temat bandyt�w?
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_01"); //Najlepiej zapytaj o to Skipa.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_02"); //Cz�sto si� z nimi kontaktowa�, wi�c powinien sporo wiedzie� o tych draniach.
	AI_Output (self,other,"DIA_Addon_Garett_Bandits_09_03"); //Greg rozkaza� ostro reagowa� na pojawienie si� cho�by jednego bandyty w tym rejonie.
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
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_01"); //Twarda z niego sztuka, bez dw�ch zda�.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_02"); //I sk�py jak diabli.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_03"); //Pozwala naszemu skarbnikowi, Francisowi, p�aci� nam tylko tyle, by�my si� nie zbuntowali.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_04"); //A kiedy kt�ry� z nas zdob�dzie co� naprawd� cennego, Greg przyw�aszcza to sobie.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_05"); //Kiedy� zabra�em kompas z kr�lewskiej fregaty.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_06"); //A Greg, rzecz jasna, odebra� mi go.
	AI_Output (self, other, "DIA_Addon_Garett_Greg_09_07"); //Ech... Pewnie go gdzie� zakopa� jak reszt� swoich skarb�w.
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

	description = "Gdzie Greg m�g� zakopa� kompas?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_00"); //Gdzie Greg m�g� zakopa� kompas?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_01"); //Greg powiedzia� mi, �e w ten kompas zagl�da�a sama �mier�. A potem mnie wy�mia�.
	AI_Output (other,self,"DIA_Addon_Garett_Tips_15_02"); //Co� jeszcze?
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_03"); //Wzd�u� po�udniowego wybrze�a ci�gnie si� pla�a, do kt�rej mo�na si� dosta� wy��cznie drog� morsk�.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_04"); //Podobno cz�sto widywano na niej Grega. Mo�e tam uda ci si� co� znale��.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_05"); //Kiedy� sam si� wybra�em w te rejony, ale za du�o tam potwor�w.
	AI_Output (self,other,"DIA_Addon_Garett_Tips_09_06"); //Je�li chcesz mimo wszystko zaryzykowa�, nie zapomnij wzi�� kilofa.
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_Kompass,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_Kompass,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kompass,"Greg zabra� Garretowi cenny kompas. Garett podejrzewa, �e zakopa� go gdzie� na po�udniowej pla�y.");
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
	description = "Oto tw�j kompas.";
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
	AI_Output (other,self,"DIA_Addon_Garett_GiveKompass_15_00"); //Oto tw�j kompas.
	
	//Patch m.f. - weil H�ndler
	if B_GiveInvItems (other,self,ItMI_Addon_Kompass_Mis,1)
	{
		Npc_RemoveInvItems (self, ItMI_Addon_Kompass_Mis,1);
	};
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_01"); //Ha, to rzeczywi�cie on! Nie spodziewa�em si�, �e ujrz� go ponownie.
	AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_02"); //Wielkie dzi�ki!
	
	if (Npc_HasItems (self, ItBE_Addon_Prot_EdgPoi) > 0)
	{ 
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_03"); //Tym razem Greg ju� go nie dostanie.
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_04"); //We� w nagrod� ten pas. Jest sporo wart.
		B_GiveInvItems (self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_05"); //Pami�tasz ten pas, kt�ry ode mnie kupi�e�?
		AI_Output (self,other,"DIA_Addon_Garett_GiveKompass_09_06"); //Zap�aci�e� za niego sporo, cho�, zwa�ywszy na jego warto��, na pewno nie przep�aci�e�. Prosz�, we� swoje pieni�dze z powrotem i potraktuj go jako prezent.
		B_GiveInvItems (self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};
	
	B_LogEntry (TOPIC_Addon_Kompass,"Garret by� bardzo zadowolony, gdy odda�em mu kompas.");
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
	description = "Co mo�esz mi powiedzie� o Francisie?";
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
	AI_Output (other,self,"DIA_Addon_Garett_Francis_15_00"); //Co mo�esz mi powiedzie� o Francisie?
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_01"); //Greg mianowa� go zast�pc� na czas swojej nieobecno�ci.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_02"); //Niestety, Francis w og�le nie sprawdza si� w roli kapitana.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_03"); //Nie potrafi nawet �ci�gn�� Morgana z ��ka.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_04"); //Tylko Henry i jego ch�opaki w og�le co� robi�.
	AI_Output (self,other,"DIA_Addon_Garett_Francis_09_05"); //Reszta obija si�, zamiast pracowa�.
	if (GregIsBack == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_06"); //Mam nadziej�, �e Greg szybko wr�ci.
		AI_Output (self,other,"DIA_Addon_Garett_Francis_09_07"); //I porozstawia towarzystwo po k�tach.
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
	description = "Jakie� wie�ci?";
};
FUNC INT DIA_Addon_Garett_PERM_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Garett_PERM_Info()
{
	AI_Output (other,self ,"DIA_Addon_Garett_PERM_15_00"); //Jakie� wie�ci?
	
	if (GregIsBack == FALSE)
	|| (Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_02"); //Od kiedy Greg znikn��, nic tu si� nie dzieje.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Garett_PERM_09_01"); //Od czasu powrotu kapitana wszystko wr�ci�o do normy.
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


