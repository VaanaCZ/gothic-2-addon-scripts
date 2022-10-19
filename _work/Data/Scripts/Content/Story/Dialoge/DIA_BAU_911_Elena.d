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
	description	= "Hal�, kr�sn� pan�.";
};

func int DIA_Elena_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Elena_HALLO_15_00"); //Hal�, kr�sn� pan�.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_01"); //Hm. Odkud jsi utekl?
	}
	else
	{
		AI_Output (self, other, "DIA_Elena_HALLO_16_02"); //Co chce�?
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
	description	= "��k� se, �e jste se postavili kr�li?";
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
	AI_Output (other, self, "DIA_Elena_Aufstand_15_00"); //��k� se, �e jste se postavili kr�li?
	AI_Output (self, other, "DIA_Elena_Aufstand_16_01"); //M�j otec se rozhodl, �e nade�el �as na to, abychom se za�ali spol�hat sami na sebe.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Elena_Aufstand_16_02"); //Domobrana n�m nikdy nepomohla. V�dycky jen p�i�li a sebrali n�m na�e z�soby j�dla.
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
	description	= "Jak� pr�ce je tady na farm� k dispozici?";
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
	AI_Output (other, self, "DIA_Elena_Arbeit_15_00"); //Jak� pr�ce je tady na farm� k dispozici?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_01"); //M�j otec plat� ka�d�mu, kdo pom�h� br�nit farmu.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_02"); //M�l bys z�jem? Nevypad� jako n�kdo, kdo by se hrnul do pr�ce n�mezdn�ho roln�ka.
	AI_Output (other, self, "DIA_Elena_Arbeit_15_03"); //Kolik tv�j otec plat�?
	AI_Output (self, other, "DIA_Elena_Arbeit_16_04"); //To bys m�l projednat sp� s n�m.
	AI_Output (self, other, "DIA_Elena_Arbeit_16_05"); //V�m jen, �e ka�d� �old�k tady denn� dost�v� �old.
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
	description	= "M�te tu n�jak� pravidla, kter� bych m�l dodr�ovat?";
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
	AI_Output (other, self, "DIA_Elena_Regeln_15_00"); //M�te tu n�jak� pravidla, kter� bych m�l dodr�ovat?
	AI_Output (self, other, "DIA_Elena_Regeln_16_01"); //Nedot�kej se tu ni�eho, co nen� tvoje.
	AI_Output (self, other, "DIA_Elena_Regeln_16_02"); //Vyh�bej se m�st�m, na kter�ch nem� co d�lat.
	AI_Output (self, other, "DIA_Elena_Regeln_16_03"); //A kdy� bude� muset za��t bojovat, dr� se pobl� �old�k�.
	AI_Output (self, other, "DIA_Elena_Regeln_16_04"); //Pokud za�ne� h�dku s farm��i, budou tady v�ichni proti tob�.
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
	description	= "Jakou pr�ci tu vykon�v�?";
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
	AI_Output (other, self, "DIA_Elena_AUFGABE_15_00"); //Jakou pr�ci tu vykon�v�?
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_01"); //Prod�v�m zbo��, kter� vyrob�me. Jestli chce� n�co koupit, sta�� d�t v�d�t.
	AI_Output (self, other, "DIA_Elena_AUFGABE_16_02"); //Ale dovol mi t� varovat. Nestoj�m o ��dn� smlouv�n� a nem�m r�da dlouh� prsty, rozum�me si?
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Ellena prod�v� na Onarov� statku r�zn� zbo��.");
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
	description	= "Uka� mi sv� zbo��!";
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
	AI_Output			(other, self, "DIA_Elena_TRADE_15_00"); //Uka� mi sv� zbo��!
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Elena_TRADE_16_01"); //Co ti m��u nab�dnout?
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
	description	= "Stalo se tu posledn� dobou n�co d�le�it�ho?";
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
	AI_Output			(other, self, "DIA_Elena_PERM_15_00"); //Stalo se tu posledn� dobou n�co d�le�it�ho?

	if (kapitel <= 1)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_01"); //P�ed p�r dny m�j otec rozhl�sil, �e u� d�l nesm�me nic prod�vat ve m�st�.
		AI_Output			(self, other, "DIA_Elena_PERM_16_02"); //Tak te� z�st�v�m na farm� a prod�v�m sv� zbo�� jenom n�v�t�vn�k�m statku.
	
		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_03"); //Domobrana napad� sousedn� farmy ��m d�l t�m �ast�ji. Je to jen ot�zka �asu, kdy m�j otec zas�hne.
	}
	else if (Kapitel == 3)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_04"); //V zemi je te� nebezpe�no. Skoro nikdo si netroufne ani za humna. U� je to p�kn� dlouho, co se n�kdo od n�s naposledy vypravil do m�sta.
	}
	else if (kapitel == 4)
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_05"); //�oldn��i byli ��m d�l t�m v�c nesv�. Ale jakmile odt�hl Sylvio se sv�mi kump�ny, vypadaj� u� trochu klidn�ji.
	}
	else //Kapitel 5
	{
		AI_Output			(self, other, "DIA_Elena_PERM_16_06"); //V�ichni tu mluv� o hroz�c�m sk�et�m �toku. Ale j� tomu moc nev���m. Podle m� jsme tady na farm� p�ed nimi v bezpe��.
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

	description  =  "Prod�v� d�ln� akcie?";
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
	AI_Output			(other, self, "DIA_Elena_MINENANTEIL_15_00"); //Prod�v� d�ln� akcie?
	AI_Output			(self, other, "DIA_Elena_MINENANTEIL_16_01"); //No a co? S�m jsem za n� zaplatil posledn� drobn�.
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





















