///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kervo_EXIT   (C_INFO)
{
	npc         = STRF_1116_Kervo;
	nr          = 999;
	condition   = DIA_Kervo_EXIT_Condition;
	information = DIA_Kervo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info wasist
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_WASIST		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	4;
	condition	 = 	DIA_Kervo_WASIST_Condition;
	information	 = 	DIA_Kervo_WASIST_Info;

	description	 = 	"Co� nie tak?";
};

func int DIA_Kervo_WASIST_Condition ()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_WASIST_15_00"); //Co� nie tak?
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_01"); //Naprawd� musisz o to pyta�? Nie wystarczy rozejrze� si� dooko�a?
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_02"); //Odk�d tu przyby�em, ci cholerni topielcy zd��yli si� pojawi� na ca�ej d�ugo�ci rzeki.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_03"); //Na pocz�tku by�o ich tylko dw�ch. Wczoraj widzia�em ju� przynajmniej pi�ciu.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_04"); //Nie mam poj�cia, jak si� st�d wydostan�.
};


///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_HILFE		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	5;
	condition	 = 	DIA_Kervo_HILFE_Condition;
	information	 = 	DIA_Kervo_HILFE_Info;

	description	 = 	"Pr�bowa�e� drogi przez prze��cz?";
};

func int DIA_Kervo_HILFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kervo_WASIST))
		{
				return TRUE;
		};
};
func void DIA_Kervo_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_15_00"); //Pr�bowa�e� drogi przez prze��cz?
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_01"); //Czy wygl�dam na szale�ca? Dwudziestu �o�nierzy nie zdo�a�oby mnie st�d wyci�gn��, dop�ki grasuj� tam te bestie. Nienawidz� ich.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_02"); //Ju� sam ich smr�d wywo�uje u mnie zimne dreszcze. A ich gulgotanie dos�ownie mrozi krew w �y�ach.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_03"); //Je�li tak strasznie chcesz, �eby obdarli ci� ze sk�ry, to prosz� bardzo, id� do nich.

	Info_ClearChoices	(DIA_Kervo_HILFE);
	Info_AddChoice	(DIA_Kervo_HILFE, "Dobrze, a zatem ruszam.", DIA_Kervo_HILFE_tschau );
	Info_AddChoice	(DIA_Kervo_HILFE, "Ale przecie� nie mo�esz tu zosta� na zawsze.", DIA_Kervo_HILFE_ewig );

	if (Kervo_GotStuff == TRUE)
	{
		Info_AddChoice	(DIA_Kervo_HILFE, "Co dostan�, je�li ich zabij�?", DIA_Kervo_HILFE_Problem );
	};

	MIS_Kervo_KillLurker = LOG_RUNNING;
};
func void DIA_Kervo_HILFE_ewig ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_ewig_15_00"); //Ale przecie� nie mo�esz tu zosta� na zawsze.
	AI_Output			(self, other, "DIA_Kervo_HILFE_ewig_13_01"); //Nie mam poj�cia, czego ode mnie chcesz, ale powiem ci tylko jedno: nigdzie si� st�d nie rusz�.
};
var int Kervo_PromiseNugget;
func void DIA_Kervo_HILFE_Problem ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_Problem_15_00"); //Co dostan�, je�li ich zabij�?
	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_01"); //Hm. W zasadzie wystarczy�oby, gdyby� pozby� si� tych topielc�w sprzed jaskini.
	
	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_02"); //Znalaz�em czarny kamie� runiczny. Poniewa� jeste� magiem, z pewno�ci� znajdziesz dla niego jakie� zastosowanie.
	}
	else
	{
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_03"); //Znalaz�em bry�� rudy.
	};

	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_04"); //Dostaniesz j� jako zap�at�.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos (self);
};

func void DIA_Kervo_HILFE_tschau ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_tschau_15_00"); //Dobrze, a zatem ruszam.
	AI_Output			(self, other, "DIA_Kervo_HILFE_tschau_13_01"); //Jasne. Nie b�d� ci� zatrzymywa�.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info LurkerPlatt
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_LurkerPlatt		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_LurkerPlatt_Condition;
	information	 = 	DIA_Kervo_LurkerPlatt_Info;

	description = 	"Pozby�em si� topielc�w sprzed wej�cia do jaskini.";	
};

func int DIA_Kervo_LurkerPlatt_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_RUNNING)
	&& (Npc_IsDead(Kervo_Lurker1))
	&& (Npc_IsDead(Kervo_Lurker2))
	&& (Npc_IsDead(Kervo_Lurker3))
	&& (Npc_IsDead(Kervo_Lurker4))
	&& (Npc_IsDead(Kervo_Lurker5))
	&& (Npc_IsDead(Kervo_Lurker6))
		{
			return TRUE;
		};
};

func void DIA_Kervo_LurkerPlatt_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_LurkerPlatt_15_00"); //Pozby�em si� topielc�w sprzed wej�cia do jaskini.
	AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_01"); //Doskonale. Nareszcie znowu czuj� si� wolny.

	if (Kervo_PromiseNugget == TRUE)
	{
		AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_02"); //Prosz�, zgodnie z obietnic�.
	
		if (hero.guild == GIL_KDF)
		{
			B_GiveInvItems (self, other, ItMi_RuneBlank, 1);					
		}
		else
		{
			B_GiveInvItems (self, other, ItMi_Nugget, 1);					
		};	
	};
	B_GivePlayerXP (XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Vergisses
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_VERGISSES		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_VERGISSES_Condition;
	information	 = 	DIA_Kervo_VERGISSES_Info;
	permanent	 = 	TRUE;

	description = 	"Czy teraz zechcesz przekroczy� prze��cz?";	
};

func int DIA_Kervo_VERGISSES_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Kervo_VERGISSES_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_VERGISSES_15_00"); //Czy teraz zechcesz przekroczy� prze��cz?
	AI_Output			(self, other, "DIA_Kervo_VERGISSES_13_01"); //Nic z tego. Je�li mnie z�api�, zabior� mnie z powrotem do kopalni. Nigdzie si� nie ruszam.
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kervo_PICKPOCKET (C_INFO)
{
	npc			= STRF_1116_Kervo;
	nr			= 900;
	condition	= DIA_Kervo_PICKPOCKET_Condition;
	information	= DIA_Kervo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kervo_PICKPOCKET_Condition()
{
	C_Beklauen (34, 10);
};
 
FUNC VOID DIA_Kervo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kervo_PICKPOCKET);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_BACK 		,DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};
	
func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};









