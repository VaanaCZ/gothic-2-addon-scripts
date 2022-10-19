// ************************************************************
// 			  					EXIT 
// ************************************************************
INSTANCE DIA_Elena_EXIT   (C_INFO)
{
	npc         = BAU_911_Elena;
	nr          = 999;
	condition   = DIA_Elena_EXIT_Condition;
	information = DIA_Elena_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo 
// ************************************************************
instance DIA_Elena_HALLO		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 1;
	condition	= DIA_Elena_HALLO_Condition;
	information	= DIA_Elena_HALLO_Info;
	permanent	= FALSE;
	description	= "Haló, krásná paní.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Haló, krásná paní.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Hm. Odkud jsi utekl?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //Co chceš?
	};
};


// ************************************************************
// 			  					Aufstand
// ************************************************************
instance DIA_Elena_Aufstand		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 2;
	condition	= DIA_Elena_Aufstand_Condition;
	information	= DIA_Elena_Aufstand_Info;
	permanent	= FALSE;
	description	= "Âíká se, že jste se postavili králi?";
};

func int DIA_Elena_Aufstand_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info ()
{
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //Âíká se, že jste se postavili králi?
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //Mùj otec se rozhodl, že nadešel èas na to, abychom se zaèali spoléhat sami na sebe.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //Domobrana nám nikdy nepomohla. Vždycky jen pâišli a sebrali nám naše zásoby jídla.
	};
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Arbeit		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 3;
	condition	= DIA_Elena_Arbeit_Condition;
	information	= DIA_Elena_Arbeit_Info;
	permanent	= FALSE;
	description	= "Jaká práce je tady na farmê k dispozici?";
};

func int DIA_Elena_Arbeit_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Jaká práce je tady na farmê k dispozici?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //Mùj otec platí každému, kdo pomáhá bránit farmu.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //Mêl bys zájem? Nevypadáš jako nêkdo, kdo by se hrnul do práce námezdního rolníka.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Kolik tvùj otec platí?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //To bys mêl projednat spíš s ním.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //Vím jen, že každý žoldák tady dennê dostává žold.
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Regeln		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 4;
	condition	= DIA_Elena_Regeln_Condition;
	information	= DIA_Elena_Regeln_Info;
	permanent	= FALSE;
	description	= "Máte tu nêjaká pravidla, která bych mêl dodržovat?";
};

func int DIA_Elena_Regeln_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info ()
{
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //Máte tu nêjaká pravidla, která bych mêl dodržovat?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Nedotýkej se tu nièeho, co není tvoje.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Vyhýbej se místùm, na kterých nemáš co dêlat.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //A když budeš muset zaèít bojovat, drž se poblíž žoldákù.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Pokud zaèneš hádku s farmáâi, budou tady všichni proti tobê.
};


// ************************************************************
// 			  					Aufgabe 
// ************************************************************
instance DIA_Elena_AUFGABE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 5;
	condition	= DIA_Elena_AUFGABE_Condition;
	information	= DIA_Elena_AUFGABE_Info;
	permanent 	= FALSE;
	description	= "Jakou práci tu vykonáváš?";
};

func int DIA_Elena_AUFGABE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info ()
{
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //Jakou práci tu vykonáváš?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Prodávám zboží, které vyrobíme. Jestli chceš nêco koupit, staèí dát vêdêt.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Ale dovol mi tê varovat. Nestojím o žádné smlouvání a nemám ráda dlouhé prsty, rozumíme si?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Ellena prodává na Onarovê statku rùzné zboží.");
};

// ************************************************************
// 			  					TRADE 
// ************************************************************

//---------------------------------
var int Elena_Trade_mit_mir;
//---------------------------------

instance DIA_Elena_TRADE		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr          = 7;
	condition	= DIA_Elena_TRADE_Condition;
	information	= DIA_Elena_TRADE_Info;
	permanent	= TRUE;
	description	= "Ukaž mi své zboží!";
	trade		= TRUE;
};

func int DIA_Elena_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_AUFGABE))
	|| (Elena_Trade_mit_mir == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Ukaž mi své zboží!
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Co ti mùžu nabídnout?
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Elena_PERM		(C_INFO)
{
	npc		 	= BAU_911_Elena;
	nr		 	= 900;
	condition	= DIA_Elena_PERM_Condition;
	information	= DIA_Elena_PERM_Info;
	permanent	= TRUE;
	description	= "Stalo se tu poslední dobou nêco dùležitého?";
};

func int DIA_Elena_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //Stalo se tu poslední dobou nêco dùležitého?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //Pâed pár dny mùj otec rozhlásil, že už dál nesmíme nic prodávat ve mêstê.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Tak teë zùstávám na farmê a prodávám své zboží jenom návštêvníkùm statku.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Domobrana napadá sousední farmy èím dál tím èastêji. Je to jen otázka èasu, kdy mùj otec zasáhne.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //V zemi je teë nebezpeèno. Skoro nikdo si netroufne ani za humna. Už je to pêknê dlouho, co se nêkdo od nás naposledy vypravil do mêsta.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //Žoldnéâi byli èím dál tím víc nesví. Ale jakmile odtáhl Sylvio se svými kumpány, vypadají už trochu klidnêji.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //Všichni tu mluví o hrozícím skâetím útoku. Ale já tomu moc nevêâím. Podle mê jsme tady na farmê pâed nimi v bezpeèí.
	};
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Minenanteil
///////////////////////////////////////////////////////////////////////
instance DIA_Elena_MINENANTEIL		(C_INFO)
{
	npc		 = 	BAU_911_Elena;
	nr		 = 	2;
	condition	 = 	DIA_Elena_MINENANTEIL_Condition;
	information	 = 	DIA_Elena_MINENANTEIL_Info;

	description  =  "Prodáváš dùlní akcie?";
};

func int DIA_Elena_MINENANTEIL_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Elena_Hallo))
		{
				return TRUE;
		};
};

func void DIA_Elena_MINENANTEIL_Info ()
{
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Prodáváš dùlní akcie?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //No a co? Sám jsem za nê zaplatil poslední drobné.
	B_GivePlayerXP (XP_Ambient);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Elena_PICKPOCKET (C_INFO)
{
	npc			= BAU_911_Elena;
	nr			= 900;
	condition	= DIA_Elena_PICKPOCKET_Condition;
	information	= DIA_Elena_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Elena_PICKPOCKET_Condition()
{
	C_Beklauen (30, 35);
};
 
FUNC VOID DIA_Elena_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Elena_PICKPOCKET);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_BACK 		,DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};
	
func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Elena_PICKPOCKET);
};





















