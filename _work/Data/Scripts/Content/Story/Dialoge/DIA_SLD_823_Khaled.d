// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Khaled_EXIT (C_INFO)
{
	npc         = SLD_823_Khaled;
	nr          = 999;
	condition   = DIA_Khaled_EXIT_Condition;
	information = DIA_Khaled_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				Hallo 
// ************************************************************
var int Khaled_weiter;

instance DIA_Khaled_Hallo		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 1;
	condition	= DIA_Khaled_Hallo_Condition;
	information	= DIA_Khaled_Hallo_Info;
	permanent	= TRUE;
	description	= "Jak leci?";
};

func int DIA_Khaled_Hallo_Condition ()
{
	if (Khaled_weiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Khaled_Hallo_15_00"); //Jak leci?
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	{
		AI_Output (self, other, "DIA_Khaled_Hallo_11_01"); //A zatem chcesz si� do nas przy��czy�? Masz jak�� przyzwoit� bro�?
		Khaled_weiter = TRUE;
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Khaled sprzedaje bro�.");
	}
	else
	{
		AI_Output (self, other, "DIA_Khaled_Hallo_11_02"); //Je�li chodzi o co� wa�nego, porozmawiaj z Lee. Je�li nie, daj mi �wi�ty spok�j.
		AI_StopProcessInfos (self);
	};	
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Khaled_TRADE		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 700;
	condition	= DIA_Khaled_TRADE_Condition;
	information	= DIA_Khaled_TRADE_Info;
	permanent	= TRUE;
	description	= "Jak� bro� mo�esz mi zaoferowa�?";
	trade		= TRUE;
};

func int DIA_Khaled_TRADE_Condition ()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Khaled_TRADE_15_00"); //Jak� bro� mo�esz mi zaoferowa�?
	B_GiveTradeInv (self);
	AI_Output (self, other, "DIA_Khaled_TRADE_11_01"); //Najlepsz�. Tylko popatrz.
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Khaled_WannaJoin		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 10;
	condition	= DIA_Khaled_WannaJoin_Condition;
	information	= DIA_Khaled_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Czy m�g�bym si� do was przy��czy�?";
};

func int DIA_Khaled_WannaJoin_Condition ()
{
	if (Khaled_weiter == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Khaled_WannaJoin_15_00"); //Czy m�g�bym si� do was przy��czy�?
	AI_Output (self, other, "DIA_Khaled_WannaJoin_11_01"); //Je�li przejdziesz pr�b�, zyskasz moje poparcie.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Khaled_WannaJoin_15_02"); //Ju� j� przeszed�em.
		AI_Output (self, other, "DIA_Khaled_WannaJoin_11_03"); //Dobrze, je�li tak, to w porz�dku.
	};
};

// ************************************************************
// 			  				Woher 
// ************************************************************
instance DIA_Khaled_Woher		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 3;
	condition	= DIA_Khaled_Woher_Condition;
	information	= DIA_Khaled_Woher_Info;
	permanent	= FALSE;
	description	= "Jak trafi�e� do najemnik�w?";
};

func int DIA_Khaled_Woher_Condition ()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Woher_Info ()
{
	AI_Output (other, self, "DIA_Khaled_Woher_15_00"); //Jak trafi�e� do najemnik�w?
	AI_Output (self, other, "DIA_Khaled_Woher_11_01"); //Przyby�em tu wraz z Sylviem z po�udnia. Nale�eli�my do armii najemnik�w, kt�rzy walczyli z orkami.
};

// ************************************************************
// 			  				AboutSylvio 
// ************************************************************
instance DIA_Khaled_AboutSylvio		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 4;
	condition	= DIA_Khaled_AboutSylvio_Condition;
	information	= DIA_Khaled_AboutSylvio_Info;
	permanent	= FALSE;
	description	= "Jaka jest twoja opinia na temat Sylvia?";
};

func int DIA_Khaled_AboutSylvio_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info ()
{
	AI_Output (other, self, "DIA_Khaled_AboutSylvio_15_00"); //Jaka jest twoja opinia na temat Sylvia?
	AI_Output (self, other, "DIA_Khaled_AboutSylvio_11_01"); //To bardzo niebezpieczny cz�owiek! I ma pos�uch w�r�d wielu najemnik�w. Lepiej z nim nie zadziera�.
};

// ************************************************************
// 			  				AboutLee 
// ************************************************************
instance DIA_Khaled_AboutLee		(C_INFO)
{
	npc			= SLD_823_Khaled;
	nr          = 5;
	condition	= DIA_Khaled_AboutLee_Condition;
	information	= DIA_Khaled_AboutLee_Info;
	permanent	= FALSE;
	description	= "Jaka jest twoja opinia o Lee?";
};

func int DIA_Khaled_AboutLee_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info ()
{
	AI_Output (other, self, "DIA_Khaled_AboutLee_15_00"); //Jaka jest twoja opinia o Lee?
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_01"); //S�dz�, �e nie interesuje go nic poza wydostaniem si� z tej wyspy.
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_02"); //Chce si� uda� na kontynent. Chyba ma tam z kim� na pie�ku.
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_03"); //Zdecydowanie robi lepsz� robot� ni� Sylvio.
	AI_Output (self, other, "DIA_Khaled_AboutLee_11_04"); //Co wi�cej, to dobry przyw�dca. Przez wi�kszo�� czasu mo�emy robi�, co nam si� �ywnie spodoba.
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Khaled_PICKPOCKET (C_INFO)
{
	npc			= SLD_823_Khaled;
	nr			= 900;
	condition	= DIA_Khaled_PICKPOCKET_Condition;
	information	= DIA_Khaled_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Khaled_PICKPOCKET_Condition()
{
	C_Beklauen (78, 85);
};
 
FUNC VOID DIA_Khaled_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Khaled_PICKPOCKET);
	Info_AddChoice		(DIA_Khaled_PICKPOCKET, DIALOG_BACK 		,DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Khaled_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Khaled_PICKPOCKET);
};
	
func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Khaled_PICKPOCKET);
};























