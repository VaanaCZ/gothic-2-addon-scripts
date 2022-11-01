// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Matt_EXIT(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 999;
	condition	= DIA_Addon_Matt_EXIT_Condition;
	information	= DIA_Addon_Matt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Matt_PICKPOCKET (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 900;
	condition	= DIA_Addon_Matt_PICKPOCKET_Condition;
	information	= DIA_Addon_Matt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Matt_PICKPOCKET_Condition()
{
	C_Beklauen (55, 91);
};
 
FUNC VOID DIA_Addon_Matt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
	
func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
// ************************************************************
// 			  Hello 
// ************************************************************
INSTANCE DIA_Addon_Matt_Hello(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 1;
	condition	= DIA_Addon_Matt_Hello_Condition;
	information	= DIA_Addon_Matt_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Matt_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Matt_Hello_10_01"); //Ty seš tu novej, co? Prima! Nám se hodí každej.
};

// ************************************************************
// 			 				PERM 
// ************************************************************
INSTANCE DIA_Addon_Matt_PERM (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 2;
	condition	= DIA_Addon_Matt_PERM_Condition;
	information	= DIA_Addon_Matt_PERM_Info;
	permanent	= TRUE;
	Description  = "Jak se vede?";
};                       
FUNC INT DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Matt_Alright_15_01"); //Jak se daâí?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_02"); //Âíkal jsem LÉČIVEJ LEKTVAR. Nerozumíš česky?
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_01"); //Všecko v cajku (cynicky), kapitáne!
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_01"); //To je sranda. Už nemáme žádnou loë.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_02"); //Budu prostę čekat, co Greg vymyslí.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_03"); //Teë je v táboâe klid, takže si půjdu taky trochu dáchnout.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_04"); //A bejt tebou, udęlám to samý.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_05"); //Od tý doby, co tu opruzujou ti banditi, se situace męní rychlejc, než je zdrávo.
	};
};

// ************************************************************
// 			 				Banditen
// ************************************************************
INSTANCE DIA_Addon_Matt_Bandits(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 3;
	condition	= DIA_Addon_Matt_Bandits_Condition;
	information	= DIA_Addon_Matt_Bandits_Info;

	description = "Co víš o banditech?";
};                       
FUNC INT DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_Bandits_Info()
{	
	AI_Output (other, self,"DIA_Addon_Matt_Bandits_15_03"); //Co víš o banditech?
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_01"); //Myslíš krom toho, že jsou pro nás smrtelná hrozba a maj nad náma poâádnou pâesilu?
	AI_Output (other,self ,"DIA_Addon_Matt_Bandits_15_02"); //Ano.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_02"); //Válej se ve zlatę.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_03"); //Teda aspoŕ se VÁLELI ve zlatę. Protože za poslední zásilku nikdy nezaplatili.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_04"); //Ale pochybuju, že by to bylo proto, že jim došlo zlato.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_05"); //Spíš jim už hlavy narostly do nebe.
};

// ************************************************************
// 			 				Francis 
// ************************************************************
INSTANCE DIA_Addon_Matt_Francis(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 4;
	condition	= DIA_Addon_Matt_Francis_Condition;
	information	= DIA_Addon_Matt_Francis_Info;

	description = "Co víš o Francisovi?";
};                       
FUNC INT DIA_Addon_Matt_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};
func VOID DIA_Addon_Matt_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_00"); //Co víš o Francisovi?
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_01"); //Myslíš krom toho, že je línej a neschopnej?
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_02"); //Ano.
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_03"); //Tak to se musím zamyslet. Hmm... ne. Nic jinýho mę nenapadá.
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Matt_Anheuern(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 11;
	condition	= DIA_Addon_Matt_Anheuern_Condition;
	information	= DIA_Addon_Matt_Anheuern_Info;
	permanent	= FALSE;
	description = "Pojë se mnou.";
};                       
FUNC INT DIA_Addon_Matt_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Matt_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_00"); //Pojë se mnou.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_01"); //Teë nemůžu jít, snažím se trochu si dáchnout.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_02"); //Jsou to rozkazy od Grega.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_03"); //(rychle) Aha, chápu. To je ovšem nęco jinýho. Teda jako že už jdu, ovšem, samozâejmę.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_04"); //Kam půjdem?
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Zavâi klapačku a radši pojë.",DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Máme vyčistit kaŕon.",DIA_Addon_Matt_Anheuern_ClearCanyon);
};
func VOID DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ShutUp_15_00"); //Radši drž hubu a krok.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01"); //(nevrle) Rozkaz (sarkasticky), kapitáne!
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};
func VOID DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00"); //Máme vyčistit kaŕon.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01"); //Si upad, ne? Dyk je plnej potvor. Hlavnę s tęma bâitovcema bysme si nemęli zahrávat.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02"); //Já vím. Už jdeš?
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03"); //(povzdychne si) Radši si nabalím pár léčivejch lektvarů, budem je potâebovat.

	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Matt_ComeOn(C_INFO)
{
	npc			= 	PIR_1365_Addon_Matt;
	nr		 	= 	12;
	condition	= 	DIA_Addon_Matt_ComeOn_Condition;
	information	= 	DIA_Addon_Matt_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Pojë se mnou.";
};
func int DIA_Addon_Matt_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Matt_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Matt_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Matt_ComeOn_15_00"); //Pojë se mnou.
	
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_ComeOn_10_01"); //Rozkaz (cynicky), kapitáne!
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_GoHome(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 13;
	condition	= DIA_Addon_Matt_GoHome_Condition;
	information	= DIA_Addon_Matt_GoHome_Info;
	permanent	= TRUE;
	description = "Už tę nepotâebuju.";
};                       
FUNC INT DIA_Addon_Matt_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Matt_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_DontNeedYou_15_00"); //Už tę nepotâebuju.
	AI_Output (self, other, "DIA_Addon_Matt_GoHome_10_01"); //(skuhrá si pro sebe) Potâebuju poâádnýho loka koâalky!
		
	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_TooFar(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 14;
	condition	= DIA_Addon_Matt_TooFar_Condition;
	information	= DIA_Addon_Matt_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Matt_TooFar_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_01"); //Odsud už můžeš jít sám (cynicky), kapitáne.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_03"); //Já i s chlapama se vracíme do tábora.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_02"); //Já se vracím do tábora!
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 Ich könnte 'nen Heiltrank gebrauchen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_Healing(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 15;
	condition	= DIA_Addon_Matt_Healing_Condition;
	information	= DIA_Addon_Matt_Healing_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_Healing_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Healing_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_Healing_10_01"); //(cynicky) Haló, kapitáne! Hodil by se mi ŕákej léčivej lektvar.
};






