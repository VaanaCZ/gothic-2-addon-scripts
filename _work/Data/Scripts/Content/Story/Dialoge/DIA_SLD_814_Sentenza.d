// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sentenza_EXIT(C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 999;
	condition	= DIA_Sentenza_EXIT_Condition;
	information	= DIA_Sentenza_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sentenza_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo (Durchsuchen)
// ************************************************************
var int Sentenza_Wants50;
var int Sentenza_SearchDay;
// -------------------------------

instance DIA_Sentenza_Hello (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 1;
	condition	= DIA_Sentenza_Hello_Condition;
	information	= DIA_Sentenza_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Sentenza_Hello_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Sentenza_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Sentenza_Hello_09_00");	//Kam si myslíš, že jdeš?
	
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "A co je ti vlastnę do toho?" 			,DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Sentenza_Hello, "Chtęl jsem se tu jen trochu porozhlédnout, nic víc."	,DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_JustLooking_15_00"); //Chtęl jsem se tu jen trochu porozhlédnout, nic víc.
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_01"); //(smęje se) Na takové jako ty tu číhá spousta nebezpečí! A ty mi âíkáš, že se tu chceš jen tak porozhlédnout?
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_02"); //Ha! Ty chceš určitę na statek! Proč by ses jinak plahočil takový lán cesty, co?
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_03"); //Tak pâestaŕ plácat kraviny a nech mę, aă tę prohledám. Pak si můžeš jít zase po svém.
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "Dej ty pracky pryč."				,DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice		(DIA_Sentenza_Hello, "Jen si posluž, pro mę za mę si mę klidnę prohledej!" 			,DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_NotYourBusiness_15_00"); //A co je ti vlastnę do toho?
	AI_Output (self ,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01"); //(povzdech) Tak to ti budu muset důkladnę vysvętlit.
	
	AI_StopProcessInfos (self);
	
	B_Attack(self, other, AR_NONE, 1);
};

	func void B_Sentenza_SearchMe()
	{
		var int playerGold; playerGold = Npc_HasItems(other, ItMi_Gold);
		
		AI_Output (other, self,"DIA_Sentenza_Hello_SearchMe_15_00"); //Jen si posluž, klidnę si mę prohledej!
		AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_01"); //Tak se podívejme, copak to tu máš.
		
		if (playerGold >= 50)
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_02"); //Á, zlato! Vláčet s sebou tolik penęz, to může být poâádnę nebezpečné.
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_03"); //Spousta žoldáků jsou prachsprostí hrdloâezové, ne tak poctiví jako já.
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			Sentenza_GoldTaken = TRUE;
		}
		else if (playerGold > 0)
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_04"); //No, to toho teda moc nemáš.
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_05"); //Vrátím se k tobę pozdęji.
		}
		else
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_06"); //Tos ušel takovou štreku a nemáš ani męëák?
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_07"); //Nezdá se mi ale, že bys nęjak trpęl hladem. Určitę si nękde ŕákou tu škváru schováváš, co?
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_08"); //Je vidęt, že nejsi úplnę blbej. Určitę se ještę setkáme - tak na sebe zatím dávej pozor!
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_09"); //A nejspíš jenom ty sám víš, kde svoje zlato máš.
		};
		
		Sentenza_Wants50 = TRUE;

		AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_10"); //Já po tobę chci jenom 50 zlaăáků jako mýtné. A stačí, když to zaplatíš jednou - to je pâece fér, ne?
	};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos (self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_HandsOff_15_00"); //Dej ty pracky pryč.
	AI_Output (self ,other,"DIA_Sentenza_Hello_HandsOff_09_01"); //(výhružnę) Nebo co?
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "Nebo nic. Tak mę teda prohledej!"						,DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice		(DIA_Sentenza_Hello, "Nebo si na nęjaký čas budeš muset nechat zajít chuă na šacování pocestnejch."	,DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_OrElse_15_00"); //Nebo si na nęjaký čas budeš muset nechat zajít chuă na prohledávání.
	AI_Output (self ,other,"DIA_Sentenza_Hello_OrElse_09_01"); //Tak to se uvidí.
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};


// ************************************************************
// 			  		Zweiter Versuch (Gold)
// ************************************************************

INSTANCE DIA_Sentenza_Vzwei (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 2;
	condition	= DIA_Sentenza_Vzwei_Condition;
	information	= DIA_Sentenza_Vzwei_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Sentenza_Vzwei_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Sentenza_GoldTaken == FALSE)
	&& (Sentenza_SearchDay < Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Vzwei_Info()
{	
	AI_Output (self ,other,"DIA_Sentenza_Vzwei_09_00");	//Tak tę tu máme zas. Mrknęme se, copak máš u sebe tentokrát!

	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	
	Info_ClearChoices	(DIA_Sentenza_Vzwei);
	Info_AddChoice		(DIA_Sentenza_Vzwei, "Dej ty špinavé pracky pryč!"		,DIA_Sentenza_Vzwei_HandsOff);
	
	
	
	Info_AddChoice		(DIA_Sentenza_Vzwei, "Jen si posluž, pro mę za mę si mę klidnę prohledej!" 	,DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Sentenza_SearchMe();
	
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output (other, self,"DIA_Sentenza_Vzwei_HandsOff_15_00"); //Dej ty špinavé pracky pryč!
	AI_Output (self ,other,"DIA_Sentenza_Vzwei_HandsOff_09_01"); //(hrozivę) Nebo co? Tentokrát máš nejspíš u sebe daleko víc!
	
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  			WannaJoin
// ************************************************************

INSTANCE DIA_Sentenza_WannaJoin (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 3;
	condition	= DIA_Sentenza_WannaJoin_Condition;
	information	= DIA_Sentenza_WannaJoin_Info;
	permanent	= FALSE;
	description	= "Pâišel jsem se k vám pâidat.";
};                       

FUNC INT DIA_Sentenza_WannaJoin_Condition()
{
	if (hero.guild == GIL_NONE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Sentenza_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_WannaJoin_15_00"); //Pâišel jsem se k vám pâidat.
	AI_Output (self, other, "DIA_Sentenza_WannaJoin_09_01"); //To je od tebe hezké.
	AI_Output (self, other, "DIA_Sentenza_WannaJoin_09_02"); //(lhostejnę) Je ti jasné, že žoldáci budou hlasovat, jestli tę mezi sebe pâijmou nebo ne?
};

// ************************************************************
// 			  				Vote
// ************************************************************

INSTANCE DIA_Sentenza_Vote (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 4;
	condition	= DIA_Sentenza_Vote_Condition;
	information	= DIA_Sentenza_Vote_Info;
	permanent	= TRUE;
	description	= "A ty mi svůj hlas dáš?";
};                       

FUNC INT DIA_Sentenza_Vote_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Sentenza_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Vote_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_Vote_15_00"); //A ty mi svůj hlas dáš?
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_01"); //Jenom proto, žes mi dal pár na frak? (zasmęje se) Ne.
	}
	else if (Npc_HasItems (self, itmi_gold) >= 50)
	&& 		( (Sentenza_GoldTaken == TRUE) ||	(Sentenza_GoldGiven == TRUE) )
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_02"); //A proč vlastnę ne? 50 zlaăáků je docela dobrá cena za jeden hlas, nemyslíš?
		
		Sentenza_Stimme = TRUE;
		B_LogEntry (TOPIC_SLDRespekt,"Sentenza nemá nic proti tomu, abych se pâidal k žoldákům.");
	}
	else if (Sentenza_Stimme == TRUE)
	&& 		(Npc_HasItems (self, itmi_gold) < 50)
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_03"); //Potom, cos mi zase ukradl zlato? Neâekl bych, hochu.
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_04"); //Takhle to nefunguje, chlapečku! Jestli pro tebe mám hlasovat, pak musíš ke mnę nasmęrovat taky ŕáký zlato.
		AI_Output (other, self, "DIA_Sentenza_Vote_15_05"); //Kolik?
		AI_Output (self, other, "DIA_Sentenza_Vote_09_06"); //50 zlaăáků. To bys musel stejnę zaplatit.
		Sentenza_Wants50 = TRUE;
	};
};

// ************************************************************
// 			  				Pay50
// ************************************************************
var int Sentenza_GoldGiven;
// ------------------------

INSTANCE DIA_Sentenza_Pay50 (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 5;
	condition	= DIA_Sentenza_Pay50_Condition;
	information	= DIA_Sentenza_Pay50_Info;
	permanent	= TRUE;
	description	= "Tady máš tedy tęch 50 zlaăáků.";
};                       

FUNC INT DIA_Sentenza_Pay50_Condition()
{
	if (Sentenza_Wants50 == TRUE)
	&& (Npc_HasItems (self, itmi_gold) < 50)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Pay50_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_Pay50_15_00"); //Tady máš tęch 50 zlaăáků.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Sentenza_Pay50_09_01"); //Tak díky, to stačí!
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_Pay50_09_02"); //Nezahrávej si se mnou. Dostanu 50 zlaăáků a ani o męëák míŕ, jasné?
	};
};

// ************************************************************
// 			  				Gold zurückholen
// ************************************************************
var int Sentenza_Einmal;
// ---------------------

INSTANCE DIA_Sentenza_GoldBack (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 6;
	condition	= DIA_Sentenza_GoldBack_Condition;
	information	= DIA_Sentenza_GoldBack_Info;
	permanent	= TRUE;
	description = "Vraă mi mé zlato!";
};                       

FUNC INT DIA_Sentenza_GoldBack_Condition()
{
	if (Npc_HasItems (self, itmi_gold) >= 50)
	{
		if (Sentenza_GoldGiven == FALSE)
		|| (other.guild == GIL_SLD)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Sentenza_GoldBack_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_GoldBack_15_00"); //Vraă mi moje zlato!
	if (other.guild == GIL_SLD)
	&& (Torlof_SentenzaCounted == TRUE)
	&& (Sentenza_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_01"); //Teë, když jsem ti dal svůj hlas?
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_02"); //Ty mizerný žebračisko!
		
		Sentenza_Einmal = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_03"); //Klídek! Jenom to na chvilku pohlídám.
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************

INSTANCE DIA_Sentenza_AufsMaul (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 7;
	condition	= DIA_Sentenza_AufsMaul_Condition;
	information	= DIA_Sentenza_AufsMaul_Info;
	permanent	= FALSE; //FALSE!!!!!!!!!
	description = "Hele, to vpâedu na hlavę je fakt tvůj ksicht, nebo na mę vystrkuješ prdel?";
};                       

FUNC INT DIA_Sentenza_AufsMaul_Condition()
{
	if (Npc_HasItems (self, itmi_gold) >= 50)
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Sentenza_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_AufsMaul_15_00"); //Povęz mi, to, co máš vepâedu, je tvůj ksicht, nebo to na mę vystrkuješ prdel?
	AI_Output (self, other, "DIA_Sentenza_AufsMaul_09_01"); //(vztekle se smęje) Dobâe, když to tak chceš...
	
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				AufsMaulAgain
// ************************************************************

INSTANCE DIA_Sentenza_AufsMaulAgain (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 8;
	condition	= DIA_Sentenza_AufsMaulAgain_Condition;
	information	= DIA_Sentenza_AufsMaulAgain_Info;
	permanent	= TRUE;
	description = "Je čas na další náâez!";
};                       

FUNC INT DIA_Sentenza_AufsMaulAgain_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Sentenza_AufsMaul))
	{
		if (Npc_HasItems (self, itmi_gold) >= 50)
		|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Sentenza_AufsMaulAgain_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_AufsMaulAgain_15_00"); //Je čas na další náâez!
	AI_Output (self, other, "DIA_Sentenza_AufsMaulAgain_09_01"); //Když to âíkáš...
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};


// ************************************************************
// 			  				PERM
// ************************************************************

INSTANCE DIA_Sentenza_PERM (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 1;
	condition	= DIA_Sentenza_PERM_Condition;
	information	= DIA_Sentenza_PERM_Info;
	permanent	= TRUE;
	description = "Tak co, jak to jde?";
};                       

FUNC INT DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Sentenza_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_PERM_15_00"); //Tak co, jak to jde?
	
	AI_Output (self, other, "DIA_Sentenza_PERM_09_01"); //Moc lidí tudy nechodí, ale doteëka mi každý zaplatil.
	if (Npc_HasItems (self, itmi_gold) < 50)
	{
		AI_Output (self, other, "DIA_Sentenza_PERM_09_02"); //Kromę tebe. (zašklebí se)
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sentenza_PICKPOCKET (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 900;
	condition	= DIA_Sentenza_PICKPOCKET_Condition;
	information	= DIA_Sentenza_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Sentenza_PICKPOCKET_Condition()
{
	C_Beklauen (56, 65);
};
 
FUNC VOID DIA_Sentenza_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice		(DIA_Sentenza_PICKPOCKET, DIALOG_BACK 		,DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sentenza_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sentenza_PICKPOCKET);
};
	
func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sentenza_PICKPOCKET);
};


	






