///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sarah_EXIT   (C_INFO)
{
	npc         = VLK_470_Sarah;
	nr          = 999;
	condition   = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sarah_PICKPOCKET (C_INFO)
{
	npc			= VLK_470_Sarah;
	nr			= 900;
	condition	= DIA_Sarah_PICKPOCKET_Condition;
	information	= DIA_Sarah_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen (57, 60);
};
 
FUNC VOID DIA_Sarah_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sarah_PICKPOCKET);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_BACK 		,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};
	
func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  1;
	condition	 = 	DIA_Sarah_Greet_Condition;
	information	 = 	DIA_Sarah_Greet_Info;
	permanent 	 =  TRUE;
	important	 =  TRUE;
};

func int DIA_Sarah_Greet_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Greet_Info ()
{
	AI_Output (self, other, "DIA_Sarah_Add_16_07"); //Á! To jsi zase ty!
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	condition	 = 	DIA_Sarah_HALLO_Condition;
	information	 = 	DIA_Sarah_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Jak jdou obchody?";
};

func int DIA_Sarah_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Sarah_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Sarah_HALLO_15_00"); //Jak jdou obchody?
	AI_Output (self, other, "DIA_Sarah_HALLO_16_01"); //Když dorazili paladinové, nejdâív jsem si myslela, že to je pâíležitost k dobrým obchodům.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_02"); //Ale pak nechali Harada, aby jim vyrábęl zbranę, a ani Hakon ani já jsme od nich nevidęli ani zlatku.
	AI_Output (self, other, "DIA_Sarah_HALLO_16_03"); //Navíc farmáâi už dál nechtęjí zásobovat męsto potravinami, a všechny ceny tak jdou nahoru.
	AI_Output (self, other, "DIA_Sarah_Add_16_00"); //Že mi paladinové platí hotel, je jen slabá útęcha.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Sarah prodává na tržišti zbranę.");	
};
///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  2;
	condition	 = 	DIA_Sarah_Bauern_Condition;
	information	 = 	DIA_Sarah_Bauern_Info;
	permanent	 =  FALSE;
	description	 = 	"Co je s farmáâi za problémy?";
};

func int DIA_Sarah_Bauern_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_HALLO)
	{
			return TRUE;
	};
};
func void DIA_Sarah_Bauern_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Bauern_15_00"); //Co je s farmáâi za problémy?
	AI_Output (self, other, "DIA_Sarah_Bauern_16_01"); //Odmítají dovážet své zboží.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_02"); //Teë, když už sem nepâiplouvají žádné lodę, je męsto samozâejmę závislé jen na tom, co poskytnou farmáâi.
	AI_Output (self, other, "DIA_Sarah_Bauern_16_03"); //A Onar, ten nejvętší z farmáâů, si najal žoldnéâe, aby chránili jeho farmu pâed męstskou stráží. Jinak by si domobrana všechno zabrala pro sebe.
	AI_Output (self, other, "DIA_Sarah_Add_16_01"); //Ale ti žoldáci nechrání jenom Onarovu farmu.
	AI_Output (self, other, "DIA_Sarah_Add_16_02"); //Zašli tak daleko, že zastrašují i malé farmáâe tady u męsta.
	AI_Output (self, other, "DIA_Sarah_Add_16_03"); //Vidęla jsem je, když jsem procházela pâes Akilovu farmu. Nechtęla bych teë být v jeho kůži.
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr 			 =  3;
	condition	 = 	DIA_Sarah_AkilsHof_Condition;
	information	 = 	DIA_Sarah_AkilsHof_Info;
	permanent	 =  FALSE;
	description	 = 	"Kde najdu Akilovu farmu?";
};

func int DIA_Sarah_AkilsHof_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Sarah_Bauern)
	{
		return TRUE;
	};
};
func void DIA_Sarah_AkilsHof_Info ()
{
	AI_Output (other, self, "DIA_Sarah_AkilsHof_15_00"); //Kde najdu Akilovu farmu?
	AI_Output (self, other, "DIA_Sarah_Add_16_04"); //Pokud odejdeš východní bránou a dáš se cestou napravo, dostaneš se ke schodišti.
	AI_Output (self, other, "DIA_Sarah_Add_16_05"); //To vede nahoru k Akilovę farmę.
	AI_Output (self, other, "DIA_Sarah_Add_16_06"); //Ale já bych tam teë nechodila - určitę tam ještę poâád jsou žoldáci.
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_Trade_Condition;
	information	 = 	DIA_Sarah_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 =	TRUE;
	description	 = 	"Ukaž mi své zboží.";
};

func int DIA_Sarah_Trade_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Sarah_Trade_15_00"); //Ukaž mi své zboží.
	
	Sarah_WaffenGesehen = TRUE;
	
};
///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  99;
	condition	 = 	DIA_Sarah_IMKNAST_Condition;
	information	 = 	DIA_Sarah_IMKNAST_Info;
	permanent	 = 	TRUE;
	important 	 =  TRUE;
};

func int DIA_Sarah_IMKNAST_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)	
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Sarah_IMKNAST_Info ()
{
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_00"); //Ty! Ty máš tu drzost tady ještę ukázat svůj ksicht! Nemůžu to dokázat, ale vsadím se, že jsi namočenej do pęknę špinavý hry.
	AI_Output (self, other, "DIA_Sarah_IMKNAST_16_01"); //Je to tvoje chyba, že jsem tady. Tvoje a toho zatracenýho Canthara - aă vás Innos ztrestá!
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success		(C_INFO)
{
	npc			 = 	VLK_470_Sarah;
	nr			 =  4;
	condition	 = 	DIA_Sarah_Success_Condition;
	information	 = 	DIA_Sarah_Success_Info;
	permanent 	 =  FALSE;
	description	 = 	"Canthar se tę snažil obelstít...";
};

func int DIA_Sarah_Success_Condition ()
{	
	if (Canthar_Ausgeliefert == TRUE)
	//|| (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};
func void DIA_Sarah_Success_Info ()
{
	AI_Output (other, self, "DIA_Sarah_Success_15_00"); //Canthar se tę pokusil podvést a získat tvůj stánek pro sebe. Ale já jsem ho pâedhodil męstským strážím.
	AI_Output (self, other, "DIA_Sarah_Success_16_01"); //Tak to sis znepâátelil nebezpečného muže. Znám toho bastarda už pęknę dlouho a vždycky chtęl můj stánek pro sebe.
	AI_Output (self, other, "DIA_Sarah_Success_16_02"); //Vezmi si tuhle zbraŕ jako vyjádâení mé vdęčnosti.
	
	B_GivePlayerXP (XP_CantharImKnast);
	B_GiveInvItems (self, other, ItMw_Piratensaebel,1);
	
};
	
	  
	  
	   





